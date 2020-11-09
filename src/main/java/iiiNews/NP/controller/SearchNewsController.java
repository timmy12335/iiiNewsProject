package iiiNews.NP.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import iiiNews.NP.model.NewsBean;
import iiiNews.NP.service.NewsProductService;

@Controller
public class SearchNewsController {
	
	@Autowired
	NewsProductService service;
	
	//查詢所有上架的新聞(給企業看)
		@GetMapping("/getAllNews")
		public String getAllNewsList(Model model) {
			List<NewsBean> list = service.getAllNews();
			model.addAttribute("newsLists", list);
			return "NP/allNewsList";
		}

		// 查詢單一筆未上架新聞
		@GetMapping("/getSingleNewsForUpdate/{newsId}")
		public String getSingleNewsForUpdate(@PathVariable String newsId, Model model) {
			NewsBean newsBean = service.getSingleNewsForUpdate(newsId);
			model.addAttribute("newsSingle", newsBean);
			return "NP/singleNewsForUpdate";
		}
		// 查詢單一筆已上架新聞
			@GetMapping("/getSingleNews/{newsId}")
			public String getSingleNews(@PathVariable String newsId, Model model) {
				NewsBean newsBean = service.getSingleNews(newsId);
				model.addAttribute("newsSingle", newsBean);
				return "NP/singleNews";
			}

		// 查詢單一會員未上架的新聞列表
		@GetMapping("/getMemNewsList/{memberId}")
		public String getMemNewaList(@PathVariable String memberId, Model model) {
			List<NewsBean> list = service.getMemNews(memberId);
			model.addAttribute("memNewsList", list);
			return "NP/memNewsList";
		}
		// 查詢單一會員已上架的新聞列表
			@GetMapping("/getUpMemNewsList/{memberId}")
			public String getUpMemNewaList(@PathVariable String memberId, Model model) {
				List<NewsBean> list = service.getUpMemNews(memberId);
				model.addAttribute("upMemNewsList", list);
				return "NP/upMemNewsList";
			}
			
//			@ModelAttribute
//			public NewsBean editNewsBean() {
//				NewsBean nBean;
//				return nBean;
//			}

}
