package iiiNews.AD.controller;

import java.sql.Date;
import java.util.ArrayList;
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
import iiiNews.AD.service.AdAjaxSearchService;
import iiiNews.AD.service.AdMainService;

@Controller
@SessionAttributes({"shoppingCart"})
public class AdAjaxController {
	
	@Autowired
	AdMainService service;
	
	@Autowired
	AdAjaxSearchService ajaxService;
	
	public AdAjaxController() {
	}
	
	@GetMapping("/getAjaxList")
	public String getajax() {
		service.changeStatus();
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
	
	//請求ajax的頁面
	@GetMapping("/getAjaxListSearch")
	public String getajax2() {
		service.changeStatus();
		return "AD/ShowAdsByPageAjaxSearch";
	}
	
	//以類別來搜尋
	@GetMapping("/getAdByCateNoAjax.json")
	public @ResponseBody List<AdBean> getAdByCateNoAjax(
			@RequestParam(value="cateNo",defaultValue = "100" )String cateNo) {
		System.out.println(cateNo);
		List<AdBean> list = new ArrayList<AdBean>();
		if(cateNo.equals("none")) {
			list = ajaxService.getAllAdByAjax();
		}else {
			list = ajaxService.getAdByCateNoAjax(cateNo);
		}
		return list;		
	}
	
	//以日期來搜尋
	@GetMapping("/getAdByDateAjax.json")
	public @ResponseBody List<AdBean> getAdByDateAjax(
			@RequestParam(value="date",defaultValue = "2020-11-07" )Date date) {
		System.out.println(date);
		List<AdBean> list = new ArrayList<AdBean>();
//		String dateStr = String.valueOf(date);
//		if(dateStr.equals("2020-11-07")) {
//			list = service.getAllAdByAjax();
//		}else {
			list = ajaxService.getAdByDateAjax(date);
//		}
		return list;		
	}
	
	//以關鍵字來搜尋
	@GetMapping("/getAdByWordAjax.json")
	public @ResponseBody List<AdBean> getAdByWordAjax(
			@RequestParam(value="word",defaultValue = "2020-11-07" )String SearchWord) {
		System.out.println();
		List<AdBean> list = new ArrayList<AdBean>();
//		String dateStr = String.valueOf(date);
//		if(dateStr.equals("2020-11-07")) {
//			list = service.getAllAdByAjax();
//		}else {
			list = ajaxService.getAdByWordAjax(SearchWord);
//		}
		return list;		
	}
	
}
