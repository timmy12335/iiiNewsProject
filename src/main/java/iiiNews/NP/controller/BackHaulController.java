package iiiNews.NP.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import iiiNews.NP.model.NewsOrderBean;
import iiiNews.NP.service.NewsBackHaulService;
//後臺使用
@Controller
public class BackHaulController {
	@Autowired
	NewsBackHaulService service;
	
	
	@GetMapping("/getNewsTypeForBB")
	public String numNewsForPie() {
		return "NP/pieForBB";
	}
		
	//將類別筆數回傳json
	@GetMapping("/getNewsTypeForBB.json")
	public @ResponseBody Map<String,Long> getNewsTypeForBB(){	
		System.out.println(service.getNewByTypeForBB());
		return service.getNewByTypeForBB();		 
	}
	//將類別總金額回傳json
	@GetMapping("/getNewsCountForBB.json")
	public Map<String,Integer> getNewsCountForBB(){
		
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("交通", service.getNewsCountForBB("交通"));
		map.put("糾紛", service.getNewsCountForBB("糾紛"));
		map.put("感情", service.getNewsCountForBB("感情"));
		map.put("詐騙", service.getNewsCountForBB("詐騙"));
		map.put("災情", service.getNewsCountForBB("災情"));
		map.put("爆料", service.getNewsCountForBB("爆料"));
		
	
		return map;
	}
	
	// 下架一則新聞
		@GetMapping("/delSingleNewsForBB/{newsId}")
		public String delSingleNews(@PathVariable String newsId) {

			service.delSingleNewsForBB(newsId);
			return "redirect:/getAllNews";
		}
		
	//查詢所有訂單資料
		@GetMapping("/OrderListForBB")
		public String OrderList() {			
				return "NP/NewsOrderListAjaxForBB";				
		}

		@GetMapping("/getOrderByAjaxForBB.json")
		public @ResponseBody List<NewsOrderBean> getOrderForBB(){
			return service.getOrderForBB();
		}

}
