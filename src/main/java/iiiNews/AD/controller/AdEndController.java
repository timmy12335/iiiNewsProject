package iiiNews.AD.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import iiiNews.AD.model.AdOrderBean;
import iiiNews.AD.service.AdEndService;
import iiiNews.AD.service.AdOrderService;
import iiiNews.MB.model.CpMemberBean;

@Controller
@SessionAttributes({"CpMemberBean"})
public class AdEndController {

	public AdEndController() {
	}
	
	@Autowired
	AdOrderService adOrderService;
	
	@Autowired
	AdEndService adEndService;
	
	@GetMapping("/testingMonthOrder")
	public String getMonthOrder() {
		List<AdOrderBean> list = adOrderService.getMonthOrder();
		int count = list.size();
		System.out.println(count);
		return "/";
	}
	
	@GetMapping("/getOrderListEnd")
	public String getOrderListEnd() {
		return "/AD/backend/BackOrderList";
	}
	
	@GetMapping("/getBackAdsTotalEnd")
	public String getBackAdsTotalEnd() {
		return "/AD/backend/BackAdsTotal";
	}
	
	/*報表系列*/
	//種類數量柱狀圖 全部沒有會員編號
	@GetMapping("/getEachCatePrice.map")
	public @ResponseBody Map<String, Integer> eachCateCount() {
		ArrayList<String> array = new ArrayList<>();
		array.add("100");
		array.add("200");
		array.add("300");
		array.add("400");
		array.add("500");
		Map<String, Integer> map = adEndService.eachCateCount(array,null);
		return map;
	}
	
	//種類數量柱狀圖 有會員編號
	@GetMapping("/getEachCateCountByCpMem.map")
	public @ResponseBody Map<String, Integer> eachCateCountByCpMem(Model model) {
		CpMemberBean cpbean = (CpMemberBean) model.getAttribute("CpMemberBean");
		String cpmemberId = cpbean.getCpmemberId();
		
		
		ArrayList<String> array = new ArrayList<>();
		array.add("100");
		array.add("200");
		array.add("300");
		array.add("400");
		array.add("500");
		Map<String, Integer> map = adEndService.eachCateCount(array,cpmemberId);
		return map;
	}
	
	@GetMapping("/getEachCatePriceByCpMem.map")
	public @ResponseBody Map<String, Integer> eachCatePriceByCpMem(Model model) {
		CpMemberBean cpbean = (CpMemberBean) model.getAttribute("CpMemberBean");
		String cpmemberId = cpbean.getCpmemberId();
		
		Map<String, Integer> map = adEndService.eachCatePrice(cpmemberId);
		return map;
	}
	
	@GetMapping("/getAllOrderPriceAndCount.map")
	public @ResponseBody Map<String, Integer> allOrderPriceAndCount(Model model){
		Map<String, Integer> map = adEndService.allOrderPriceAndCount();
		return map;
	}
	
}
