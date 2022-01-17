package orders.jdbc.action;

import java.util.List;

import orders.jdbc.bean.Orders;
import orders.jdbc.dao.OrderDaoImpl;
import orders.jdbc.dao.OrderDaoService;

public class Test {

	public static void main(String[] args) {
		
		
		//搜尋
//		OrderDaoImpl test = new OrderDaoImpl();
//		Orders testOrder = test.findOrder("bb486202108082","B03");
//		System.out.println(testOrder.getOrderId());
//		System.out.println(testOrder.getProductId());
//		System.out.println(testOrder.getBuyAmount());
//		System.out.println(testOrder.getAccount());
//		System.out.println(testOrder.getOrderDate());
//		System.out.println(testOrder.getPickupDate());
		

		//查詢allOrderDaoImpl test = new OrderDaoImpl();
//		OrderDaoImpl test = new OrderDaoImpl();
//		List<Orders> testOrder = test.findAllOrder();
//		System.out.println("OrderId,ProductId,amount,account,orderDate,pickupDate");
//		for(Orders o :testOrder) {
//			System.out.print(o.getOrderId()+",");
//			System.out.print(o.getProductId()+",");
//			System.out.print(o.getBuyAmount()+",");
//			System.out.print(o.getAccount()+",");
//			System.out.print(o.getOrderDate()+",");
//			System.out.print(o.getPickupDate()+",");
//			System.out.println();
//		}
		
		//新增
//		Orders test = new Orders();
//		test.setOrderId("aa123202101012");
//		test.setProductId("D04");
//		test.setBuyAmount(30);
//		test.setAccount("aa123");
//		test.setOrderDate("2021-01-01");
//		test.setPickupDate("2021-01-03");
//		OrderDaoImpl tdao = new OrderDaoImpl();
//		tdao.insertOrder(test);
		
		//update
//		Orders test = new Orders();
//		test.setOrderId("aa123202101012");
//		test.setProductId("C03");
//		test.setBuyAmount(55);
//		test.setAccount("aa123");
//		test.setOrderDate("2021-01-01");
//		test.setPickupDate("2021-10-03");
//		OrderDaoImpl tdao = new OrderDaoImpl();
//		tdao.updateOrder(test);

		//delete
//		OrderDaoImpl tdao = new OrderDaoImpl();
//		tdao.deleteOrder("bb486202108083","D03");
		
		//===========================================
		//Service Test
		//===========================================
//		搜尋全部訂單
//		OrderDaoService test = new OrderDaoService();
//		test.getAllOrders();
		
		//以OrderId搜尋全部訂單
		OrderDaoService test = new OrderDaoService();
		test.searchOrderByAccount("admin");
		
		
	}

}
