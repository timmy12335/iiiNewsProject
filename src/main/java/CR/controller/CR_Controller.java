package CR.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import CR.model.CRBean;
import CR.service.CR_service;

@Controller
public class CR_Controller {
	@Autowired
	ServletContext ctx;
	@Autowired
	CR_service service;
	
	@GetMapping("/customerReports")
	public String list(Model model) {
	List<CRBean> beans = service.getRecord();
		model.addAttribute("CrReport",beans);
		return "CR/CrReport";
	}
}
