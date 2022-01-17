package member.jdbc.dao;

import java.util.List;

import member.jdbc.bean.Member;

public class MemberDaoService {

	public MemberDaoService() {

	}

	// 用於註冊畫面驗證帳號是否可以註冊，並無重複帳號
	public String signAccountOAuth(String account) {

		if (account == null || account == "") {
			System.out.println("Fail,未輸入帳號!");
			return "Fail,未輸入帳號!";
		}

		MemberDaoImpl tdao = new MemberDaoImpl();

		Member m = tdao.findMemberByAccount(account);//
		String reAccount = m.getAccount();

		if (reAccount == null) {
			System.out.println("Success,該帳號尚未註冊!");
			return "Success,該帳號尚未註冊!";
		} else if (reAccount != "") {
			System.out.println("Fail,該帳號已註冊過");
			return "Fail,該帳號已註冊過";
		} else {
			System.out.println("Fail,發生不可預期的錯誤");
			return "Fail,發生不可預期的錯誤";
		}

	}

	// 用於忘記密碼。輸入帳號，回傳該帳號所有資訊。
	public String getSinglaMember(String account) {
		if (account == null) {
			System.out.println("登入失敗!");
			return "Fail,未輸入帳號密碼!";
		} else {
			MemberDaoImpl tdao = new MemberDaoImpl();

			// ----------------------------------------------------//
//			尋找一筆資料
			Member m = tdao.findMemberByAccount(account);//

			System.out.println("Name:" + m.getName());
			System.out.println("Account:" + m.getAccount());
			System.out.println("Password:" + m.getPassword());
			System.out.println("Email:" + m.getEmail());
			System.out.println("BirthDate:" + m.getBirthDate());
			System.out.println("Gender:" + m.getGender());
			System.out.println("Address:" + m.getAddress());
			System.out.println("Phone:" + m.getPhone());
			System.out.println("Status:" + m.getStatus());

			if (m.getAccount() != null) {
				System.out.println("-----------");
				System.out.println("通過驗證，有此會員");

				return "Success," + m.getName() + "," + m.getStatus() + "," + m.getAccount() + "," + m.getPassword()
						+ "," + m.getEmail()+ "," + m.getBirthDate()+ "," + m.getGender()+ "," + m.getAddress()+ "," + m.getPhone();

			} else {
				System.out.println("-----------");
				System.out.println("驗證失敗，無此會員");
				return "Fail";
			}

		}

	}

	// 登入畫面驗證是否會員身分
	public String OAuthMember(String account, String password) {
		if (account == null || password == null) {
			System.out.println("登入失敗!");
			return "未輸入帳號密碼!";
		} else {
			MemberDaoImpl tdao = new MemberDaoImpl();

			// ----------------------------------------------------//
//			尋找一筆資料
			Member m = tdao.findMemberByAccount(account);//

			System.out.println("Name:" + m.getName());
			System.out.println("Account:" + m.getAccount());
			System.out.println("Password:" + m.getPassword());
			System.out.println("Email:" + m.getEmail());
			System.out.println("BirthDate:" + m.getBirthDate());
			System.out.println("Gender:" + m.getGender());
			System.out.println("Address:" + m.getAddress());
			System.out.println("Phone:" + m.getPhone());
			System.out.println("Status:" + m.getStatus());

			if (m.getAccount() != null) {
				System.out.println("-----------");
				System.out.println("通過驗證，有此會員");
				if (password.equals(m.getPassword())) {
					return "Success," + m.getName() + "," + m.getStatus() + "," + m.getAccount() + "," + m.getPassword()
							+ "," + m.getEmail();
				} else {
					System.out.println("-----------");
					System.out.println("密碼錯誤");
					return "Fail";
				}

			} else {
				System.out.println("-----------");
				System.out.println("驗證失敗，無此會員");
				return "Fail";
			}

		}

	}

	// 註冊管理員專用
	public void signUp(String name, String account, String password, String email, String birthdate, String gender,
			String address, String phone) {

		name = name == null ? "" : name;
		account = account == null ? "" : account;
		password = password == null ? "" : password;
		email = email == null ? "" : email;
		birthdate = birthdate == null ? "" : birthdate;
		gender = gender == null ? "" : gender;
		address = address == null ? "" : address;
		phone = phone == null ? "" : phone;

		MemberDaoImpl tdao = new MemberDaoImpl();
		Member m = new Member();
		m.setName(name);
		m.setAccount(account);
		m.setPassword(password);
		m.setEmail(email);
		m.setBirthDate(birthdate);
		m.setGender(gender);
		m.setAddress(address);
		m.setPhone(phone);

		tdao.insertMember(m, "member");

	}

	// 註冊管理員專用
	public void createAdmin(String name, String account, String password, String email, String birthdate, String gender,
			String address, String phone) {

		name = name == null ? "" : name;
		account = account == null ? "" : account;
		password = password == null ? "" : password;
		email = email == null ? "" : email;
		birthdate = birthdate == null ? "" : birthdate;
		gender = gender == null ? "" : gender;
		address = address == null ? "" : address;
		phone = phone == null ? "" : phone;

		MemberDaoImpl tdao = new MemberDaoImpl();
		Member m = new Member();
		m.setName(name);
		m.setAccount(account);
		m.setPassword(password);
		m.setEmail(email);
		m.setBirthDate(birthdate);
		m.setGender(gender);
		m.setAddress(address);
		m.setPhone(phone);

		tdao.insertMember(m, "admin");

	}

	public String getAllMember() {
		MemberDaoImpl tdao = new MemberDaoImpl();
		List<Member> list = tdao.findAllMember();
		System.out.println("Name\tAccount\tPassword\tEmail\tBirthDate\tGender\tAddress\tPhone\tStatus");
		String out = "[";
		int count = 0;
		int totalCount = list.size();
		for (Member member : list) {
			count = count + 1;
//			System.out.println(member.getName()+","+member.getAccount()+","+member.getPassword()+","+
//			member.getEmail()+","+member.getBirthDate()+","+member.getGender()+","+member.getAddress()
//			+","+member.getPhone()+","+member.getStatus());
			if (count == totalCount) {
//				out += ("[" + member.getName() + "," + member.getAccount() + "," + member.getPassword() + ","
//						+ member.getEmail() + "," + member.getBirthDate() + "," + member.getGender() + ","
//						+ member.getAddress() + "," + member.getPhone() + "," + member.getStatus() + "]");

				out += ("[" + "\"" + member.getName() + "\"" + "," + "\"" + member.getAccount() + "\"" + "," + "\""
						+ member.getPassword() + "\"" + "," + "\"" + member.getEmail() + "\"" + "," + "\""
						+ member.getBirthDate() + "\"" + "," + "\"" + member.getGender() + "\"" + "," + "\""
						+ member.getAddress() + "\"" + "," + "\"" + member.getPhone() + "\"" + "," + "\""
						+ member.getStatus() + "\"" + "]");
//				System.out.println("count="+count+"; totalCount="+totalCount+";"+(count == totalCount));
			} else {
				out += ("[" + "\"" + member.getName() + "\"" + "," + "\"" + member.getAccount() + "\"" + "," + "\""
						+ member.getPassword() + "\"" + "," + "\"" + member.getEmail() + "\"" + "," + "\""
						+ member.getBirthDate() + "\"" + "," + "\"" + member.getGender() + "\"" + "," + "\""
						+ member.getAddress() + "\"" + "," + "\"" + member.getPhone() + "\"" + "," + "\""
						+ member.getStatus() + "\"" + "],");

//				System.out.println("count="+count+"; totalCount="+totalCount+";"+(count == totalCount));
			}
		}

		out += "]";
		System.out.println(out);
		return out;
	}

	public String deleteMember(String account) {

		try {
			MemberDaoImpl de = new MemberDaoImpl();
			de.deleteMember(account);
			return "刪除成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "刪除失敗";
		}

	}

	// 更新資料
	public String updateMember(String name, String account, String password, String email, String birthdate,
			String gender, String address, String phone, String Status) {
		try {
			Member m = new Member();
			m.setName(name);
			m.setAccount(account);
			m.setPassword(password);
			m.setEmail(email);
			m.setBirthDate(birthdate);
			m.setGender(gender);
			m.setAddress(address);
			m.setPhone(phone);
			m.setStatus(Status);

			MemberDaoImpl update = new MemberDaoImpl();
			update.updateMember(m);

			return "更新成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "更新失敗";
		}
	}

}
