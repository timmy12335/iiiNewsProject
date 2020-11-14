package CR.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import CR.model.CRBoardBean;
import CR.service.CR_boardService;


//公告欄
@Controller
public class CR_BoardController {

	
	@Autowired
	CR_boardService service;
	
	@GetMapping(value="/board")
	public String getBorad(Model model) {
		
		return "CR/CRBoard";
		
	}
	
	@GetMapping(value="/addboard")
	public String addBorad(Model model) {
		
		CRBoardBean crb = new CRBoardBean();
		model.addAttribute("crbBean", crb);
		return "CR/BMBoard";
	}
	
}
