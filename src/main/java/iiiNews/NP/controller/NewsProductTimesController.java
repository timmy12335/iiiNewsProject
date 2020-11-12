package iiiNews.NP.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import iiiNews.NP.model.NewsBean;
import iiiNews.NP.service.NewsProductService;
import iiiNews.NP.service.NewsUpdateService;

@Controller
public class NewsProductTimesController {
	@Autowired
	NewsProductService productservice;
	@Autowired
	NewsUpdateService updateService;

	// 一般會員輸入限時時間，塞進資料庫，並開始計時
	@PostMapping("/updateLimitTime")
	public String findtime(@RequestParam String newsId, @RequestParam String limitTime) {
		System.out.println("limitTime1106=" + limitTime);
		updateService.updatelimitTime(limitTime, newsId);
		return "redirect:/getUpMemNewsList/A0002"; //之後要跳轉到會員個人頁面{MemberId}
	}

	// 判斷若時間到就下架,並重整頁面
	@GetMapping("/changeStautsForTime")
	public String changeStautsForTime(Model model) {
		List<NewsBean> list = productservice.checkTime();
		model.addAttribute("newsLists", list);
		return "/NP/allNewsListTest";
	}

}
