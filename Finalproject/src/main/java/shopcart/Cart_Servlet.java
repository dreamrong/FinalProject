package shopcart;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/Cart_Servlet/*")
public class Cart_Servlet extends HttpServlet {
 private static final long serialVersionUID = 1L;

 public Cart_Servlet() {
  super();
 }

 protected void doGet(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException {
	 
	  String account = request.getParameter("Account");
	  String product_id = request.getParameter("Product_id");
	  String amount = request.getParameter("Amount");

	  updateOrder(account, product_id, amount);

 }

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException {
	  String account = request.getParameter("Account");
	  String product_id = request.getParameter("Product_id");
	  String amount = request.getParameter("Amount");

	  updateOrder(account, product_id, amount);
 }

 protected void doPut(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException {

  String account = request.getParameter("Account");
  String product_id = request.getParameter("Product_id");
  String amount = request.getParameter("Amount");

  updateOrder(account, product_id, amount);

 }

 protected void doDelete(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException {

  String account = request.getParameter("Account");
  String product_id = request.getParameter("Product_id");

  delOrder(account, product_id);
 }

 private void delOrder(String account, String product_id) {
  Connection conn = getConnection();

  if (conn != null) {
   String sql = "DELETE FROM [dbo].[Carts]\r\n" + "WHERE [Account]=? AND [Product_id]=?";
   try {
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, account);
    pstmt.setString(2, product_id);
    int count = pstmt.executeUpdate();
    System.out.println("刪除" + count + "筆資料");

    free(conn);
   } catch (SQLException e) {
    e.printStackTrace();
   }
  }
 }

 private void updateOrder(String account, String product_id, String amount) {
  Connection conn = getConnection();
  if (conn != null) {
   String sql = "UPDATE [dbo].[Carts]\r\n" + "  SET \r\n" + "      [Amount] = ?\r\n"
     + "WHERE [Account] = ?\r\n" + "      AND [Product_id] = ?;";
   try {
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, Integer.valueOf(amount));
    pstmt.setString(2, account);
    pstmt.setString(3, product_id);

    int count = pstmt.executeUpdate();
    System.out.println("更新了" + count + "筆");
    free(conn);
   } catch (SQLException e) {
    e.printStackTrace();
   }

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
		if(conn!=null) {
			if(conn.isClosed()) {          
				System.out.println("is Closed1");
				return true;
			}else {
				System.out.println("is Closed2");
				conn.close();
				return true;
			}
		}

	}catch(Exception e) {
		e.printStackTrace();
	}
	return false;
	}
 
 
 
 
 
}

