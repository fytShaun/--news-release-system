package javaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Jdbc {
	private Connection conn;
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
    	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "513315");
    	return conn;
	}
	
	public void clo() throws SQLException {
		conn.close();
	}
	
	public int prepareUpdate(String sql,Object...args) throws ClassNotFoundException, SQLException {
		getConnection();
		if(conn!=null) {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int i=1;
			for(Object c:args) {
				pstmt.setObject(i, c);
				i++;
			}
			int row =  pstmt.executeUpdate(sql);
			if(row>0) return row;
		}
		return -1;
	}
	
	public ResultSet PrepareQuery(String sql,Object...args) throws ClassNotFoundException, SQLException {
		getConnection();
		if(conn!=null) {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			for(int i=0;i<args.length;i++) {
				pstmt.setObject(i+1, args[i]);
			}
			ResultSet rs = pstmt.executeQuery(sql);
			return rs;
		}
		return null;
	}
	public int update(String sql) throws ClassNotFoundException, SQLException {
		getConnection();
		if(conn!=null) {
			Statement stmt = conn.createStatement();
			int row = stmt.executeUpdate(sql);
			return row;
		}
		return -1;
	}
	public ResultSet query(String sql) throws ClassNotFoundException, SQLException {
		getConnection();
		if(conn!=null) {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			return rs;
		}
		return null;
	}
}
