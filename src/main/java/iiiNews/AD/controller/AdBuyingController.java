package iiiNews.AD.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import iiiNews.AD.model.AdBean;
import iiiNews.AD.model.AdOrderItemBean;
import iiiNews.AD.model.BuyingCart;
import iiiNews.AD.service.AdMainService;

@Controller
@SessionAttributes({"shoppingCart"})
public class AdBuyingController {

	@Autowired
	AdMainService adMainService;
	
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
	
	@GetMapping("/ShowCartContent")
	public String showCartContent(Model model) {
		//...未來保留寫確認會員登入
		return  "AD/shoppingCart";
	}
	
	
	@GetMapping("/DeleteFromCart/{adPk}")
	public String deleteCartItem(Model model,
							@PathVariable int adPk) {
		System.out.println("hello--------");
		BuyingCart cart = (BuyingCart) model.getAttribute("shoppingCart");
		cart.removeFromCart(adPk);
		
		return "redirect:/ShowCartContent";
	}
	
	
	

}
