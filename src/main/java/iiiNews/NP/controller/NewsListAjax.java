package iiiNews.NP.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import iiiNews.NP.model.NewsBean;
import iiiNews.NP.service.NewsProductService;

@Controller
public class NewsListAjax {
	

	@Autowired
	NewsProductService service;
	//使用AJAX顯示新聞列表
		@GetMapping("/showAllNewsbyPages")
		public String showbookPage() {	
				return"NP/ShowNewsByPageAjax";
			
		}
		@GetMapping("/pagingNewsData.json")
		public @ResponseBody List<NewsBean> getbookPage(
				@RequestParam(value="pageNo",defaultValue = "1" )Integer pageNo) {	
			
			List<NewsBean> list =  service.getPageNews(pageNo);
			return list;		
		}
		@GetMapping("/pagingNewsNo")
		public @ResponseBody Map<String, Integer> getPage(
				@RequestParam(value="pageNo",defaultValue = "1" )Integer pageNo,
				@RequestParam(value="totalPage", defaultValue = "1") Integer totalPage) {	
			
			totalPage = service.getTotalPages();
			
			Map<String, Integer>  map = new HashMap<>();
	        map.put("totalPage", totalPage);
	        map.put("currPage", pageNo);
			return map;
		
		}
}
