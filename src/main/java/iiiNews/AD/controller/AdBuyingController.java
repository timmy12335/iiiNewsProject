package iiiNews.AD.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

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

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import iiiNews.AD.model.AdBean;
import iiiNews.AD.model.AdOrderBean;
import iiiNews.AD.model.AdOrderItemBean;
import iiiNews.AD.model.BuyingCart;
import iiiNews.AD.service.AdMainService;
import iiiNews.AD.service.AdOrderService;
import iiiNews.MB.model.MBBean;

@Controller
@SessionAttributes({"shoppingCart","MBBean"})
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
		String sellername = adbean.getMemberId();
		Timestamp soldDate = new Timestamp(System.currentTimeMillis());
		AdOrderItemBean aoib = new AdOrderItemBean(null, adbean.getAdPk(), adbean.getAdNo(), adbean.getPrice(),
										quantity, sellername, buyername, adbean.getCategoryNo(), adbean.getWidth(),
										adbean.getHeight(), adbean.getAdDate(),soldDate);
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
		//$$$$ MBBean未來要寫得到memberId 目前暫時寫從Attribute取 尚未驗證過!!!
		MBBean mb = (MBBean) model.getAttribute("MBBean");
		String memberId = null;
		if(mb == null) {
			System.out.println("尚未登入");
			model.addAttribute("showmemberId", memberId);
		}else {
			System.out.println("已登入完成");
			memberId = mb.getMemberId();
			System.out.println(memberId);
			model.addAttribute("showmemberId", memberId);
		}
		
		
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
	
	
	/* $$$$ 目前點選確認購物後直接執行 生成一筆訂單 未來是等結帳後才會到這邊*/
	@GetMapping("/checkoutOK.insert")
	public String makingAdOrderItemBeanToRealItem(Model model, WebRequest webRequest, SessionStatus status) {
		
		//$$$$ MBBean未來要寫得到memberId 目前暫時寫從Attribute取 尚未驗證過!!!
		MBBean mb = (MBBean) model.getAttribute("MBBean");
		String memberId ="";
		if(mb == null) {
			System.out.println("按下確認購物 但尚未登入");
			return "redirect:/Login";
		}else {
			System.out.println("按下確認購物 登入完成");
			memberId = mb.getMemberId();
			System.out.println(memberId);
			model.addAttribute("showmemberId", memberId);
		}
	
		BuyingCart cart = (BuyingCart) model.getAttribute("shoppingCart");
		if(cart == null) {
			System.out.println("成功進入/checkoutOK.insert方法 但被cart==null 退回");
			return "redirect:/ShowCartContent";
		}
		

		System.out.println("成功進入/checkoutOK.insert方法");
		
		//生成訂單編號
		String adOrderNo = adOrderService.createOrderNo();
		//取會員資料的部分暫時按上面寫的
		String buyerMemberId = memberId;
		//生成訂購時間
		Timestamp orderDate = new Timestamp(System.currentTimeMillis());
		//將資訊封裝到AdOrderBean 設定0為未付款狀態
		AdOrderBean aob = new AdOrderBean(null, adOrderNo, buyerMemberId, cart.getTotal(), orderDate, 0, null, null);
		
		//取出購物車內的各項商品 把商品做成AdOrderItemBean的Set
		Set<AdOrderItemBean> itemBeanSet = new LinkedHashSet<AdOrderItemBean>();
		Map<Integer, AdOrderItemBean> cartItem = cart.getContent();
		Set<Integer> items = cartItem.keySet();
		//準備取出pk值以用來修改庫存量
		List<Integer> adpkList = new ArrayList<>();
		for(int n : items) {
			AdOrderItemBean aoib = cartItem.get(n);
			aoib.setBuyerMemberId(buyerMemberId);
			aoib.setAdOrderBean(aob);
			itemBeanSet.add(aoib);
			//
			adpkList.add(aoib.getAdPk());
		}
		aob.setItems(itemBeanSet);
		//將資料送出 生成訂單
		int n = adOrderService.saveOrders(aob);
		//修改庫存量
		if(n == 1) {
			for(int pk : adpkList) {
				AdBean bean = adMainService.getOneAdByadPk(pk);
				bean.setStock(bean.getStock()-1);
				adOrderService.changeQuantity(bean);
				if(bean.getStock()==0) {
					adMainService.changeStatus();
				}
			}
		}
		//印在console檢查用
		System.out.println("訂單生成"+n+"筆");
		System.out.println("======完成======");
		
		//若新增成功則清空購物車 移除購物車
//		if(n>0) {
//			System.out.println("交易成功，準備清空購物車");
//			status.setComplete();
//			webRequest.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
//		}
//		return "redirect:/getOrderListByMemberId";
		return "redirect:/removeShoppingCart";
	}
	
	
	//這裡是點選前往結帳，去到綠界結帳，並且更改訂單狀態變成"已付款"
	@GetMapping("/checkoutOK.Pay/{adOrderPk}")
	public void payFunction(Model model, @PathVariable int adOrderPk, HttpServletResponse response) throws IOException {
		
		AdOrderBean aob = adOrderService.getOneOrder(adOrderPk);
		/* 提供金額 訂單編號 時間 商品名稱給綠界
		 * 得到訂單金額並轉成字串
		 * 取得時間並轉成API要的格式*/
		String adOrderNo = aob.getAdOrderNo();
		String money = String.valueOf(aob.getTotalAmount());
		
		Timestamp orderDate = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String tradeDate = sdf.format(orderDate);
		String itemName = "iiiNews AD products#";
		itemName += "#"+adOrderNo+"#Thank you for purchasing.";
		
		System.out.println("=====進入綠界的結帳=====");
		//(串接綠界的結帳API)
		AllInOne all = new AllInOne("");
		AioCheckOutALL obj = new AioCheckOutALL();
		obj.setMerchantTradeNo(adOrderNo);
		obj.setMerchantTradeDate(tradeDate);
		obj.setTotalAmount(money);
		obj.setTradeDesc("test Description");
		obj.setItemName(itemName);
		obj.setReturnURL("http://localhost:8080/iiiNews/");
		obj.setClientBackURL("http://localhost:8080/iiiNews/getOrderListByMemberId");
		obj.setNeedExtraPaidInfo("Y");
		String greenword = all.aioCheckOut(obj, null);
		
		PrintWriter out = response.getWriter();
		out.print("<div>"+greenword+"</div>");
		
		System.out.println("=====結束綠界的結帳=====");
		adOrderService.changePaymentStatus(adOrderPk);
		System.out.println("=====更改完結帳狀態=====");
//		($$$$ 要寫串接綠界的結帳)
//		return "redirect:/getOrderListByMemberId";
	}
	
	
	

}
