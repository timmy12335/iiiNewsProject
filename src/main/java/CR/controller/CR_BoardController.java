package CR.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import CR.model.CRBoardBean;
import CR.service.CR_boardService;


//公告欄
@Controller
@SessionAttributes({"MBBean","CpMemberBean"})
public class CR_BoardController {

	@Autowired
	ServletContext ctx;
	@Autowired
	CR_boardService service;
	
	@GetMapping(value="/board")
	public String getborad(Model model) {
		List<CRBoardBean> beans = service.getboard();
		model.addAttribute("boards",beans);
		return "CR/board/CRBoard";	
	}
	
	@GetMapping(value="/getboard")
	public @ResponseBody String getBorad(@RequestBody Model model) {
		List<CRBoardBean> beans = service.getboard();
		model.addAttribute("boards",beans);
		return "CR/board/CRBoard";	
	}
	
	
	
	@GetMapping(value="/addboard")
	public String getaddBoradform(Model model,HttpServletRequest request,HttpServletResponse response) {
		
		CRBoardBean crb = new CRBoardBean();
		model.addAttribute("crbBean", crb);
		return "CR/BMBoard";
	}
	
	
	
}
