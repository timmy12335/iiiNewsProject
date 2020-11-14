//package _00_init.util;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.ComponentScan;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.socket.config.annotation.EnableWebSocket;
//import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
//import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
//import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;
//
//
//
//@Configuration
//@EnableWebSocket
//@ComponentScan("iiiNews")
//public class WebSocketConfig implements WebSocketConfigurer {
//	
//	@Autowired
//	MessageHandler msg;
//	
//	   @Override
//	    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
//	        registry.addHandler(msg, "/websocket").addInterceptors(new HttpSessionHandshakeInterceptor());//設定連結
//	     
//	    }
//}
