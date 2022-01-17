package shopcart;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/Cart_Order_Servlet/*")
public class Cart_Order_Servlet extends HttpServlet {
 private static final long serialVersionUID = 1L;

 public Cart_Order_Servlet() {
  super();
 }

 protected void doGet(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException {
	 response.setContentType("application/json;charset=utf-8");
	 response.setHeader("Access-Control-Allow-Origin", "*");
	 PrintWriter out = response.getWriter();
	 
	 String responseText = "{ \"query-status\": \"fail\" }";
	 String Order_id = request.getParameter("Order_id");


	 responseText= getOrder(Order_id);		 
		 	 
	 out.print(responseText);

 }

 

 ///////////////////////////////////////////////////////////////////////////////
 private String getOrder(String Order_id) {
	 String returnText = "null";
	  Connection conn = getConnection();
	  if (conn != null) {
		  String sql="SELECT O.[Order_id]\r\n"
		  		+ "  ,O.[Product_id]\r\n"
		  		+ "  ,O.[Buy_amount]\r\n"
		  		+ "  ,O.[Account]\r\n"
		  		+ "  ,O.[Order_date]\r\n"
		  		+ "  ,O.[Pickup_date]\r\n"
		  		+ "  ,O.[Pickup_time]\r\n"
		  		+ "  ,O.[Picker_name]\r\n"
		  		+ "  ,O.[phone]\r\n"
		  		+ "  ,O.[email]\r\n"
		  		+ "  ,O.[Remark]\r\n"
		  		+ "  ,P.product_name\r\n"
		  		+ "  ,P.product_price\r\n"
		  		+ "  ,P.product_info1\r\n"
		  		+ "  ,P.product_img\r\n"
		  		+ "  ,M.[Name]\r\n"
		  		+ "  ,M.[Email]\r\n"
		  		+ "  ,M.[Phone]\r\n"
		  		+ "  FROM [dbo].[orderDetail] AS O INNER JOIN [dbo].[Products] AS P ON O.Product_id =P.product_id\r\n"
		  		+ "         INNER JOIN [dbo].[member] AS M ON O.Account =M.Account\r\n"
		  		+ "  WHERE O.[Order_id]=?;";
		  
		  try {
		  
			  
			  PreparedStatement pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, Order_id);
			  ResultSet rs = pstmt.executeQuery();
//			  System.out.println("rs");
			  returnText = resultSetToJsonArray(rs);
			  
//	    int count = pstmt.executeUpdate();
//
//	    System.out.println("找到了" + count + "單訂單");
	    free(conn);
	   } catch (SQLException e) {
	    e.printStackTrace();
	   }

	  }
	return returnText;
	}
 

 
	private String resultSetToJsonArray(ResultSet rs) {
		String returnText = "null";
		try {
			ResultSetMetaData rsmd = rs.getMetaData();
			JSONArray jsonArray = new JSONArray();

			while (rs.next()) {
				JSONObject jsonObject = new JSONObject();

				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					String colName = rsmd.getColumnName(i);
					String colValue = null;
					int colType = rsmd.getColumnType(i);
					switch (colType) {
					case Types.TIME:
						colValue = String.format("%tH:%<tM", rs.getTime(i));
						break;
//					case Types.TIMESTAMP:
//						colValue = String.format("%tY/%<tm/%<td %<tH:%<tM:%<tS", rs.getTimestamp(i));
					case Types.DATE:
						colValue = String.format("%tY-%<tm-%<td", rs.getDate(i));
						break;
					default:
						colValue = rs.getString(i);
					}

					jsonObject.put(colName, colValue);
				}

				jsonArray.put(jsonObject);
			}

			returnText = jsonArray.toString();

		} catch (SQLException | JSONException e) {
			e.printStackTrace();
		}

		return returnText;
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
				System.out.println("is Closed3");
				return true;
			}else {
				System.out.println("is Closed4");
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

