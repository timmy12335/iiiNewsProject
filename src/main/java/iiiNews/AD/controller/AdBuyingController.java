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
	
	
	//購物相關 還沒寫
	@GetMapping
	public String buying (Model model) {
		BuyingCart cart = new BuyingCart();
		int adPk = 0;
		AdOrderItemBean aoib = null;
		cart.addToCart(adPk, aoib);
		return "";
	}

}
