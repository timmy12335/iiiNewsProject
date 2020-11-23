package CR.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import CR.service.CR_msgService;  

@ServerEndpoint("/echoserver00")
public class EchoServerEndpoint {
	
	
	@Autowired
	CR_msgService service;
	
	private static final Logger LOGGER = Logger.getLogger(EchoServerEndpoint.class);
//	private static final Logger LOGGER = Logger.getLogger(ProgrammaticEchoEnpoint.class);	
	public EchoServerEndpoint() {
		LOGGER.info("註釋版的ServerEndpoint：已新建物件,  hashCode=" + hashCode());
	}
	
	@OnOpen
	public void onOpen(Session session) {
		LOGGER.info("註釋版的ServerEndpoint：連線已開啟, Session Id: " + session.getId());
	}
	
	@OnMessage
	public String onMessage(String message) {
		LOGGER.info("註釋版的ServerEndpoint：收到客戶端送來訊息: " + message);
		String msg=null;
		if(message.equals("你好")) {
			msg="你好";
		}else if(message.contains("新聞")) {
//			service.addMsg(message);
			msg="可到新聞專區觀看";
			
		}else if(message.contains("廣告")) {
//			service.addMsg(message);
			msg="可到廣告專區觀看";
		}else if(message.contains("追蹤")) {
			msg="請至追蹤專區觀看";
		}else if(message.contains("客服")) {
			msg="您現在就在客服喔!!";
		}else if(message.contains("時間")) {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			msg="現在時間為:"+ sdf.format(date);
		}
		else {
			msg="抱歉，不了解你的意思";
		}
		
	    return msg;
	}
	
	@OnClose
	public void onClose(Session session, CloseReason reason) {
		LOGGER.info("註釋版的ServerEndpoint：連線已關閉,  關閉原因:" + reason.getReasonPhrase());
	}
	
	@OnError
	public void onError(Session session, Throwable thr) {
		LOGGER.info("註釋版的ServerEndpoint：發生錯誤, 例外原因:" + thr.getMessage());
	}
}
