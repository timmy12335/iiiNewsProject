package iiiNews.AD.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import iiiNews.AD.model.AdBean;
import iiiNews.AD.model.AdOrderItemBean;
import iiiNews.AD.model.BuyingCart;
import iiiNews.AD.service.AdMainService;

@Controller
public class AdBuyingController {

	@Autowired
	AdMainService adMainService;
	
	public AdBuyingController() {
	}
	/* $$$$
	 * 預計用來寫購物相關的東西   應該會跟加入購物車有關  BuyingCart.java購物車類別
	 * 創建購物車並且將商品(ItemBean)放入購物車以便之後寫入*/
	
	//$$$$	購物相關 還沒寫
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
		
//		Map<Integer, AdBean> adMap = session
		
		AdBean adbean = adMainService.getOneAdByadPk(adPk);
		
		String buyername = "frank";
		String sellername = "storeFrank";
		AdOrderItemBean aoib = new AdOrderItemBean(null, adbean.getAdPk(), adbean.getPrice(), quantity, sellername, buyername);
		//+++++ 改寫到service
		cart.addToCart(adPk, aoib);
		return "redirect:/";
	}
	
	
	

}
