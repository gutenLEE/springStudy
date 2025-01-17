package com.spring.mychat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class SocketHandler extends TextWebSocketHandler {
	
	List<WebSocketSession> sessions = new ArrayList<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
				
			super.afterConnectionEstablished(session);			
			System.out.println("afterConnectionEstablished : " + session);
			System.out.println(session.getAttributes());
			
			String id = (String)session.getAttributes().get("id");
			System.out.println("id : " + id);

	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		System.out.println("handleMessage : " + session);
		super.handleMessage(session, message);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		System.out.println("afterConnectionClosed : " + session);
		super.afterConnectionClosed(session, status);
	}

}
