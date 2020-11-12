package iiiNews.AD.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import iiiNews.AD.model.AdOrderBean;
import iiiNews.AD.service.AdOrderService;

@Controller
@SessionAttributes({"shoppingCart"})
public class AdEndController {

	public AdEndController() {
	}
	
	@Autowired
	AdOrderService adOrderService;
	
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
	
}
