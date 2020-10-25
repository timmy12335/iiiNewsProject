package franktest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import franktest.model.MemberBean;
import franktest.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService service;
	
	@GetMapping({"/"})
	public String goIndex() {
		return "index";
	}
	
	
	@GetMapping({"/products","/test1023"})
	public String list(Model model) {
		
		List<MemberBean> list = service.getRecord();
		model.addAttribute("member", list);
		return "_test/1023test";
	}

	
	
}
