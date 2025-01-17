package com.spring.springtobi.Chapter1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	
	public void add(User user) throws ClassNotFoundException, SQLException {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		String oraId = "scott"; String oraPw = "123456";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, oraId, oraPw);
		
		PreparedStatement pstmt = conn.prepareStatement("insert into users values(?, ?, ?)");
		
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getName());
		pstmt.setString(3, user.getPassword());
	
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	public User get(String id) throws ClassNotFoundException, SQLException {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		String oraId = "scott"; String oraPw = "123456";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, oraId, oraPw);
		
		PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM USERS WHERE id = ?");
		
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		User user = new User();
		user.setId(rs.getString("id"));
		user.setName(rs.getString("name"));
		user.setPassword(rs.getString("password"));
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return user;
	}
}
