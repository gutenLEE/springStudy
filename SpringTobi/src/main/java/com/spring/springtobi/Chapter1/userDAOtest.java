package com.spring.springtobi.Chapter1;

import java.sql.SQLException;

public class userDAOtest {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		UserDAO dao = new UserDAO();
		
		User user = new User();
		user.setId("gutenTag");
		user.setName("LEE");
		user.setPassword("123");
		
		dao.add(user);
		
		System.out.println(user.getId() + " ��� ����");
		
		User user2 = dao.get(user.getId());
		System.out.println(user2.getName());
	}

}
