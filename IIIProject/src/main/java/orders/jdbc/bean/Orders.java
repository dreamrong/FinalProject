package orders.jdbc.bean;

public class Orders {

	private String orderId;
	private String productId;
	private Integer buyAmount;
	private String account;
	private String orderDate;
	private String pickupDate;
	

	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public Integer getBuyAmount() {
		return buyAmount;
	}
	public void setBuyAmount(Integer buyAmount) {
		this.buyAmount = buyAmount;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getPickupDate() {
		return pickupDate;
	}
	public void setPickupDate(String pickupDate) {
		this.pickupDate = pickupDate;
	}

}
