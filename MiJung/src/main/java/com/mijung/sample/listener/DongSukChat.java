package com.mijung.sample.listener;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class DongSukChat extends TextWebSocketHandler{

	//접속한 websocket sessione들을 저장 하려 해용
	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug("세상에 연결이 되었다네용");
		list.add(session);   // 리스트에 접속한 session들을 다마버려용
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.debug("메세지가 도착했어용");
		log.debug("요런 메세지가용 " +message.getPayload());
		
		//접속해 있는 모든 session에 열락하깅
		for (WebSocketSession single : list) {
			single.sendMessage(message);			
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.debug("연결이 끊겼다네용 ㅠㅠ");
		list.remove(session);
	}
	
}
