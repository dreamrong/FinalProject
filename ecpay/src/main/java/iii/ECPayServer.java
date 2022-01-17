package iii;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

/*
 * 1. ecpay.payment.integration.AllInOneBase.java 
 *  	需啟用 *when using web project* 下面三行 + try..catch..
 * 		並禁用 *when using testing code* 下面二行 
 * 2. paymet_conf.xml 放src/main/java資料夾下
 * 3. ecpay.payment.integration.domain.AioCheckOutALL.java
 * 	  private String ChoosePayment = "ALL" 改為 "Credit" (只用信用卡付款)  
 */

@WebServlet(urlPatterns="/ECPayServer", loadOnStartup=1)
public class ECPayServer extends HttpServlet {
	private static final long serialVersionUID = 1L;       
	private static AllInOne all;
	
	
    public void init() {
    	all = new AllInOne("");    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");		
		PrintWriter out = response.getWriter();
		
		String form = genAioCheckOutALL(request);
		System.out.printf("ECPayServer.java 產生了讓消費者付款的表單：\n%s",form);	
	
		//輸出內容請參考最下面區段。		
		out.print(form); 	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private String genAioCheckOutALL(HttpServletRequest request){
		
		
		/*insert訂單資料庫*/
		String[] Product_id = request.getParameterValues("Product_id");
		String[] Buy_amount = request.getParameterValues("Buy_amount");
		String Account = request.getParameter("Account");
		String Picker_name = request.getParameter("Picker_name");
		String Phone = request.getParameter("Phone");
		String Email = request.getParameter("Email");
		String Pickup_date = request.getParameter("Pickup_date");
		String Pickup_time = request.getParameter("Pickup_time");
		String Remark = request.getParameter("Remark");
		String Order_id = String.format("FN%d%d%d%d%d", new Date().getTime(), (int)(Math.random()*10), (int)(Math.random()*10), (int)(Math.random()*10), (int)(Math.random()*10));
		String Order_date = String.format("%tY-%<tm-%<td", new Date() );
		
		//新增至SQL order
		insertOrder(Order_id,Product_id,Buy_amount,Account,Order_date,Pickup_date);
		//新增至SQL orderDetail
		insertorderDetail(Order_id,Product_id,Buy_amount,Account,Order_date,Pickup_date,Pickup_time,Picker_name,Phone,Email,Remark);
		//更新至SQL product-修改庫存數量
		updateOrder(Product_id, Buy_amount);
		
	
		
		AioCheckOutALL obj = new AioCheckOutALL();
		//下列三項設定於payment_conf.xml
		//<MerchantID>2000132</MerchantID>
        //<HashKey>5294y06JbISpM5x9</HashKey>
        //<HashIV>v77hoKGq4kWxNNIS</HashIV>
		obj.setMerchantTradeNo(Order_id);	//特店交易編號均為唯一值，不可重複使用。英數字大小寫混合。
		obj.setMerchantTradeDate(String.format("%tY/%<tm/%<td %<tH:%<tM:%<tS", new Date() ) );	//特店交易時間。格式為：yyyy/MM/dd HH:mm:ss。
		
		obj.setTotalAmount( request.getParameter("TotalAmount") );	//交易金額。請帶整數，不可有小數點。僅限新台幣。
		obj.setTradeDesc( request.getParameter("TradeDesc") );		//交易描述。請勿帶入特殊字元。
		obj.setItemName( request.getParameter("ItemName") );		//商品名稱 
																	//1. 如果商品名稱有多筆，需在金流選擇頁一行一行顯示商品名稱的話，商品名稱請以符號#分隔。
																	//2. 商品名稱字數限制為中英數 400 字內，超過此限制系統將自動截斷。
		obj.setReturnURL("https://192.168.0.100:8080/ecpay/ECPayServer2"); //付款完成通知回傳網址。當消費者付款完成後，綠界會將付款結果參數以幕後(Server POST)回傳到該網址。
//		obj.setOrderResultURL("http://192.168.0.100:8080/ecpay/ECPayServer2"); //付款完成通知回傳網址。當消費者付款完成後，綠界會將付款結果參數以幕前(Server POST)回傳到該網址。
		obj.setOrderResultURL("http://localhost:8080/ecpay/ECPayServer2"); //付款完成通知回傳網址。當消費者付款完成後，綠界會將付款結果參數以幕前(Server POST)回傳到該網址。
		/* 請添加下列區段到Tomcat's「server.xml」，使之支援HTTPS。
		 * ------------------------------------------------------------------------------
		 * <Connector protocol="org.apache.coyote.http11.Http11NioProtocol" 
		 * port="443" maxThreads="200" scheme="https" secure="true" SSLEnabled="true"
		 * keystoreFile="C:\_jsp-ide\_JSSE(Java Secure Socket Extension)/mykeystore.jks" 
		 * keystorePass="123456"
		 * clientAuth="false" sslProtocol="TLS"/>
		 * ------------------------------------------------------------------------------
		 * server.xml所在位置：
		 * 生產環境：Tomcat安裝路徑>conf>server.xml
		 * 開發環境：Servers>「Tomcat v9.0 Server at localhost-config」>server.xml
		 */
		obj.setNeedExtraPaidInfo("N");
		
		String form = all.aioCheckOut(obj, null);		
		return form;
		//綠界付款表單的基本要求：
		//1.action="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5" (設定於~.config.EcpayPayment.xml)
		//2.enctype="application/x-www-form-urlencoded"
		//3.method="POST"
	}    


//程式測試流程：
//用戶端在ECPayClient.html頁面按下「結帳」按鈕
//->Request to 伺服端：/ECPayServer
//->Response to 用戶端：提交綠界的表單(如最下面)->表單被瀏覽器渲染後會自動執行form.Submit()
//->Request to 綠界：https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5
//->Response to 用戶端：付款畫面(請參考"C:\_ecpay(java)\綠界的「信用卡付款」UI樣例.docx)>用戶端填寫信用卡資料與手機號碼後，按下「立即付款」按鈕
//->Request to 綠界： https://pay-stage.ecpay.com.tw/CreditPayment/VerifySMS?PostDictionary=fba0dab7cb3299b3351915e6ace43007408b90a0fda8c3cd352781753daced360416983a31d1516d44552b754c3152217731661060bf07d1dd1c25ec72e41db5
//->Response to 用戶端：簡訊OTP輸入畫面>用戶端按下「送出驗證」按鈕
//->Request to 綠界：https://payment-stage.ecpay.com.tw/bank/PaymentCenter/cntnotlogin/credit/result
//->Response to 用戶端：付款結果(付款成功)	

//ECPayServer.java 產生了讓消費者付款的表單：
//<form id="allPayAPIForm" action="https://payment-stage.ecPay.com.tw/Cashier/AioCheckOut/V5" method="post">
//<input type="hidden" name="NeedExtraPaidInfo" value="N">
//<input type="hidden" name="ReturnURL" value="https://220.133.xxx.xxx/ecpay/ECPayServer2">
//<input type="hidden" name="BidingCard" value="">
//<input type="hidden" name="CheckMacValue" value="BDC451280FF53B39E9CBB401A8FE8E1DDC9A924329C4484538C8D797AD038030">
//<input type="hidden" name="StoreExpireDate" value=""><input type="hidden" name="PeriodAmount" value=""><input type="hidden" name="PaymentInfoURL" value=""><input type="hidden" name="ClientRedirectURL" value=""><input type="hidden" name="StoreID" value=""><input type="hidden" name="EncryptType" value="1"><input type="hidden" name="IgnorePayment" value=""><input type="hidden" name="CreditInstallment" value=""><input type="hidden" name="PaymentType" value="aio"><input type="hidden" name="OrderResultURL" value=""><input type="hidden" name="PeriodReturnURL" value=""><input type="hidden" name="PlatformID" value=""><input type="hidden" name="MerchantMemberID" value=""><input type="hidden" name="Frequency" value=""><input type="hidden" name="ExpireDate" value=""><input type="hidden" name="ItemName" value="馬桶刷850元x1#消毒水200元"><input type="hidden" name="InvoiceMark" value="N"><input type="hidden" name="ExecTimes" value=""><input type="hidden" name="ChoosePayment" value="Credit">
//<input type="hidden" name="MerchantID" value="2000132">
//<input type="hidden" name="TradeDesc" value="刷兩三下就光亮如新"><input type="hidden" name="ClientBackURL" value=""><input type="hidden" name="PeriodType" value=""><input type="hidden" name="CustomField4" value=""><input type="hidden" name="Desc_4" value=""><input type="hidden" name="TotalAmount" value="1050"><input type="hidden" name="CustomField3" value=""><input type="hidden" name="Desc_3" value=""><input type="hidden" name="CustomField2" value=""><input type="hidden" name="Desc_2" value="">
//<input type="hidden" name="MerchantTradeDate" value="2021/08/13 11:29:53"><input type="hidden" name="CustomField1" value=""><input type="hidden" name="Desc_1" value=""><input type="hidden" name="ChooseSubPayment" value=""><input type="hidden" name="UnionPay" value=""><input type="hidden" name="InstallmentAmount" value="">
//<input type="hidden" name="MerchantTradeNo" value="III1628825393968"><input type="hidden" name="ItemURL" value=""><input type="hidden" name="Remark" value=""><input type="hidden" name="DeviceSource" value=""><input type="hidden" name="Language" value=""><input type="hidden" name="Redeem" value="">
//<script language="JavaScript">allPayAPIForm.submit()</script></form>


	
	
	////////////////////////////////////////////////////////////////////
	
	
	 private void insertOrder(String Order_id, String[] Product_id, String[] Buy_amount, String Account, String Order_date, String Pickup_date) {
		 String sql="INSERT INTO [dbo].[orders]\r\n"
				 + "([Order_id], \r\n"
				 + " [Account], \r\n"
				 + " [Product_id], \r\n"
				 + " [Buy_amount], \r\n"
				 + " [Order_date], \r\n"
				 + " [Pickup_date]\r\n"
				 + ")\r\n"
				 + "VALUES\r\n"
				 + "(?, \r\n"
				 + "?, \r\n"
				 + "?, \r\n"
				 + "?, \r\n"
				 + "?, \r\n"
				 + "?\r\n"
				 + ");";
		  
		 
			  try {
			  
				  
				  for(int i=0;i<Product_id.length;i++) {
					  Connection conn = getConnection();	
					  if(conn!=null) {
						  PreparedStatement pstmt = conn.prepareStatement(sql);
						  pstmt.setString(1, Order_id);
						  pstmt.setString(2, Account);
						  pstmt.setString(3, Product_id[i]);
						  pstmt.setString(4, Buy_amount[i]);
						  pstmt.setString(5, Order_date);
						  pstmt.setString(6, Pickup_date);				  
						  int count = pstmt.executeUpdate();
						  System.out.println("更新了" + count + "筆訂單");
						  free(conn);					  
					  }

				  }
				  
		   } catch (SQLException e) {
		    e.printStackTrace();
		   }
		};

	 
	 

	 private void insertorderDetail(String Order_id, String[] Product_id, String[] Buy_amount, String Account, String Order_date, String Pickup_date, String Pickup_time, String Picker_name, String Phone, String Email, String Remark) {
		 String sql="INSERT INTO [dbo].[orderDetail]\r\n"
		 		+ "([Order_id]\r\n"
		 		+ ",[Account]\r\n"
		 		+ ",[Product_id]\r\n"
		 		+ ",[Buy_amount]\r\n"
		 		+ ",[Order_date]\r\n"
		 		+ ",[Pickup_date]\r\n"
		 		+ ",[Pickup_time]\r\n"
		 		+ ",[Picker_name]\r\n"
		 		+ ",[phone]\r\n"
		 		+ ",[email]\r\n"
		 		+ ",[Remark])\r\n"
				 + "VALUES\r\n"
				 + "(?, \r\n"
				 + "?, \r\n"
				 + "?, \r\n"
				 + "?, \r\n"
				 + "?, \r\n"
				 + "?, \r\n"
				 + "?, \r\n"			 
				 + "?, \r\n"
				 + "?, \r\n"
				 + "?, \r\n"
				 + "?\r\n"
				 + ");";
		  		 
			  try {			 				  
				  for(int i=0;i<Product_id.length;i++) {
					  Connection conn = getConnection();	
					  if(conn!=null) {
						  PreparedStatement pstmt = conn.prepareStatement(sql);
						  pstmt.setString(1, Order_id);
						  pstmt.setString(2, Account);
						  pstmt.setString(3, Product_id[i]);
						  pstmt.setString(4, Buy_amount[i]);
						  pstmt.setString(5, Order_date);
						  pstmt.setString(6, Pickup_date);				  
						  pstmt.setString(7, Pickup_time);				  
						  pstmt.setString(8, Picker_name);				  
						  pstmt.setString(9, Phone);				  
						  pstmt.setString(10, Email);				  
						  pstmt.setString(11, Remark);				  
						  int count = pstmt.executeUpdate();
						  System.out.println("更新了" + count + "筆訂單");
						  free(conn);					  
					  }
				  }				  
		   } catch (SQLException e) {
		    e.printStackTrace();
		   }
		};
	 
	 

		
		 private void updateOrder(String[] Product_id, String[] Buy_amount) {
			 String sql="SELECT[product_inventory]\r\n"
			 		+ "FROM [dbo].[Products]\r\n"
			 		+ "WHERE [product_id] = ?";
			 String sql2 = "UPDATE [dbo].[Products]\r\n"
			 		+ "SET [product_inventory] = ?\r\n"
			 		+ "WHERE [product_id] =?";
			 
				  try {				 					  
					  for(int i=0;i<Product_id.length;i++) {
						  Connection conn = getConnection();	
						  if(conn!=null) {
							  PreparedStatement pstmt = conn.prepareStatement(sql);
							  pstmt.setString(1, Product_id[i]);
							  ResultSet rs = pstmt.executeQuery();
							  rs.next();
							  int product_inventory = rs.getInt("product_inventory");
							  int updateInt =product_inventory-(Integer.parseInt(Buy_amount[i]));
							  PreparedStatement pstmt1 = conn.prepareStatement(sql2);
							  pstmt1.setInt(1, updateInt);
							  pstmt1.setString(2, Product_id[i]);
							  int count = pstmt1.executeUpdate();
							  System.out.println("更新了" + count + "筆訂單");
							  
							  free(conn);					  
						  }
					  }					  
			   } catch (SQLException e) {
			    e.printStackTrace();
			   }
			}
		
		
	 

private Connection getConnection() {
	  Connection conn = null;
	  try {
	   DataSource ds = getDataSource();
	   if (ds != null)
	    conn = ds.getConnection();

	  } catch (SQLException e) {
	   e.printStackTrace();
	  }
	  return conn;
	 }

	 private DataSource getDataSource() {
	  DataSource ds = null;
	  try {
	   InitialContext ic = new InitialContext();
	   Context context = (Context) ic.lookup("java:comp/env");
	   ds = (DataSource) context.lookup("jdbc/iii_finalproject");
	  } catch (NamingException e) {
	   e.printStackTrace();
	  }
	  return ds;
	 }
	 
	 
	 public boolean free(Connection conn) {
		 
		 try {
			 if (conn != null) {
				 if (conn.isClosed()) {
					 System.out.println("is Closed1");
					 return true;
				 } else {
					 System.out.println("is Closed2");
					 conn.close();
					 return true;
				}
			}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return false;
		}
}
