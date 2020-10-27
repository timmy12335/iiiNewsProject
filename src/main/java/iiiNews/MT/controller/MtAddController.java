package iiiNews.MT.controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import iiiNews.MT.model.MtAddBean;
import iiiNews.MT.service.MtAddService;

@Controller
public class MtAddController {

	@Autowired
	MtAddService service;
	
	@GetMapping("/MtCreate")
	public String toCreateForm(Model model) {
		MtAddBean bean = new MtAddBean();
		bean.setCategory("惡搞");
		bean.setTitle("今晚吃啥");
//		bean.setImgLink(null);
		bean.setVideoLink("https://www.youtube.com/watch?v=n-hy9MswmcA");
		bean.setArticle("HELLO,HELLO,小名");
		
		model.addAttribute("mtBean", bean);
		return "MT/Create";
	}
	
	@PostMapping("/MtCreate")
	public String CreateForm(
		@ModelAttribute("mtBean") MtAddBean bean, Model model) {
		
		bean.setArticleId("100-20-1025-144830-001");
		Timestamp uploadDate = new Timestamp(System.currentTimeMillis());
		bean.setUpdateDate(uploadDate);
		
		int n = service.saveMtAddService(bean);
		System.out.println("成功筆數："+n);
		return "index";
	}
	
	@GetMapping("/getAllMts")
	public String getAllMtsList(Model model) {
		List<MtAddBean> list = service.getAllMtService();
		model.addAttribute("mtAllLists", list);
		return "MT/showCreate";
	}
	
}
