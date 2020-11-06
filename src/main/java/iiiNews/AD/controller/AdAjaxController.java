package iiiNews.AD.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import iiiNews.AD.model.AdBean;
import iiiNews.AD.service.AdMainService;

@Controller
@SessionAttributes({"shoppingCart"})
public class AdAjaxController {
	
	@Autowired
	AdMainService service;
	
	public AdAjaxController() {
	}
	
	@GetMapping("/getAjaxList")
	public String getajax() {
		return "AD/ShowAdsByPageAjax";
	}

	
	@GetMapping("/pagingAdsData.json")
	public @ResponseBody List<AdBean> getAdPage(
			@RequestParam(value="pageNo",defaultValue = "1" )Integer pageNo) {	
		List<AdBean> list =  service.getPageAds(pageNo);
		return list;		
	}
	
	@GetMapping("/pagingAdsNo")
	public @ResponseBody Map<String, Integer> getPage(
			@RequestParam(value="pageNo",defaultValue = "1" )Integer pageNo,
			@RequestParam(value="totalPage", defaultValue = "1") Integer totalPage) {	
		
		totalPage = service.getTotalPageCount();
		Map<String, Integer>  map = new HashMap<>();
        map.put("totalPage", totalPage);
        map.put("currPage", pageNo);
		return map;
	
	}
	
	
	//****************************************
	
	@GetMapping("/getAjaxListSearch")
	public String getajax2() {
		return "AD/ShowAdsByPageAjaxSearch";
	}
	
	@GetMapping("/getAdByCateNoAjax.json")
	public @ResponseBody List<AdBean> getAdByCateNoAjax(
			@RequestParam(value="cateNo",defaultValue = "100" )String cateNo) {
		System.out.println(cateNo);
		List<AdBean> list =  service.getAdByCateNoAjax(cateNo);
		return list;		
	}
	
	
	
}
