package franktest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import franktest.model.MemberBean;
import franktest.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@GetMapping("/test1023")
	public String save() {
		
		
		//
		service.saveMember();
		return "_test/1023test";
	}
}
