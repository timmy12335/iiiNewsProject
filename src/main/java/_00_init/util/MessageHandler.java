package _00_init.util;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


@Component
public class MessageHandler extends TextWebSocketHandler {

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message)
	         throws Exception {

	      String clientMessage = message.getPayload();

	      if (clientMessage.startsWith("你好") || clientMessage.startsWith("Hi")) {
	         session.sendMessage(new TextMessage("您好! 能為妳做甚麼?"));
	      } else {
	         session.sendMessage(
	               new TextMessage("沒有你要的服務!"));
	      }
	   }
	
	
	
}
