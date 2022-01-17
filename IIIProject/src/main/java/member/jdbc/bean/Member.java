package member.jdbc.bean;

public class Member {
	private String name ;
	private String account;
	private String password;
	private String email;
	private String birthDate;
	private String gender;
	private String address;
	private String phone;
	private String status;

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String name, String account, String password, String email, String birthDate, String gender,
			String address, String phone) {
		super();
		this.name = name;
		this.account = account;
		this.password = password;
		this.email = email;
		this.birthDate = birthDate;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
