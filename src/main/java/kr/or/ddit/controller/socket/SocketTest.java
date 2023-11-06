package kr.or.ddit.controller.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;


import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.vo.member.CustomUser;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SocketTest extends TextWebSocketHandler{

	
	// 소켓에 접속한 인원들을 담기 위한 리스트 객체 생성
	List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("afterConnectionEstablished() 실행...!! 클라이언트 서버 접속 연결 성공...! : "+ session);
		log.info("session : " + session.getId());
		// 현재 소켓에 접속한 인원들 리스트에 모두 담는다.
		sessionList.add(session);
		String senderId = getId(session);
		userSessions.put(senderId, session);
		
		super.afterConnectionEstablished(session);
	}


	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("handleTextMessage() 실행...!! 메세지 전송 시도 성공...!");
		log.info("메세지야 들어오아라..."+ message.getPayload().toString()); 
		
		
		String senderId = getId(session);
		log.info("소켓 컨트롤러에서 로그인한 아이디 값 추출 : "+senderId);
		
		
		String msg = message.getPayload();
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			
			if(strs != null && strs.length == 1) {
				String memId = strs[0];
//				String alarmContent = strs[1];
//				String alarmCnt = strs[2];
//				String alarmNo = strs[3];
//				String alarmRead = strs[4];
//				String alarmDate = strs[5];
//				String tableNo = strs[6];
//				
				WebSocketSession memIdSession = userSessions.get(memId);
				log.info("memIdSession >>>>>>>>>>>>>" + memIdSession);

//				if("board".equals(alarmContent) && memIdSession != null) {
//					TextMessage tmpMsg = new TextMessage(memId + "님이"
//				+ "<a href='/elly/detail.do?tableNo=" + tableNo + "' style=\"color: black\">"
//				+ " 에 글을 달았습니다!</a>");
//					
//				memIdSession.sendMessage(tmpMsg);
//				
				
				if(memIdSession != null) {
					TextMessage tmpMsg = new TextMessage("");
					memIdSession.sendMessage(tmpMsg);
				}
			}
			
		}
	}
		

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("afterConnectionClosed() 실행...!! 서버 연결 종료...!");
	}
	
	private String getId(WebSocketSession session) {
		SecurityContextImpl loginUser = null;
		String id = null;
		Map<String, Object> httpSession = session.getAttributes();
		Set<Entry<String, Object>> entrySet = httpSession.entrySet();
		Iterator<Entry<String, Object>> entryIte = entrySet.iterator();
		while(entryIte.hasNext()) {
			Entry<String, Object> entry = entryIte.next();
			String key = entry.getKey();
			log.info("key : " + key);
			if(key.equals("SPRING_SECURITY_CONTEXT")){
				loginUser = (SecurityContextImpl)httpSession.get("SPRING_SECURITY_CONTEXT");
				log.info("loginUser : " + loginUser);
				
			}
		}
		CustomUser user = (CustomUser) loginUser.getAuthentication().getPrincipal();
		log.info("principal id  : " + user.getUsername());
		log.info("member id : " + user.getMember().getMemId());
		id =  user.getMember().getMemId();
		if(null == user.getUsername()) {
			id = session.getId();
		}
		return id;
	}
}
