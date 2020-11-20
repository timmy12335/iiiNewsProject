package CR.controller;

import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import CR.service.CR_calService;

@Controller
public class CR_staticController {

	
	@Autowired
	ServletContext ctx;
	@Autowired
	CR_calService service;
	
	
	@GetMapping("/toCal")
	public String getStatic() {
		return "CR/Staticplace";
	}
	
	
	@GetMapping("/calCR")
	public @ResponseBody Map<String, Long> calreportFromCate(){
		Map<String, Long> map = service.calFromCate();
		System.out.println(map);
		return map;		
	}
	
	@GetMapping("/calCRfromEmp")
	public @ResponseBody Map<String, Integer> calunFromEmp(){
		Map<String, Integer> map = service.calunFromEmp();
		System.out.println(map);
		return map;		
	}
	
}
