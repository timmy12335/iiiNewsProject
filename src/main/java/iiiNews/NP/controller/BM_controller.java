package iiiNews.NP.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import iiiNews.NP.model.NewsBean;
import iiiNews.NP.service.NewsProductService;

@Controller
public class BM_controller {
	@Autowired
	NewsProductService service;
	
	//查詢所有上架的新聞(給企業看)
			@GetMapping("/getAllNews")
			public String getAllNewsList(Model model) {
				List<NewsBean> list = service.getAllNews();
				model.addAttribute("newsLists", list);
				return "NP/allNewsList";
			}

}
