package tw.sure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity 
@Table(name = "Products")
@Component
public class Product {
	
	@Id @Column(name = "product_id")
	private Integer product_id;
	
	@Column(name = "product_name")
	private String product_name;
	
	@Column(name = "product_type")
	private String product_type;
	
	@Column(name = "product_subtype")
	private String product_subtype;
	
	@Column(name = "product_place")
	private String product_place;
	
	@Column(name = "product_price")
	private Integer product_price;
	
	@Column(name = "product_quantity")
	private Integer product_quantity;
	
	@Column(name = "product_inventory")
	private Integer product_inventory;
	
	@Column(name = "product_info1")
	private String product_info1;
	
	@Column(name = "product_info2")
	private String product_info2;
	
	@Column(name = "product_img")
	private byte[]  product_img;
	//private String product_img = "static/gif"; //暫時預設

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_type() {
		return product_type;
	}

	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}

	public String getProduct_subtype() {
		return product_subtype;
	}

	public void setProduct_subtype(String product_subtype) {
		this.product_subtype = product_subtype;
	}

	public String getProduct_place() {
		return product_place;
	}

	public void setProduct_place(String product_place) {
		this.product_place = product_place;
	}

	public Integer getProduct_price() {
		return product_price;
	}

	public void setProduct_price(Integer product_price) {
		if(product_price != null && !"".equals(product_price)) {
			this.product_price = product_price;
		}
	}

	public Integer getProduct_quantity() {
		return product_quantity;
	}

	public void setProduct_quantity(Integer product_quantity) {
		if(product_quantity != null && !"".equals(product_quantity)) {
			this.product_quantity = product_quantity;
		}
	}

	public Integer getProduct_inventory() {
		return product_inventory;
	}

	public void setProduct_inventory(Integer product_inventory) {
		if(product_inventory != null && !"".equals(product_inventory)) {
			this.product_inventory = product_inventory;
		}
	}

	public String getProduct_info1() {
		return product_info1;
	}

	public void setProduct_info1(String product_info1) {
		this.product_info1 = product_info1;
	}

	public String getProduct_info2() {
		return product_info2;
	}

	public void setProduct_info2(String product_info2) {
		this.product_info2 = product_info2;
	}

	public byte[] getProduct_img() {
		return product_img;
	}

	public void setProduct_img(byte[] product_img) {
		this.product_img = product_img;
	}
}
