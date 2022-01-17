package orders.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import jdbcConnectionUtil.ConnectionUtil;
import orders.jdbc.bean.OrderDetail;
import orders.jdbc.bean.Orders;

public class OrderDaoImpl implements OrdersDao {

	public OrderDaoImpl() {
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ft.setTimeZone(TimeZone.getTimeZone("GMT+8"));
		
		System.out.println("當前時間為: " + ft.format(dNow));
	}

	@Override
	public Orders findOrder(String orderid,String productId) {
		Orders o = new Orders();
		ConnectionUtil connUtil = new ConnectionUtil();
		Connection conn = connUtil.getConnection();
		
		String sql = "select * from orders where Order_id=? and Product_id=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderid);
			pstmt.setString(2, productId);
			
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			o.setOrderId(rs.getString("Order_id"));;
			o.setProductId(rs.getString("Product_id"));;
			o.setBuyAmount(rs.getInt("Buy_amount"));;
			o.setAccount(rs.getString("Account"));;
			o.setOrderDate(rs.getString("Order_date"));;
			o.setPickupDate(rs.getString("Pickup_date"));;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			System.out.println(e.getMessage());// SQL~T
			System.out.println(e.getErrorCode());// SQL~N
			System.out.println("\n---------------------\n");

			e.printStackTrace();
		}
		
		connUtil.free(conn);
		return o;
	}

	@Override
	public List<Orders> findOrderByAccount(String account) {

		List<Orders> list = new ArrayList<Orders>();
		ConnectionUtil connUtil = new ConnectionUtil();
		Connection conn = connUtil.getConnection();
		
		String sql = "select * from orders where Account like ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account+"%");
//			pstmt.setString(1, account);
			ResultSet rs = pstmt.executeQuery();// 建立動態SQL
			
			while(rs.next()) {
				Orders o = new Orders();
				o.setOrderId(rs.getString("Order_id"));;
				o.setProductId(rs.getString("Product_id"));;
				o.setBuyAmount(rs.getInt("Buy_amount"));;
				o.setAccount(rs.getString("Account"));;
				o.setOrderDate(rs.getString("Order_date"));;
				o.setPickupDate(rs.getString("Pickup_date"));;
				list.add(o);
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());// SQL~T
			System.out.println(e.getErrorCode());// SQL~N
			System.out.println("\n---------------------\n");

			e.printStackTrace();
		}// 建立動態SQL
		
		
		
		connUtil.free(conn);
		return list;
	}

	
	
	
	@Override
	public List<OrderDetail> findOrderByOrderIdAndProductId(String OrderId,String ProductId) {

		List<OrderDetail> list = new ArrayList<OrderDetail>();
		ConnectionUtil connUtil = new ConnectionUtil();
		Connection conn = connUtil.getConnection();
		
//		String sql = "select * from orderDetail where Order_id = ? and Product_id = ?";
		String sql = "select * from orderDetail AS O INNER JOIN Products AS P ON O.Product_id =P.product_id where Order_id = ? and O.Product_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, OrderId);
			pstmt.setString(2, ProductId);
//			pstmt.setString(1, account);
			ResultSet rs = pstmt.executeQuery();// 建立動態SQL
			
			while(rs.next()) {
				OrderDetail o = new OrderDetail();
				o.setOrderId(rs.getString("Order_id"));;
//				o.setProductId(rs.getString("Product_id"));;
				o.setBuyAmount(rs.getInt("Buy_amount"));;
				o.setAccount(rs.getString("Account"));;
				o.setOrderDate(rs.getString("Order_date"));;
				o.setPickupDate(rs.getString("Pickup_date"));;
				o.setPickupTime(rs.getString("Pickup_time"));;
				o.setPicker_name(rs.getString("Picker_name"));;
				o.setPhone(rs.getString("phone"));;
				o.setEmail(rs.getString("email"));;
				o.setRemark(rs.getString("Remark"));;
				o.setProduct_name(rs.getString("product_name"));
				list.add(o);
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());// SQL~T
			System.out.println(e.getErrorCode());// SQL~N
			System.out.println("\n---------------------\n");

			e.printStackTrace();
		}// 建立動態SQL
					
		connUtil.free(conn);
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<Orders> findAllOrder() {
		
		List<Orders> list = new ArrayList<Orders>();
		ConnectionUtil connUtil = new ConnectionUtil();
		Connection conn = connUtil.getConnection();
		
		String sql = "select * from orders";
		
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();// 建立動態SQL
			
			while(rs.next()) {
				Orders o = new Orders();
				o.setOrderId(rs.getString("Order_id"));;
				o.setProductId(rs.getString("Product_id"));;
				o.setBuyAmount(rs.getInt("Buy_amount"));;
				o.setAccount(rs.getString("Account"));;
				o.setOrderDate(rs.getString("Order_date"));;
				o.setPickupDate(rs.getString("Pickup_date"));;
				list.add(o);
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());// SQL~T
			System.out.println(e.getErrorCode());// SQL~N
			System.out.println("\n---------------------\n");

			e.printStackTrace();
		}// 建立動態SQL
		
		
		
		connUtil.free(conn);
		return list;
	}

	@Override
	public void insertOrder(Orders o) {
		
		ConnectionUtil connUtil = new ConnectionUtil();
		Connection conn = connUtil.getConnection();
		
		String sql = "insert into orders values(?,?,?,?,?,?);";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, o.getOrderId());
			   pstmt.setString(2, o.getAccount());
			   pstmt.setString(3, o.getProductId());
			   pstmt.setInt(4, o.getBuyAmount());
			   pstmt.setString(5, o.getOrderDate());
			   pstmt.setString(6, o.getPickupDate());
			
			int count = pstmt.executeUpdate();
			
			System.out.println("新增了"+count+"筆");
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());// SQL~T
			System.out.println(e.getErrorCode());// SQL~N
			System.out.println("\n---------------------\n");

			e.printStackTrace();
		}
		
		connUtil.free(conn);
	}

	@Override
	public void updateOrder(Orders o) {
		ConnectionUtil connUtil = new ConnectionUtil();
		Connection conn = connUtil.getConnection();
		
		String sql = "update orders set Buy_amount=?,Account=?,Order_date=?,Pickup_date=? where Order_id=? and Product_id=?;";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(5, o.getOrderId());
			pstmt.setString(6, o.getProductId());
			pstmt.setInt(1, o.getBuyAmount());
			pstmt.setString(2, o.getAccount());
			pstmt.setString(3, o.getOrderDate());
			pstmt.setString(4, o.getPickupDate());
			
			int count = pstmt.executeUpdate();
			
			System.out.println("更新了"+count+"筆");
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());// SQL~T
			System.out.println(e.getErrorCode());// SQL~N
			System.out.println("\n---------------------\n");

			e.printStackTrace();
		}
		
		connUtil.free(conn);

	}

	@Override
	public void deleteOrder(String ordersId, String productId) {
		ConnectionUtil connUtil = new ConnectionUtil();
		Connection conn = connUtil.getConnection();
		
		String sql = "delete from orders where Order_id=? and Product_id=?;";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordersId);
			pstmt.setString(2, productId);

			
			int count = pstmt.executeUpdate();
			
			System.out.println("刪除了"+count+"筆");
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());// SQL~T
			System.out.println(e.getErrorCode());// SQL~N
			System.out.println("\n---------------------\n");

			e.printStackTrace();
		}
		
		connUtil.free(conn);


	}

}
