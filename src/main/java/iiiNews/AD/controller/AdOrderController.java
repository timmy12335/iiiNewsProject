package iiiNews.AD.controller;

import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import iiiNews.AD.model.AdOrderBean;
import iiiNews.AD.model.AdOrderItemBean;
import iiiNews.AD.model.BuyingCart;
import iiiNews.AD.service.AdOrderService;

@Controller
@SessionAttributes({"shoppingCart"})
public class AdOrderController {
	
	@Autowired
	AdOrderService service;
	
	public AdOrderController() {
	}
	
	
	//$$$$ orderlist此getmapping方法打算是用會員Id來查訂單
	//.......@GetMapping("/")
	public String MemberAdOrderList(Model model) {
		
		//^^^^ 注意此處memberId是String還是int 未來會用到!!!
		//$$$$ 未來要寫得到memberId 目前沒寫!!!
//		int memberId = 0;
		
//		List<AdOrderBean> orderlist = service.getMemberOrderList(memberId);
		//.......
//		model.addAttribute("memberOrderList", orderlist);
		return "";
	}
	
	
	/*點選確認購物後 未來是等結帳後才會到這邊*/
	@GetMapping("/checkoutOK.insert")
	public String makingAdOrderItemBeanToRealItem(Model model) {
		BuyingCart cart = (BuyingCart) model.getAttribute("shoppingCart");
		if(cart == null) {

			System.out.println("成功進入/checkoutOK.insert方法 但被cart==null 退回");
			return "redirect:/ShowCartContent";
		}
		

		System.out.println("成功進入/checkoutOK.insert方法");
		
		String adOrderNo = service.createOrderNo();
		String buyerMemberId = null;
		Timestamp orderDate = new Timestamp(System.currentTimeMillis());
		
		AdOrderBean aob = new AdOrderBean(null, adOrderNo, buyerMemberId, cart.getTotal(), orderDate, null, null);
		Set<AdOrderItemBean> itemBeanSet = new LinkedHashSet<AdOrderItemBean>();
		
		Map<Integer, AdOrderItemBean> cartItem = cart.getContent();
		Set<Integer> items = cartItem.keySet();
		for(int n : items) {
			AdOrderItemBean aoib = cartItem.get(n);
			aoib.setAdOrderBean(aob);
			itemBeanSet.add(aoib);
		}
		aob.setItems(itemBeanSet);
		
		
		System.out.println("======完成======");
		System.out.println("aob:"+aob.toString());
//		System.out.println("itemBeanSet:"+itemBeanSet.toString());
//		System.out.println("adOrderNo:"+adOrderNo);
		
		int n = service.saveOrders(aob);
		System.out.println("訂單新增"+n+"筆");
		return "redirect:/";
	}
	
	
}
