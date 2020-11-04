package iiiNews.NP.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import iiiNews.NP.model.NewsBean;
import iiiNews.NP.service.NewsProductService;
@Controller
public class NewsProductTimesController {
	@Autowired
	NewsProductService service;
	
	
	@GetMapping("/findtime")
	public String findtime() {
		
		
		
		return "redirct:/changeStautsForTime";
	}
	
	@GetMapping("/changeStautsForTime")
	public String changeStautsForTime(Model model) {
		List<NewsBean> list = service.checkTime();
		model.addAttribute("newsLists", list);
		return "/NP/allNewsList";
	}
	
}
