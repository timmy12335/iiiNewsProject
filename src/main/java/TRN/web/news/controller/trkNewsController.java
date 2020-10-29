package TRN.web.news.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import TRN.web.news.model.trkNewsBean;
import TRN.web.news.service.trkNewsService;

@Controller
public class trkNewsController {

	trkNewsService service;

	@Autowired
	public void setService(trkNewsService service) {
		this.service = service;
	}

	@GetMapping("/trkNews")     //查詢所有資料
	public String list(Model model) {
		List<trkNewsBean> list = service.getAllProducts();
		model.addAttribute("trkNews", list);
		return "TRN/trkNews";
	}
//	@RequestMapping("/update/news")            //點按鈕直接更新數量
//	public String updateStock(Model model) {
//		service.updateAllStocks();
//		return "redirect:/products";
//	}

	@RequestMapping("/queryByType")          //分類查詢 show有哪些分類
	public String gettypeList(Model model) {
		List<String>  list = service.getAlltypes();
		model.addAttribute("typeList", list);
		return "TRN/type";
	}

	@RequestMapping("/trkNews/{type}")      //分類查詢 show 單個分類所有新聞 
	public String getNewsBytypes(@PathVariable("type") String type, Model model){
		List<trkNewsBean> trkNews = service.getNewsBytypes(type);
		model.addAttribute("trkNews", trkNews);
		return "TRN/trkNews";
	}

	@RequestMapping("/trkNew")                       //查詢單筆產品資料
	public String getNewsById(@RequestParam("id") Integer id, Model model){ 
		model.addAttribute("trkNew", service.getNewsById(id));
		return "TRN/trkNew";
	}
}
