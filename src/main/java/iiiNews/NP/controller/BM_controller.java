package iiiNews.NP.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import iiiNews.NP.model.NewsBean;
import iiiNews.NP.service.NewsProductService;
import iiiNews.NP.service.NewsSearchService;

@Controller
public class BM_controller {
	@Autowired
	NewsProductService service;
	@Autowired
	NewsSearchService newsSearchService;
	
	//查詢所有上架的新聞(給企業看)
		@GetMapping("/getAllNews")
		public String getAllNewsList(Model model) {
			List<NewsBean> list = service.getAllNews();
			model.addAttribute("newsLists", list);
			return "NP/allNewsList";
		}
	//******************************************************************************
	//關鍵字查詢區塊		
	@GetMapping("/getNewsByWords")
		public String getNewsByWords(
				@RequestParam(value = "words",required = false) String searchWords,
				Model model) {
		System.out.println("searchWords="+searchWords);
		List<NewsBean> list = newsSearchService.getNewsByWords(searchWords);
		model.addAttribute("newsLists", list);
		return "NP/allNewsListTest";
					
		}
	
	//類型查詢
	@GetMapping("/getNewsByType")
	public String getNewsByType(
			@RequestParam(value = "type",required = false) String Type,
			Model model) {
		System.out.println("Type="+Type);
		if(Type=="-1") {
			return "redirect:/changeStautsForTime";
		}else {
			List<NewsBean> list = newsSearchService.getNewsByType(Type);
			model.addAttribute("newsLists", list);
		return "NP/allNewsListTest";
		}
		
	}
}
