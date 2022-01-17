package member.jdbc.action;

import member.jdbc.bean.Member;
import member.jdbc.dao.MemberDaoImpl;

public class MemberDaoAction {

	public static void main(String[] args) {
		MemberDaoImpl tdao = new MemberDaoImpl();
		
		//----------------------------------------------------//
//		尋找一筆資料
		Member m = tdao.findMemberByAccount("bb486");//
		
		System.out.println("Name:"+m.getName());
		System.out.println("Account:"+m.getAccount());
		System.out.println("Password:"+m.getPassword());
		System.out.println("Email:"+m.getEmail());
		System.out.println("BirthDate:"+m.getBirthDate());
		System.out.println("Gender:"+m.getGender());
		System.out.println("Address:"+m.getAddress());
		System.out.println("Phone:"+m.getPhone());

	}

}
