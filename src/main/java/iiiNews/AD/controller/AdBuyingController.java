package iiiNews.AD.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

import iiiNews.AD.model.AdBean;
import iiiNews.AD.model.AdOrderBean;
import iiiNews.AD.model.AdOrderItemBean;
import iiiNews.AD.model.BuyingCart;
import iiiNews.AD.service.AdMainService;
import iiiNews.AD.service.AdOrderService;

@Controller
@SessionAttributes({"shoppingCart"})
public class AdBuyingController {

	@Autowired
	AdMainService adMainService;
	
	@Autowired
	AdOrderService adOrderService;
	
	public AdBuyingController() {
	}
	/* $$$$
	 * 預計用來寫購物相關的東西   應該會跟加入購物車有關  BuyingCart.java購物車類別
	 * 創建購物車並且將商品(ItemBean)放入購物車以便之後寫入*/
	
	
	/*把商品加入購物車
	 * 點擊加入購物車後，一起傳入該商品的adPk以及預設的數量quantity(數量為一)
	 * 從model中找出名為shoppingCart的屬性物件
	 * 該屬性物件的屬性值是一個BuyingCart物件cart
	 * cart內是一個存放購物內容的map物件 key值是廣告的id value值是廣告項目
	 * 在此要準備一個廣告項目物件以便放進上述的map的value供瀏覽以及未來使用
	 * 把相關資訊封裝在AdOrderItemBean aiob裡面使用*/
	@PostMapping("/addProductToCart")
	public String buyingAd (Model model,
						@RequestParam int adPk,
						@RequestParam int quantity) {
		
		//預計會取出既有的購物車物件 若無則新增
		BuyingCart cart = (BuyingCart) model.getAttribute("shoppingCart");
		if(cart == null) {
			cart = new BuyingCart();
			model.addAttribute("shoppingCart", cart);
		}
		
		AdBean adbean = adMainService.getOneAdByadPk(adPk);
		
		//名字暫時寫死的
		String buyername = "frank";
		String sellername = "storeFrank";
		AdOrderItemBean aoib = new AdOrderItemBean(null, adbean.getAdPk(), adbean.getAdNo(), adbean.getPrice(),
										quantity, sellername, buyername, adbean.getCategoryNo(), adbean.getWidth(),
										adbean.getHeight(), adbean.getAdDate());
		//+++++ 改寫到service
		cart.addToCart(adPk, aoib);
		
		System.out.println("AdBuyingController.java === addProductToCart");
		System.out.println("cart:" +cart.toString());
		System.out.println("adPk:" + adPk);
		System.out.println("aoib:"+aoib.toString());
		System.out.println("cart content:"+cart.getContent());
		model.addAttribute("shoppingCart", cart);
		
		return "redirect:/ShowCartContent";
	}
	
	/*查看購物車內容*/
	@GetMapping("/ShowCartContent")
	public String showCartContent(Model model) {
		//...未來保留寫確認會員登入
		return  "AD/shoppingCartTest";
	}
	
	/*點選刪除購物車內容 一筆筆*/
	@GetMapping("/DeleteFromCart/{adPk}")
	public String deleteCartItem(Model model,
							@PathVariable int adPk) {
		BuyingCart cart = (BuyingCart) model.getAttribute("shoppingCart");
		cart.removeFromCart(adPk);
		return "redirect:/ShowCartContent";
	}
	
	
	/* $$$$ 目前點選確認購物後直接執行 未來是等結帳後才會到這邊*/
	@GetMapping("/checkoutOK.insert")
	public String makingAdOrderItemBeanToRealItem(Model model, WebRequest webRequest, SessionStatus status) {
	
		BuyingCart cart = (BuyingCart) model.getAttribute("shoppingCart");
		if(cart == null) {
			System.out.println("成功進入/checkoutOK.insert方法 但被cart==null 退回");
			return "redirect:/ShowCartContent";
		}
		

		System.out.println("成功進入/checkoutOK.insert方法");
		
		//生成訂單編號
		String adOrderNo = adOrderService.createOrderNo();
		//取會員資料的部分暫時寫死
		String buyerMemberId = "john";
		//生成訂購時間
		Timestamp orderDate = new Timestamp(System.currentTimeMillis());
		//將資訊封裝到AdOrderBean
		AdOrderBean aob = new AdOrderBean(null, adOrderNo, buyerMemberId, cart.getTotal(), orderDate, 0, null, null);
		
		//取出購物車內的各項商品 把商品做成AdOrderItemBean的Set
		Set<AdOrderItemBean> itemBeanSet = new LinkedHashSet<AdOrderItemBean>();
		Map<Integer, AdOrderItemBean> cartItem = cart.getContent();
		Set<Integer> items = cartItem.keySet();
		//
		List<Integer> adpkList = new ArrayList<>();
		for(int n : items) {
			AdOrderItemBean aoib = cartItem.get(n);
			aoib.setAdOrderBean(aob);
			itemBeanSet.add(aoib);
			//
			adpkList.add(aoib.getAdPk());
		}
		aob.setItems(itemBeanSet);
		
		int n = adOrderService.saveOrders(aob);
		
		if(n == 1) {
			for(int pk : adpkList) {
				AdBean bean = adMainService.getOneAdByadPk(pk);
				bean.setStock(bean.getStock()-1);
				adOrderService.changeQuantity(bean);
			}
			
			
		}
		//印在console檢查用
		System.out.println("訂單新增"+n+"筆");
		System.out.println("======完成======");
		System.out.println("aob:"+aob.toString());
		
		//若新增成功則清空購物車
		if(n>0) {
			System.out.println("交易成功，準備清空購物車");
			status.setComplete();
			webRequest.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
		}
		return "redirect:/";
	}
	
	
	

}
