package news.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import jdbcConnectionUtil.ConnectionUtil;
import news.jdbc.bean.News;

public class NewsDaoImpl implements NewsDao {

	public NewsDaoImpl() {
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ft.setTimeZone(TimeZone.getTimeZone("GMT+8"));

		System.out.println("當前時間為: " + ft.format(dNow));
	}

	@Override
	public News findNews(Integer newsId) {
		News n = new News();

		ConnectionUtil connUtil = new ConnectionUtil();// 自製的class，要連線哪個SQL資料表
		Connection conn = connUtil.getConnection();
		String sql = "select * from news where NewsId=?";// 下SQL查詢程式
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);// 建立動態SQL
			pstmt.setInt(1, newsId);// 建立動態SQL

			ResultSet rs = pstmt.executeQuery();// 建立動態SQL
			rs.next();
			n.setNewsId(rs.getInt("NewsId"));
			n.setDate(rs.getString("Date"));
			n.setTitle(rs.getString("Title"));
			n.setContent(rs.getString("Content"));

		} catch (SQLException e) {
			// TODO Auto-generated catch block

			System.out.println(e.getMessage());// SQL~T
			System.out.println(e.getErrorCode());// SQL~N
			System.out.println("\n---------------------\n");

			e.printStackTrace();

		}

		connUtil.free(conn);
		return n;
	}

	@Override
	public List<News> findAllNews() {

		ConnectionUtil connUtil = new ConnectionUtil();// 自製的class，要連線哪個SQL資料表
		Connection conn = connUtil.getConnection();
		String sql = "select * from news";// 下SQL查詢程式

		List<News> list = new ArrayList<News>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);// 建立動態SQL

			ResultSet rs = pstmt.executeQuery();// 建立動態SQL

			while (rs.next()) {
				News n = new News();
				n.setNewsId(rs.getInt("NewsId"));
				n.setDate(rs.getString("Date"));
				n.setTitle(rs.getString("Title"));
				n.setContent(rs.getString("Content"));
				list.add(n);
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
	public void insertNews(News n) {
		
		ConnectionUtil connUtil = new ConnectionUtil();// 自製的class，要連線哪個SQL資料表
		Connection conn = connUtil.getConnection();
		String sql = "insert into news values(?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);// 建立動態SQL
			pstmt.setString(1, n.getDate());
			pstmt.setString(2, n.getTitle());
			pstmt.setString(3, n.getContent());
			int count = pstmt.executeUpdate();// 建立動態SQL
			
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
	public void updateNews(News n) {
		
		ConnectionUtil connUtil = new ConnectionUtil();// 自製的class，要連線哪個SQL資料表
		Connection conn = connUtil.getConnection();
		String sql = "update news set Date=?,Title=?,Content=? where NewsId=?;";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);// 建立動態SQL
			pstmt.setInt(4, n.getNewsId());// 建立動態SQL
			pstmt.setString(1, n.getDate());
			pstmt.setString(2, n.getTitle());
			pstmt.setString(3, n.getContent());
			int count = pstmt.executeUpdate();// 建立動態SQL
			
			System.out.println("更新" + count + "筆");

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
	public void deleteNews(Integer newsId) {
		ConnectionUtil connUtil = new ConnectionUtil();// 自製的class，要連線哪個SQL資料表
		Connection conn = connUtil.getConnection();
		String sql = "delete from news where NewsId=?;";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);// 建立動態SQL
			pstmt.setInt(1, newsId);// 建立動態SQL
			
			int count = pstmt.executeUpdate();// 建立動態SQL
			
			System.out.println("刪除" + count + "筆");

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
