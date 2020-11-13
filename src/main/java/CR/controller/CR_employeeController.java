package CR.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import CR.model.CRemployee;
import CR.service.CR_empService;

@Controller
public class CR_employeeController {

	
	@Autowired
	ServletContext ctx;
	@Autowired
	CR_empService service;
	
	//取得全部客服人員資料
	@GetMapping("/allemployee")
	public String showempolyee(Model model,HttpServletRequest request, HttpServletResponse response) {
		List<CRemployee> cre =service.getemployee();
		model.addAttribute("employee", cre);
		return "CR/cremployee";		
	}
}
