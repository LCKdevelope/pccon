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

public class societySocketHandler extends TextWebSocketHandler {

	// 접속중인 테이블
	private ArrayList<WebSocketSession> connectSocietylist = new ArrayList<WebSocketSession>();
	private ArrayList<HashMap<String, String>> connectPcroomlist = new ArrayList<HashMap<String, String>>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.err.println("사회접속");

		/* pcroom 페이지 접속한 경우에 메세지 전송 */

		/*
		 * String msgType = (String) session.getAttributes().get("msgType"); if
		 * (msgType.equals("pcRoom")) { String pcrCode = (String)
		 * session.getAttributes().get("pcrCode"); String seatNum = (String)
		 * session.getAttributes().get("seatNum"); String act = (String)
		 * session.getAttributes().get("act"); System.out.println("pc방입장"); for
		 * (WebSocketSession society : connectSocietylist) { society.sendMessage(new
		 * TextMessage(enterpcRoom(act, pcrCode, seatNum)));
		 * connectPcroomlist.add(session);
		 * 
		 * }
		 * 
		 * } else { connectSocietylist.add(session); System.out.println("밖");
		 * connectPcroomlist.remove(session); }
		 */

		connectSocietylist.add(session);

	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {

		// 관리자페이지 세션에 메세지 전송

		String textMsg = (String) message.getPayload();
		System.err.println("핸들러");

		JsonObject jobj = JsonParser.parseString(textMsg).getAsJsonObject();

		String msgType = jobj.get("msgType").getAsString();
		String act = jobj.get("act").getAsString();
		String pcrCode = jobj.get("pcrCode").getAsString();
		String seatNum = jobj.get("seatNum").getAsString();

		System.out.println(msgType + "에서 " + pcrCode + "의 " + seatNum + "번 자리에 " + act +" 했다");
		
		if (act.equals("out")) {
			
			for(int i=0;i<connectPcroomlist.size();i++) {
				System.err.println(connectPcroomlist.get(i).get("pcrCode"));
				System.out.println(connectPcroomlist.get(i).get("seatNum"));
				
				if((connectPcroomlist.get(i).get("pcrCode").equals(pcrCode)&&connectPcroomlist.get(i).get("seatNum").equals(seatNum+"자리 청소중"))||
						(connectPcroomlist.get(i).get("pcrCode").equals(pcrCode)&&connectPcroomlist.get(i).get("seatNum").equals(seatNum))) {
					System.err.println("리스트에서 삭제");
					System.out.println(connectPcroomlist.get(i).toString());
					
					connectPcroomlist.remove(connectPcroomlist.get(i));
				};
			}

		} else if (act.equals("enter")) {
			
			HashMap<String, String> pcinfo = new HashMap<String, String>();
			pcinfo.put("pcrCode", pcrCode);
			pcinfo.put("seatNum", seatNum);

			connectPcroomlist.add(pcinfo);
			System.out.println("핸들러 enter 부분 list추가");

		}else if(act.equals("logout")) {
			System.out.println("핸들러 logout 부분");
			for(int i=0;i<connectPcroomlist.size();i++) {
				System.err.println(connectPcroomlist.get(i).get("pcrCode"));
				System.out.println(connectPcroomlist.get(i).get("seatNum"));
				if(connectPcroomlist.get(i).get("pcrCode").equals(pcrCode)&&connectPcroomlist.get(i).get("seatNum").equals(seatNum)) {					
					connectPcroomlist.get(i).replace("seatNum",seatNum+"자리 청소중");
					System.out.println("청소중으로 수정");
				};
			}
			
		}

		for (WebSocketSession connTbl : connectSocietylist) {
			connTbl.sendMessage(new TextMessage(textMsg));
		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		connectSocietylist.remove(session);
	}

	public String enterpcRoom(String act, String pcrCode, String seatNum) {

		HashMap<String, String> El = new HashMap<String, String>();

		El.put("act ", act);
		El.put("pcrCode ", pcrCode);
		El.put("seatNum ", seatNum);
		System.out.println(El.toString());

		return new Gson().toJson(El);
	}

	public ArrayList<HashMap<String, String>> getConnPCList() {

		return connectPcroomlist;
	}

}
