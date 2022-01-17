package orders.jdbc.dao;

import java.util.List;

import orders.jdbc.bean.OrderDetail;
import orders.jdbc.bean.Orders;

public class OrderDaoService {
	//search one order
	public String searchOrderByAccount(String account) {
		if(account == null || account =="") {
			System.out.println("Fail,Account不能為空值");
			return "Fail,Account不能為空值";
		}else{
			OrderDaoImpl tdao = new OrderDaoImpl();
			List<Orders> list = tdao.findOrderByAccount(account);
			System.out.println("Order_id,Product_id,Buy_amount,Account,Order_date,Pickup_date");

			String out = "[";
			int count = 0;
			int totalCount = list.size();
			if(totalCount == 0) {
				System.out.println("Fail，無此OrderId");
				return"Fail，無此OrderId";
			}
			for (Orders o : list) {
				count += 1;
				if (count == totalCount) {
					out += "[\"" + o.getOrderId() + "\",\"" + o.getProductId() + "\"," + o.getBuyAmount() + "" + ",\""
							+ o.getAccount() + "\",\"" + o.getOrderDate() + "\",\"" + o.getPickupDate() + "\"]";
				} else {
					out += "[\"" + o.getOrderId() + "\",\"" + o.getProductId() + "\"," + o.getBuyAmount() + "" + ",\""
							+ o.getAccount() + "\",\"" + o.getOrderDate() + "\",\"" + o.getPickupDate() + "\"],";
				}
			}
			out += "]";
			System.out.println(out);
			return out;
		}
		
	}
	
	
	
	//DetailsOrder
	public String searchDetailsOrderByOrderIdAndProductId(String OrderId,String ProductId) {

			OrderDaoImpl tdao = new OrderDaoImpl();
			List<OrderDetail> list = tdao.findOrderByOrderIdAndProductId(OrderId,ProductId);
			System.out.println("Order_id,Product_id,Buy_amount,Account,Order_date,Pickup_date,Pickup_time,Picker_name,phone,email,Remark,product_name");

			String out = "[";
			int count = 0;
			int totalCount = list.size();
			if(totalCount == 0) {
				System.out.println("Fail searchDetailsOrderByOrderId");
				return"Fail searchDetailsOrderByOrderId";
			}
			for (OrderDetail o : list) {
				count += 1;
				if (count == totalCount) {
					out += "[\"" + o.getOrderId() + "\",\"" + o.getProduct_name() + "\"," + o.getBuyAmount() + "" + ",\""
							+ o.getAccount() + "\",\"" + o.getOrderDate() + "\",\"" + o.getPickupDate()  + "\",\"" + o.getPickupTime()  + "\",\"" + o.getPicker_name()  + "\",\"" + o.getPhone()  + "\",\"" + o.getEmail() + "\",\"" + o.getRemark()  + "\"]";
				} else {
					out += "[\"" + o.getOrderId() + "\",\"" + o.getProduct_name() + "\"," + o.getBuyAmount() + "" + ",\""
							+ o.getAccount() + "\",\"" + o.getOrderDate() + "\",\"" + o.getPickupDate()  + "\",\"" + o.getPickupTime()  + "\",\"" + o.getPicker_name()  + "\",\"" + o.getPhone()  + "\",\"" + o.getEmail() + "\",\"" + o.getRemark()  + "\"],";
				}
			}
			out += "]";
			System.out.println(out);
			return out;
		
		
	}
	
	
	

	// delete Order
	public String DeleteOrder(String OrderId, String ProductID) {
		OrderDaoImpl tdao = new OrderDaoImpl();
		try {
			tdao.deleteOrder(OrderId, ProductID);
			return "刪除成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "刪除失敗";
		}

	}

	// 搜尋全部資料
	public String getAllOrders() {
		OrderDaoImpl tdao = new OrderDaoImpl();
		List<Orders> list = tdao.findAllOrder();
		System.out.println("Order_id,Product_id,Buy_amount,Account,Order_date,Pickup_date");

		String out = "[";
		int count = 0;
		int totalCount = list.size();

		for (Orders o : list) {
			count += 1;
			if (count == totalCount) {
				out += "[\"" + o.getOrderId() + "\",\"" + o.getProductId() + "\"," + o.getBuyAmount() + "" + ",\""
						+ o.getAccount() + "\",\"" + o.getOrderDate() + "\",\"" + o.getPickupDate() + "\"]";
			} else {
				out += "[\"" + o.getOrderId() + "\",\"" + o.getProductId() + "\"," + o.getBuyAmount() + "" + ",\""
						+ o.getAccount() + "\",\"" + o.getOrderDate() + "\",\"" + o.getPickupDate() + "\"],";
			}
		}
		out += "]";
		System.out.println(out);
		return out;
	}

	// insert
	public void insertOrder(String OrderId, String ProductId, String Buy_amount, String Account, String OrderDate,
			String PickupDate) {

		OrderId = OrderId == null ? "" : OrderId;
		ProductId = ProductId == null ? "" : ProductId;
		Buy_amount = Buy_amount == null || Buy_amount == "" ? "0" : Buy_amount;// ���զp�G����J�|���
		Account = Account == null ? "" : Account;
		OrderDate = OrderDate == null ? "" : OrderDate;
		PickupDate = PickupDate == null ? "" : PickupDate;

		Integer BuyAmount = Integer.valueOf(Buy_amount);
		if (OrderId == "" || ProductId == "") {
			System.out.println("錯誤: Order_id或Product_id不能為空值");
		} else {
			Orders test = new Orders();
			test.setOrderId(OrderId);
			test.setProductId(ProductId);
			test.setBuyAmount(BuyAmount);
			test.setAccount(Account);
			test.setOrderDate(OrderDate);
			test.setPickupDate(PickupDate);
			OrderDaoImpl tdao = new OrderDaoImpl();
			tdao.insertOrder(test);
			System.out.println("新增成功");
		}

	}
	
	// insert
		public void updateOrder(String OrderId, String ProductId, String Buy_amount, String Account, String OrderDate,
				String PickupDate) {

			OrderId = OrderId == null ? "" : OrderId;
			ProductId = ProductId == null ? "" : ProductId;
			Buy_amount = Buy_amount == null || Buy_amount == "" ? "0" : Buy_amount;// ���զp�G����J�|���
			Account = Account == null ? "" : Account;
			OrderDate = OrderDate == null ? "" : OrderDate;
			PickupDate = PickupDate == null ? "" : PickupDate;

			Integer BuyAmount = Integer.valueOf(Buy_amount);
			if (OrderId == "" || ProductId == "") {
				System.out.println("錯誤: Order_id或Product_id不能為空值");
			} else {
				Orders test = new Orders();
				test.setOrderId(OrderId);
				test.setProductId(ProductId);
				test.setBuyAmount(BuyAmount);
				test.setAccount(Account);
				test.setOrderDate(OrderDate);
				test.setPickupDate(PickupDate);
				OrderDaoImpl tdao = new OrderDaoImpl();
				tdao.updateOrder(test);
				System.out.println("更新成功");
			}

		}
}
