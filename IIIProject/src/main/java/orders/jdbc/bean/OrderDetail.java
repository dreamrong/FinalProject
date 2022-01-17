package orders.jdbc.bean;

public class OrderDetail {

	private String orderId;
	private String productId;
	private Integer buyAmount;
	private String account;
	private String orderDate;
	private String pickupDate;

	private String PickupTime;
	private String Picker_name;
	private String phone;
	private String email;
	private String Remark;
	
	private String product_name;

	

	

	public OrderDetail() {
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

	public String getPickupTime() {
		return PickupTime;
	}

	public void setPickupTime(String pickupTime) {
		PickupTime = pickupTime;
	}

	public String getPicker_name() {
		return Picker_name;
	}

	public void setPicker_name(String picker_name) {
		Picker_name = picker_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRemark() {
		return Remark;
	}

	public void setRemark(String remark) {
		Remark = remark;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	
	
	
	
	
	

}
