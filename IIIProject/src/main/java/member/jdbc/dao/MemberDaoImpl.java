package member.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import jdbcConnectionUtil.ConnectionUtil;
import member.jdbc.bean.Member;
import member.springDemo.LogAdvice;

public class MemberDaoImpl implements MemberDao {

	public MemberDaoImpl() {
		super();
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		LogAdvice logAdvice = context.getBean("logAdvice", LogAdvice.class);
		logAdvice.log();
		context.close();

	}

	@Override
	public Member findMemberByAccount(String account) {
		Member m = new Member();

		ConnectionUtil connUtil = new ConnectionUtil();// 自製的class，要連線哪個SQL資料表
		Connection conn = connUtil.getConnection();
		// 連線SQL資料庫(Connection資料型態是內建的class，getConnection是自製的方法)
		String sql = "select * from member where account=?";// 下SQL查詢程式

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);// 建立動態SQL
			pstmt.setString(1, account);// 建立動態SQL

			ResultSet rs = pstmt.executeQuery();// 建立動態SQL
			rs.next();
			m.setName(rs.getString("Name"));
			m.setAccount(rs.getString("Account"));
			m.setPassword(rs.getString("Password"));
			m.setEmail(rs.getString("Email"));
			m.setBirthDate(rs.getString("BirthDate"));
			m.setGender(rs.getString("Gender"));
			m.setAddress(rs.getString("Address"));
			m.setPhone(rs.getString("Phone"));
			m.setStatus(rs.getString("Status"));

		} catch (SQLException e) {
			// TODO Auto-generated catch block

			System.out.println(e.getMessage());// SQL~T
			System.out.println(e.getErrorCode());// SQL~N
			System.out.println("\n---------------------\n");

			e.printStackTrace();
			 
		}

		connUtil.free(conn);
		return m;
	}

	@Override
	public List<Member> findAllMember() {
		List<Member> list = new ArrayList<Member>();
		ConnectionUtil connUtil = new ConnectionUtil();// 自製的class，要連線哪個SQL資料表
		Connection conn = connUtil.getConnection();
		// 連線SQL資料庫(Connection資料型態是內建的class，getConnection是自製的方法)
		String sql = "select * from member";// 下SQL查詢程式

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);// 建立動態SQL
			ResultSet rs = pstmt.executeQuery();// 建立動態SQL
			while (rs.next()) {
				Member m = new Member();
				m.setName(rs.getString("Name"));
				m.setAccount(rs.getString("Account"));
				m.setPassword(rs.getString("Password"));
				m.setEmail(rs.getString("Email"));
				m.setBirthDate(rs.getString("BirthDate"));
				m.setGender(rs.getString("Gender"));
				m.setAddress(rs.getString("Address"));
				m.setPhone(rs.getString("Phone"));
				m.setStatus(rs.getString("Status"));
				list.add(m);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block

			System.out.println(e.getMessage());// SQL~T
			System.out.println(e.getErrorCode());// SQL~N
			System.out.println("\n---------------------\n");

			e.printStackTrace();
		}
		connUtil.free(conn);
		return list;

	}

	@Override
	public void insertMember(Member cus, String status) {
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?);";
		ConnectionUtil connUtil = new ConnectionUtil();
		Connection conn = connUtil.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cus.getName());
			pstmt.setString(2, cus.getAccount());
			pstmt.setString(3, cus.getPassword());
			pstmt.setString(4, cus.getEmail());
			pstmt.setString(5, cus.getBirthDate());
			pstmt.setString(6, cus.getGender());
			pstmt.setString(7, cus.getAddress());
			pstmt.setString(8, cus.getPhone());
			pstmt.setString(9, status);

			int count = pstmt.executeUpdate();
			System.out.println("新增" + count + "筆");

		} catch (SQLException e) {
			// TODO Auto-generated catch block

			System.out.println(e.getMessage());// SQL~T
			System.out.println(e.getErrorCode());// SQL~N
			System.out.println("\n---------------------\n");

			e.printStackTrace();
		}

		connUtil.free(conn);
	}

	@Override
	public void updateMember(Member m) {
		String sql = "update member set name=?,password=?,email=?,birthdate=?,gender=?,address=?,phone=?,status=? where account=?;";
		ConnectionUtil connUtil = new ConnectionUtil();
		Connection conn = connUtil.getConnection();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getName());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getBirthDate());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getPhone());
			pstmt.setString(8, m.getStatus());
			pstmt.setString(9, m.getAccount());

			int count = pstmt.executeUpdate();
			System.out.println("更新了" + count + "筆");

		} catch (SQLException e) {
			// TODO Auto-generated catch block

			System.out.println(e.getMessage());// SQL~T
			System.out.println(e.getErrorCode());// SQL~N
			System.out.println("\n---------------------\n");

			e.printStackTrace();
		}

		connUtil.free(conn);
	}

	@Override
	public void deleteMember(String account) {
		String sql = "delete from member where account=?;";
		ConnectionUtil connUtil = new ConnectionUtil();
		Connection conn = connUtil.getConnection();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, account);

			int count = pstmt.executeUpdate();
			System.out.println("刪除了" + count + "筆");

		} catch (SQLException e) {
			// TODO Auto-generated catch block

			System.out.println(e.getMessage());// SQL~T
			System.out.println(e.getErrorCode());// SQL~N
			System.out.println("\n---------------------\n");

			e.printStackTrace();
		}

		connUtil.free(conn);
	}
}
