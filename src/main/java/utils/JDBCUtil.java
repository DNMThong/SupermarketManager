package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCUtil {
	static String nameDatabase = "";
	static String user = "";
	static String password = "";
	static Connection con = null;
	static {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnect() {
		try {
			String connectionUrl = "jdbc:sqlserver://localhost:1433;"
			        + "databaseName="+nameDatabase
			        + ";user="+user
			        + ";password="+password+";encrypt=true;trustServerCertificate=true;";
			con = DriverManager.getConnection(connectionUrl);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static void closeConnect() {
		try {
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static PreparedStatement getStmt(String sql,Object ...args) {
		PreparedStatement ps = null;
		try {
			Connection c = getConnect();
			if(sql.trim().startsWith("{")) {
				ps = c.prepareCall(sql);
			}else {
				ps = c.prepareStatement(sql);
			}
			for(int i = 0; i < args.length; i++) {
				ps.setObject(i+1, args[i]);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ps;
	}
	
	public static ResultSet query(String sql,Object ...args) throws SQLException {
		PreparedStatement ps = getStmt(sql, args);
		return ps.executeQuery();
	}
	
	public static Object value(String sql,Object ...args) {
		try {
			ResultSet rs =  query(sql, args);
			if(rs.next()) {
				return rs.getObject(0);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static int update(String sql,Object ...args) {
		int rs = -1;
		try {
			PreparedStatement ps= getStmt(sql, args);
			rs = ps.executeUpdate();
			ps.getConnection().close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}
