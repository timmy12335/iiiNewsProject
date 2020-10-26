package iiiNews.AD.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import iiiNews.AD.model.AdOrderBean;
import iiiNews.AD.service.AdOrderService;

@Controller
public class AdOrderController {
	
//	@Autowired
//	AdOrderService service;
	
	public AdOrderController() {
	}
	
	
	//$$$$ orderlist此getmapping方法打算是用會員Id來查訂單
	//.......@GetMapping("/")
	public String MemberAdOrderList(Model model) {
		
		//^^^^ 注意此處memberId是String還是int 未來會用到!!!
		//$$$$ 未來要寫得到memberId 目前沒寫!!!
		int memberId = 0;
		
//		List<AdOrderBean> orderlist = service.getMemberOrderList(memberId);
		//.......
//		model.addAttribute("memberOrderList", orderlist);
		return "";
	}
	
	
}
