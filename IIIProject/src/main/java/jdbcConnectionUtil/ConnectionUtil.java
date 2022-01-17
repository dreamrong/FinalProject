package jdbcConnectionUtil;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtil {
	Connection conn;
	String url="jdbc:sqlserver://localhost:1433;databasename=iii_finalproject";
	String user="sa";
	String password="asus1234";
	
	public Connection getConnection() {
		try {
			conn=DriverManager.getConnection(url,user,password);
			System.out.println("已連線\n");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	public boolean free(Connection conn) {
		try {
			if(conn!=null) {
				if(conn.isClosed()) {
					System.out.println("is Closed1\n");
					System.out.println("--------\n");
				}else {
					System.out.println("is Closed2\n");
					System.out.println("--------\n");
					conn.close();
					return true;
				}
			}
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
		
		
	}
	
}