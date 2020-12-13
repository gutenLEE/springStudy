package com.spring.springwebsocket2;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {
	
	// http �������� request, session���� �����͸� �޾ƿԴ�. 
/*
	Ŭ���̾�Ʈ�� �������� ��� ä���� �����Ϸ��� Ŭ���̾�Ʈ�� ������ HTTP ���׷��̵� ��û�� �������մϴ�. 
	�̸� WebSocket �������� �ڵ� ����ũ����մϴ�.
	
	������ ������ ���׷��̵� �� �� �ִ� ���,  HTTP 101 ������ ��û�� Ŭ���̾�Ʈ�� �����ϴ�. 
	�� �������� �ڵ� ����ũ�� ������ ������ ���ֵǰ� ������ Ŭ���̾�Ʈ ���� ������ WebSocket �������ݷ� ���׷��̵�˴ϴ�.

 	* ���� : Ŭ���̾�Ʈ�� HTTP 101 �������޴� ���, ������ �� �̻� HTTP�� ����Ǿ��ٰ� ���ֵ��� �ʽ��ϴ�.


 */
	
	// Ŭ���̾�Ʈ���� �� ���� ����. /�� �������� ����� �Ϸ��� ��ȯ �۾��� �ʿ��ϴ� : handshakeInterceptor�� ���ش�.		
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wshandler, Map<String, Object> map) throws Exception{
		
		// ���� �Ķ���� ��, attribute�� ���� �����ϸ� ������ �ڵ鷯 Ŭ������ webSocketSession�� ���޵ȴ�.
		
		 System.out.println("Before Handshake");
		 

		 ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		 System.out.println("URI : " + request.getURI());                                                                                                
		 
		 HttpServletRequest req = ssreq.getServletRequest();
		 
		 /*
		  String name = (String)req.getSession().getAttribute("name");
		  map.put("userName", name);
		  System.out.print("HttpSession�� ����� name : " + name ); 
		  */
		 
		 String id = (String)req.getSession().getAttribute("id");
		 map.put("userId", id);
		 System.out.println("HttpSession�� ����� id : " + id);

		 // handler�� �ʿ��� ������ map�� ���� ����
		 return super.beforeHandshake(request, response, wshandler, map);
	}
	
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wdhandler, Exception ex) {
		
		System.out.println("After Handshake");
		super.afterHandshake(request, response, wdhandler, ex);
	}
	
	
	
}















