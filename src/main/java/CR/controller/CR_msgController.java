package CR.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String tomsgroom(CrMsgBean msg) {
		return "/CR/Sockettest";
	}
	
	@GetMapping("/msgChat")
	public @ResponseBody Map<String, String> getChatById(CrMsgBean msg) {
		Map<String, String> map = new HashMap<>();
		map.put("success",msg.getMsg());
		
		
		return map;
	}
	
	@PostMapping(value="/msgChat",
			consumes= {"application/json"}, produces= {"application/json"})
	public @ResponseBody Map<String, String> addMsg(@RequestBody CrMsgBean msg){
		Map<String, String> map = new HashMap<>();
		service.addMsg(msg);
		map.put("success",msg.getMsg());
		return map;
		
	}



}
