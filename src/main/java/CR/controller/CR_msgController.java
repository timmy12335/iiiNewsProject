package CR.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import CR.model.CrMsgBean;
import CR.service.CR_msgService;

@Controller
public class CR_msgController {

	@Autowired
	ServletContext ctx;
	
	@Autowired
	CR_msgService service;
	
	@GetMapping("/chat")
	public String getChatById(CrMsgBean msg) {
		return "/CR/msgRoom";
	}
	
	
	@PostMapping(value="/msgChat",
			consumes= {"application/json"}, produces= {"application/json"})
	public @ResponseBody Map<String, String> addMsg(@RequestBody CrMsgBean msg){
		Map<String, String> map = new HashMap<>();
		service.addMsg(msg);
		map.put("success",msg.getSendmsg());
		return map;
		
	}



}
