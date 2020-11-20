package iiiNews.AD.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

@Controller
@SessionAttributes({"shoppingCart","discount"})
public class DeleteCartController {

	public DeleteCartController() {
	}
	
	@RequestMapping("/removeShoppingCart")
	public String removeCart(Model model, WebRequest webRequest, SessionStatus status) {
		System.out.println("交易成功，準備清空購物車");
		status.setComplete();
		webRequest.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
		return "redirect:/getOrderListByMemberId";
	}
	
	@RequestMapping("/removeShoppingCart.returnCartPage")
	public String removeCartReturn(Model model, WebRequest webRequest, SessionStatus status) {
		System.out.println("點選清空購物車");
		status.setComplete();
		webRequest.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
		return "redirect:/ShowCartContent";
	}
}
