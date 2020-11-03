package iiiNews.AD.controller;

import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

import iiiNews.AD.model.AdOrderBean;
import iiiNews.AD.model.AdOrderItemBean;
import iiiNews.AD.model.BuyingCart;
import iiiNews.AD.service.AdItemService;
import iiiNews.AD.service.AdOrderService;

@Controller
@SessionAttributes({"shoppingCart"})
public class AdOrderController {
	
	@Autowired
	AdOrderService adOrderService;
	
	@Autowired
	AdItemService itemService;
	
	public AdOrderController() {
	}
	
	
	//$$$$ 此方法打算是用普通會員Id來查訂單
	@GetMapping("/getOrderListByMemberId")
	public String MemberAdOrderList(Model model) {
		
		//$$$$ 未來要寫得到memberId 目前暫時寫從Attribute取 尚未驗證過!!!
//		MBBean mb = (MBBean) model.getAttribute("Login_PK");
//		String memberId = mb.getMemberId();
		
		String memberId = "frank";
		
		List<AdOrderBean> orderlist = adOrderService.getMemberOrderList(memberId);
		model.addAttribute("memberOrderList", orderlist);
		return "AD/memberAllOrderList";
	}
	
	/*傳入訂單編號 得到該訂單的所有內容品項*/
	@GetMapping("/getItemByOrderPk/{adOrderPk}")
	public String GetAdOrderByOrderPk(Model model,
									@PathVariable int adOrderPk) {
		List<AdOrderItemBean> itemBeans = itemService.getItemsInOneOrder(adOrderPk);
		model.addAttribute("AdOrderItems", itemBeans);
		return "AD/memberItemsList";
	}
	
	@GetMapping("/getOneItem/{itemPk}")
	public String GetOneOrder(Model model,
							@PathVariable int itemPk) {
		AdOrderItemBean oneItemBean = itemService.getOneItems(itemPk);
		model.addAttribute("oneItem", oneItemBean);
		return "AD/orders/showOneItem";
	}
	
	
	/*點選確認購物後 未來是等結帳後才會到這邊*/
	@GetMapping("/checkoutOK.insert")
	public String makingAdOrderItemBeanToRealItem(Model model, WebRequest webRequest, SessionStatus status) {
	
		BuyingCart cart = (BuyingCart) model.getAttribute("shoppingCart");
		if(cart == null) {
			System.out.println("成功進入/checkoutOK.insert方法 但被cart==null 退回");
			return "redirect:/ShowCartContent";
		}
		

		System.out.println("成功進入/checkoutOK.insert方法");
		
		String adOrderNo = adOrderService.createOrderNo();
		//取會員資料的部分暫時寫死
		String buyerMemberId = "frank";
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
		
		int n = adOrderService.saveOrders(aob);
		System.out.println("訂單新增"+n+"筆");
		
		//若新增成功則清空購物車
		if(n>0) {
			System.out.println("交易成功，準備清空購物車");
			status.setComplete();
			webRequest.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
		}
		return "redirect:/";
	}
	
	
}
