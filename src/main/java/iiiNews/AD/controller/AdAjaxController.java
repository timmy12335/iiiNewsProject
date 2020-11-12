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
import iiiNews.AD.model.AdOrderBean;
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
	
	//後臺請求ajax的頁面
		@GetMapping("/backGetAdListAjax")
		public String getajaxBack() {
			service.changeStatus();
			return "AD/backend/BackAdsAjax";
		}
	
	//全部搜尋 (限制上架)
	@GetMapping("/getAdByAjax.json")
	public @ResponseBody List<AdBean> getAdByAjax() {
		List<AdBean> list = new ArrayList<AdBean>();
		list = ajaxService.getAllAdByAjax("");
		return list;		
	}
	
	//以類別來搜尋 (限制上架)
	@GetMapping("/getAdByCateNoAjax.json")
	public @ResponseBody List<AdBean> getAdByCateNoAjax(
			@RequestParam(value="cateNo",defaultValue = "-1" )String cateNo,
			@RequestParam(value="set",defaultValue = "onsale" )String set) {
		System.out.println(cateNo);
		List<AdBean> list = new ArrayList<AdBean>();
		if(cateNo.equals("-1")&&set.equals("ALL")) {
			list = ajaxService.getAllAdByAjax(set);
		}else if(cateNo.equals("-1")){
			list = ajaxService.getAllAdByAjax("");
		}else {
			list = ajaxService.getAdByCateNoAjax(cateNo,set);
		}
		return list;
	}
	
	//以日期來搜尋 (限制上架)
	@GetMapping("/getAdByDateAjax.json")
	public @ResponseBody List<AdBean> getAdByDateAjax(
			@RequestParam(value="date",defaultValue = "2020-11-07" )Date date,
			@RequestParam(value="set",defaultValue = "onsale" )String set) {
		System.out.println(date);
		List<AdBean> list = new ArrayList<AdBean>();
		list = ajaxService.getAdByDateAjax(date,set);
		return list;		
	}
	
	//以關鍵字來搜尋 (限制上架)
	@GetMapping("/getAdByWordAjax.json")
	public @ResponseBody List<AdBean> getAdByWordAjax(
			@RequestParam(value="word",defaultValue = "2020-11-07")String SearchWord,
			@RequestParam(value="set",defaultValue = "onsale" )String set) {
		System.out.println();
		List<AdBean> list = new ArrayList<AdBean>();
		list = ajaxService.getAdByWordAjax(SearchWord,set);
		return list;		
	}
	
	
	@GetMapping("/getOrderListByAjax.json")
	public @ResponseBody List<AdOrderBean> getOrderByAjax(
			@RequestParam(value="buyerMemberId",defaultValue = "ALL" )String buyerMemberId,
			@RequestParam(value="adOrderNo",defaultValue = "ALL" )String adOrderNo,
			@RequestParam(value="orderDate",defaultValue = "2020-11-07" )String orderDate) {
		List<AdOrderBean> list = new ArrayList<AdOrderBean>();
		list = ajaxService.getOrderByAjax(buyerMemberId, adOrderNo, orderDate);
		return list;		
	}
	
	
	
	
}
