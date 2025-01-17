package com.spring.springMember;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtil {
	
	public static Connection getConnection() {
		
		Connection conn = null;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		String oraId = "scott"; String oraPw = "123456";
		try {
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url, oraId, oraPw);
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch(SQLException ex) {
			ex.printStackTrace();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static void closeResource(Connection conn, Statement pstmt, ResultSet rs) {
		
		try 
		{
			if(rs != null) 
			{
				rs.close();
			}
		}
		catch(Exception e) {
			rs = null;
		}
		
		
		try 
		{
			if(pstmt != null) 
			{
				pstmt.close();
			}
		}
		catch(Exception e) {
			pstmt = null;
		}
		
		try 
		{
			if(conn != null) 
			{
				conn.close();
			}
		}
		catch(Exception e) 
		{
			conn = null;
		}
	}
}

