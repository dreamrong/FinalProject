package iii;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecpay.payment.integration.AllInOne;

//本Servlet用以接收從綠界以POST方法回傳的付款者的付款結果。
@WebServlet(urlPatterns="/ECPayServer2", loadOnStartup=1)
public class ECPayServer2 extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	public static AllInOne all;
	
	public void init() {
		all = new AllInOne("");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
//		PrintWriter out = response.getWriter();

		System.out.printf("【ECPayServer2.java】綠界回傳付款結果通知的POST請求：RequestURL=%s\n", request.getRequestURL());
		//輸出範例：
		//【ECPayServer2.java】綠界回傳付款結果通知的POST請求：RequestURL=https://220.133.xxx.xxx/ecpay/ECPayServer2
		
		Hashtable<String, String> dict = new Hashtable<String, String>();
		Enumeration<String> enumeration = request.getParameterNames();
		while(enumeration.hasMoreElements()) {
			String paramName = enumeration.nextElement();
			String paramValue = request.getParameter(paramName);
			dict.put(paramName, paramValue);			
		}
		System.out.printf("【ECPayServer2.java】綠界所回傳的付款結果通知的參數們：\n%s\n", dict.toString());
		//輸出範例：
		//【ECPayServer2.java】綠界所回傳的付款結果通知的參數們：
		//{CheckMacValue=B396EEB21926992E052C6D3DE2901100F86D0EBC8BA140CD28BE86A887E057B3, 
		//TradeDate=2021/08/13 12:03:32, TradeNo=2108131203323205, MerchantID=2000132, PaymentTypeChargeFee=21, 
		//PaymentType=Credit_CreditCard, TradeAmt=1050, RtnMsg=交易成功, StoreID=, CustomField4=, 
		//MerchantTradeNo=III1628827412565, CustomField3=, PaymentDate=2021/08/13 12:04:17, SimulatePaid=0, CustomField2=, CustomField1=, 
		//RtnCode=1}

		boolean checkStatus = all.compareCheckMacValue(dict); //true：表示資料未被竄改
		//消費者付款成功且檢查碼正確的時候：	(RtnCode:交易狀態(1:成功，其餘為失敗))	
		if ("1".equals(dict.get("RtnCode")) && checkStatus==true ){
			 //---------------------------//
			 //在此撰寫你的處理邏輯
			 //---------------------------//
			 //回應綠界
//			request.setAttribute("Order_id", dict.get("MerchantTradeNo"));

//			response.sendRedirect("http://192.168.0.100:8080/Finalproject/CartStep4.jsp?Order_id="+dict.get("MerchantTradeNo"));
			response.sendRedirect("http://localhost:8080/Finalproject/CartStep4.jsp?Order_id="+dict.get("MerchantTradeNo"));
//			request.getRequestDispatcher("../Finalproject/CartStep4.jsp").forward(request, response);
//			request.getRequestDispatcher("ECPayClient.html").forward(request, response);
								
//			 out.print("1|OK");
		}
		
		//還沒寫>>若付款失敗，則刪除資料庫中的那幾筆訂單
	}	
}


