package com.spring.mychat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@RequestMapping(value = "/home.do")
	public String home(Model model, HttpSession session, HttpServletRequest request) {

		return "home";
	}
	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String chat(Model model) {
		
		System.out.println("chat Frame");
		return "chat";
	}
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(Model model) {
		
		System.out.println("chat Frame");
		return "index";
	}
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Model model) {
		
		System.out.println("chat Frame");
		return "main";
	}
	
	@RequestMapping(value = "/room.do", method = RequestMethod.POST)
	public String room(HttpSession session, HttpServletRequest request) {
		
		String id = (String)request.getParameter("id");
		String pw = (String)request.getParameter("pw");
		
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		
		//System.out.println(id + " "+pw);

		return "room";
	}
	
	
}
