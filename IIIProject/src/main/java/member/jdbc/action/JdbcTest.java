package member.jdbc.action;

import java.sql.Connection;
import java.util.List;

import jdbcConnectionUtil.ConnectionUtil;
import member.jdbc.bean.Member;
import member.jdbc.dao.MemberDaoImpl;
import member.jdbc.dao.MemberDaoService;

public class JdbcTest {

	public static void main(String[] args) {

//		ConnectionUtil connUtil = new ConnectionUtil();// 自製的class，要連線哪個SQL資料表
//		Connection conn = connUtil.getConnection();
//		connUtil.free(conn);

////	//查詢會員
		MemberDaoService test = new MemberDaoService();
		System.out.println(test.OAuthMember("bb4866","1234"));

		//註冊一般會員
//		MemberDaoService test = new MemberDaoService();
//		test.signUp("Mary","cc578","456","hello@gmail.com","2009-01-01","女","水星村87號","01111111");

////	註冊管理員理員
//		MemberDaoService test = new MemberDaoService();
//		test.createAdmin("John","dd565","456","hello@gmail.com","2009-01-01","女","水星村87號","01111111");

		
		
		//尋找多筆資料塞成一個array
//		MemberDaoImpl tdao = new MemberDaoImpl();
//		List<Member> list = tdao.findAllMember();
//		System.out.println("Name\tAccount\tPassword\tEmail\tBirthDate\tGender\tAddress\tPhone\tStatus");
//		for (Member member : list) {
//			
////			System.out.println(member.getName()+"\t"+member.getAccount()+"\t"+member.getPassword()+"\t"+
////			member.getEmail()+"\t"+member.getBirthDate()+"\t"+member.getGender()+"\t"+member.getAddress()
////			+"\t"+member.getPhone()+"\t"+member.getStatus());
////			
//			System.out.println(member.getName()+","+member.getAccount()+","+member.getPassword()+","+
//					member.getEmail()+","+member.getBirthDate()+","+member.getGender()+","+member.getAddress()
//					+","+member.getPhone()+","+member.getStatus());
//		}
		
		//使用service做出全部會員資料的array
//		MemberDaoService test = new MemberDaoService();
//		test.getAllMember();
		
		//刪除會員
//		MemberDaoImpl de = new MemberDaoImpl();
//		de.deleteMember("aa78789898tw@gmail.com");
		
//		//刪除會員		
//		MemberDaoService de = new MemberDaoService();
//		String res = de.deleteMember("145466");
//		System.out.println(res);
		
//		//從註冊畫面驗證該會員是否已經註冊
//		MemberDaoService m = new MemberDaoService();
//		String s = m.signAccountOAuth("test0222");
//		System.out.println("Service return="+s);
		
//		============================================
		
	}

}
