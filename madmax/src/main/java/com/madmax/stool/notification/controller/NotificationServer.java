package com.madmax.stool.notification.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class NotificationServer extends TextWebSocketHandler{
	//세션 관리용 <userId, websocketsession>
	private Map<String, WebSocketSession> users = new HashMap();
	
	@Autowired
	ObjectMapper mapper; //json -> java || java-> json 변환해주는 객체

	@Autowired
	NotificationController controller;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// WebSocketSession - send를 실행한 클라이언트 session,
		// TextMessage - 메세지는 payload라는 특정 장소에 들어감
			//System.out.println(message.getPayload());
		//받아온 Msg를 자바객체화 ("type", "sender", "receiver", "msg")
		NotificationMsg msg = getMessage(message.getPayload());
		System.out.println("메세지 받음 : "+ msg);
		switch(msg.getType()) {
		case "login" : addLoginUser(msg, session); break;
		case "count" : sendMessage(countUnreadNoti(msg), session); break;
		case "newNoti" : sendMessage(msg, session); break;
		}
	}
	
	//TextMessage의 getPayload()에 담긴 데이터를 자바객체화해줌.
	private NotificationMsg getMessage(String msg) {
		NotificationMsg nMsg = null;
		try {
			nMsg = mapper.readValue(msg, NotificationMsg.class); 
		}catch(JsonProcessingException e) {  e.printStackTrace();  }
		return nMsg;
	}
	
	//자바객체 Msg를 변환후 send해주는 method
	private void sendMessage(NotificationMsg msg, WebSocketSession session) {
		Set<Map.Entry<String, WebSocketSession>> entry = users.entrySet();
		for(Map.Entry<String, WebSocketSession> user : entry) {
			try {				
				if(!msg.getReceiver().equals("")) { // 리시버가 있을 때 (우리 로직에선 항상 있음)
					if(msg.getReceiver().equals(user.getKey())) {
						System.out.println("보낼꺼야");
						System.out.println(getJsonMessage(msg));
						user.getValue().sendMessage(new TextMessage(getJsonMessage(msg)));
					}
				}
			}catch(IOException e) { e.printStackTrace(); }
		}
	}
	//자바객체 msg를 Json String으로 변환.
	private String getJsonMessage(NotificationMsg msg) {
		String jsonMsg ="";
		
		try {
			jsonMsg=mapper.writeValueAsString(msg);
		} catch (JsonProcessingException e) { e.printStackTrace(); }
		
		return jsonMsg;
	}
	
	//로그인 시 세션관리용 Map에 담음
	private void addLoginUser(NotificationMsg msg, WebSocketSession session) {
		users.put(msg.getSender(), session);
		//전체 안 읽은 알림 개수 전송
		sendMessage(countUnreadNoti(msg), session);
	}

	//전체 안읽은 알림 개수 select 후 message로 반환 
	private NotificationMsg countUnreadNoti(NotificationMsg msg) {
		int count = controller.selectUnreadNotificationCount(msg.getSender());
		return new NotificationMsg("count", "", msg.getReceiver(), ""+count);
	}
}
