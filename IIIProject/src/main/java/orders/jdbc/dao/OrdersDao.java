package orders.jdbc.dao;

import java.util.List;

import orders.jdbc.bean.OrderDetail;
import orders.jdbc.bean.Orders;

public interface OrdersDao {

	//Read
	Orders findOrder(String orderid,String productId);
	//ReadByAccount
	List<Orders>  findOrderByAccount(String account);
	//Read All
	List<Orders> findAllOrder();

	//Create
	void insertOrder(Orders o);
	
	//update
	void updateOrder(Orders o);
	
	//delete
	void deleteOrder(String ordersId,String productId);
	
	//ReadByOrderId
	List<OrderDetail>  findOrderByOrderIdAndProductId(String OrderId,String ProductId);
}
