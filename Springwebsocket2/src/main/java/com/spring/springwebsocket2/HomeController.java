package com.spring.springwebsocket2;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberDAO;
	
	@RequestMapping(value = "loginForm.do")
	public String home() {
		return "loginForm";
	}
	@RequestMapping(value = "joinForm.do")
	public String joinForm() {
		return "joinForm";
	}
	
	@RequestMapping(value = "client_chat.do", method=RequestMethod.GET)
	public String clientChat() {
		return "client_chat";
	}
	@RequestMapping(value = "memberinsert.do")
	public String memberinsert(MemberVO vo) {
		int res = memberDAO.inserMemberService(vo);
		return "loginForm";
	}
	@RequestMapping(value = "memberCheck.do")
	public String memberCheck(MemberVO vo, HttpSession session, HttpServletResponse response) {
		
		System.out.println(vo.toString());
		int res = memberDAO.userCheckMember(vo);
		System.out.println("res : " + res + " // " + vo.toString());
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		try {
			PrintWriter writer = response.getWriter();
			
			if(res == 1) {
				session.setAttribute("id", vo.getId());
				String name = memberDAO.pickNameMember(vo);
				
				System.out.println(vo.toString());
				session.setAttribute("name", name);
				
				writer.write("<script>alert('로그이 ㄴ성공'); location.href='./client_chat.do';</script>");
				
			}
			else {
				writer.print("<script>alert('로그인 실패'); location.href='./loginForm.do';</script>");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
