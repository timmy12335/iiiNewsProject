package iiiNews.AD.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import iiiNews.AD.model.AdOrderItemBean;
import iiiNews.AD.model.BuyingCart;

@Controller
public class AdBuyingController {

	public AdBuyingController() {
	}
	/* $$$$
	 * 預計用來寫購物相關的東西   應該會跟加入購物車有關  BuyingCart.java購物車類別
	 * 創建購物車並且將商品(ItemBean)放入購物車以便之後寫入*/
	
	//$$$$	購物相關 還沒寫
	@GetMapping
	public String buying (Model model) {
		BuyingCart cart = new BuyingCart();
		int adPk = 0;
		AdOrderItemBean aoib = null;
		cart.addToCart(adPk, aoib);
		return "";
	}

}
