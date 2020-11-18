package iiiNews.NP.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;

import iiiNews.MB.model.MBBean;
import iiiNews.NP.model.NewsBean;
import iiiNews.NP.service.NewsProductService;

@Controller
@SessionAttributes({"MBBean"})
public class SearchNewsController {
	
	@Autowired
	NewsProductService service;
	
	

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
				return "NP/singleNewsCss";
			}
		// 查詢單一筆已上架新聞
		@GetMapping("/getSingleNewsForMem/{newsId}")
			public String getSingleNewsForMem(@PathVariable String newsId, Model model) {
				NewsBean newsBean = service.getSingleNews(newsId);
				model.addAttribute("newsSingle", newsBean);
				return "NP/singleNewsCssForMem";
		}					

		// 查詢單一會員未上架的新聞列表
		
		@GetMapping("/getMemNewsList")
		public String getMemNewaList( Model model) {
			MBBean mb = (MBBean) model.getAttribute("MBBean");
			
			if(mb == null) {	
				System.out.println("請登入");
				return "redirect:/Login";				
			}else {
				String memberId = mb.getMemberId();
				List<NewsBean> list = service.getMemNews(memberId);
				model.addAttribute("memNewsList", list);
				return "NP/memNewsListTest";
			}
			
		}
		// 查詢單一會員已上架的新聞列表
			@GetMapping("/getUpMemNewsList")
			public String getUpMemNewaList( Model model) {
				MBBean mb = (MBBean) model.getAttribute("MBBean");
				if(mb == null) {			
					return "redirect:/Login";
				}else {
					String memberId = mb.getMemberId();
					List<NewsBean> list = service.getUpMemNews(memberId);
					model.addAttribute("upMemNewsList", list);
					return "NP/upMemNewsListTest";
				}
				
			}
			
	
			

}
