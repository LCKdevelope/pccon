package com.pcConSystem.sockUtil;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class pcRoomServerSocketHandler extends TextWebSocketHandler {
	@Autowired
	societySocketHandler socSock;
	// 접속중인 테이블
	private ArrayList<WebSocketSession> connectPcroomGuestlist = new ArrayList<WebSocketSession>();
	private ArrayList<WebSocketSession> connectPcroomAdminlist = new ArrayList<WebSocketSession>();
	private ArrayList<WebSocketSession> connectChattinglist = new ArrayList<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		System.out.println("피시방 서버접속");
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String textMsg = (String) message.getPayload();
		System.out.println("전송한 메세지 :" + textMsg);
		JsonObject jobj = JsonParser.parseString(textMsg).getAsJsonObject();
		String msgType = jobj.get("msgType").getAsString();
		String act = jobj.get("act").getAsString();
		String pcrCode = jobj.get("pcrCode").getAsString();

		System.err.println("msgType: " + msgType); // 피시방인지 손님인지 구분

		if (msgType.equals("guest")) {
			WebSocketSession adminSession = null;
			System.err.println("손님");
			for (WebSocketSession conn : connectPcroomAdminlist) {
				String connPcrcode = (String) conn.getAttributes().get("AdminpcrCode");
				if (pcrCode.equals(connPcrcode)) {
					adminSession = conn;
					break;
				}
			}
			if (adminSession == null) {
				System.out.println("들어와있는 어드민세션이 없음");
				return;
			}

			if (act.equals("login")) {
				connectPcroomGuestlist.add(session);
				adminSession.sendMessage(new TextMessage(textMsg));

			} else if (act.equals("logout")) {
				adminSession.sendMessage(new TextMessage(textMsg));
				connectPcroomGuestlist.remove(session);

			} else if (act.equals("sendmessagelogin")) {
				adminSession.sendMessage(new TextMessage(textMsg));
				connectChattinglist.add(session);

			} else if (act.equals("sendmessagelogout")) {
				adminSession.sendMessage(new TextMessage(textMsg));
				connectChattinglist.remove(session);

			} else {
				adminSession.sendMessage(new TextMessage(textMsg));

			}
		} else if (msgType.equals("admin")) {

			System.err.println("피시방");

			if (act.equals("login")) {

				connectPcroomAdminlist.add(session);
			} else if (act.equals("logout")) {
				connectPcroomAdminlist.remove(session);

			} else if (act.equals("sendmessage")) {
				WebSocketSession guestSession = null;
				for (WebSocketSession conn : connectChattinglist) {
					String connPcrcode = (String) conn.getAttributes().get("mempcrCode");
					if (pcrCode.equals(connPcrcode)) {
						guestSession = conn;
						guestSession.sendMessage(new TextMessage(textMsg));
					}
				}
				for (WebSocketSession conn : connectPcroomGuestlist) {
					String connPcrcode = (String) conn.getAttributes().get("mempcrCode");
					if (pcrCode.equals(connPcrcode)) {
						guestSession = conn;
						guestSession.sendMessage(new TextMessage(textMsg));
					}
				}

			} else if (act.equals("sendmessageEveryOne")) {
				for (WebSocketSession conn : connectPcroomGuestlist) {
					
					String connPcrcode = (String) conn.getAttributes().get("mempcrCode");
					if (pcrCode.equals(connPcrcode)) {
					
						conn.sendMessage(new TextMessage(textMsg));
					}
				}
				

			} else {
				WebSocketSession guestSession = null;
				for (WebSocketSession conn : connectPcroomGuestlist) {
					String connPcrcode = (String) conn.getAttributes().get("mempcrCode");
					if (pcrCode.equals(connPcrcode)) {
						guestSession = conn;
						guestSession.sendMessage(new TextMessage(textMsg));
					}
				}

			}

		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		connectPcroomAdminlist.remove(session);
		connectPcroomGuestlist.remove(session);
		connectChattinglist.remove(session);

	}

}
