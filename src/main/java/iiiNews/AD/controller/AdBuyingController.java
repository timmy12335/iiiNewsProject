package iiiNews.AD.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
@SessionAttributes({"shoppingCart","MBBean","discount"})
public class AdBuyingController {

	@Autowired
	AdMainService adMainService;
	
	@Autowired
	AdOrderService adOrderService;
	
	public AdBuyingController() {
	}
	/* 本Controller方法用來寫購物相關的東西
	 * 跟加入購物車有關  BuyingCart.java購物車類別
	 * 創建購物車並且將商品(ItemBean)放入購物車以便之後寫入訂單、操作折扣等等購物車功能*/
	
	
	/**加入購物車 得到商品的int adPk與數量int quantity**/
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
		//折扣問題處理
		int unitPrice = adbean.getPrice();
		
		double middlediscount;
		int afterdiscount;
		if (model.getAttribute("discount") != null) {
			System.out.println("加入購物車的discount方法");
			System.out.println("unitPrice:"+unitPrice);
			Double discount = (Double) model.getAttribute("discount");
			middlediscount = adbean.getPrice()*discount;
			afterdiscount = (new BigDecimal(middlediscount).setScale(0, BigDecimal.ROUND_HALF_UP)).intValue();
			unitPrice = afterdiscount;
			System.out.println("middlediscount:"+middlediscount+","+"afterdiscount:"+afterdiscount+","+"unitPrice:"+unitPrice);
		}
		
		//買家名稱暫時寫死的 為空字串 等到按下checkout後再寫入
		String buyername = "";
		String sellername = adbean.getMemberId();
		Timestamp soldDate = new Timestamp(System.currentTimeMillis());
		AdOrderItemBean aoib = new AdOrderItemBean(null, adbean.getAdPk(), adbean.getAdNo(), unitPrice,
										quantity, sellername,adbean.getMemberName(), buyername, adbean.getCategoryNo(), adbean.getWidth(),
										adbean.getHeight(), adbean.getAdDate(),soldDate);
		//+++++ 未來應改寫到service
		cart.addToCart(adPk, aoib);
		
		//檢查用
//		System.out.println("AdBuyingController.java === addProductToCart");
//		System.out.println("cart:" +cart.toString());
//		System.out.println("adPk:" + adPk);
//		System.out.println("aoib:"+aoib.toString());
//		System.out.println("cart content:"+cart.getContent());
		
		model.addAttribute("shoppingCart", cart);
		
		return "redirect:/ShowCartContent";
	}
	
	/**查看購物車內容**/
	@GetMapping("/ShowCartContent")
	public String showCartContent(Model model) {
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
	
	/**點選刪除購物車內容 一筆筆**/
	@GetMapping("/DeleteFromCart/{adPk}")
	public String deleteCartItem(Model model,
							@PathVariable int adPk) {
		BuyingCart cart = (BuyingCart) model.getAttribute("shoppingCart");
		cart.removeFromCart(adPk);
		return "redirect:/ShowCartContent";
	}
	
	
	/*目前點選確認購物後直接執行 生成一筆訂單 狀態則是尚未結帳*/
	@GetMapping("/checkoutOK.insert")
	public String makingAdOrderItemBeanToRealItem(Model model, WebRequest webRequest, SessionStatus status) {
		
		/* 檢查Member是否有登入
		 * 確認有登入後再去取購物車
		 * 若無則彈回*/
		MBBean mb = (MBBean) model.getAttribute("MBBean");
		String memberId ="";
		if(mb == null) {
			System.out.println("按下確認購物 但尚未登入");
			return "redirect:/Login";
		}else {
			System.out.println("按下確認購物 登入完成，memberId："+memberId);
			memberId = mb.getMemberId();
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
		//取會員資料買家帳號
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
			/* 把商品AdOrderItemBean一一放入Set中
			 * (雙向多對一  一方有個多 儲存多方的物件)
			 * 再將此儲存多方的物件Set用setter到aob的setItems中
			 * adpkList是為了修改庫存量*/
			itemBeanSet.add(aoib);
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
		
		/*若新增成功則清空購物車 移除購物車
		 * 但移除attribute不能在此controller中進行
		 * 不能使用
		 * status.setComplete();
		 * webRequest.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
		 * 否則會把所有的attribute都清掉
		 * 因此為了移除特地多寫了一個controller方法
		 * 導向removeShoppingCart*/
		
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
		System.out.println(greenword);
		System.out.println("=====更改完結帳狀態=====");
//		($$$$ 要寫串接綠界的結帳)
//		return "redirect:/getOrderListByMemberId";
	}
	
	
	/**折扣碼：傳入折扣碼String discountStr判斷**/
	/* 取出購物車內容
	 * 若購物車為空則回覆並返回購物車頁面
	 * 若不為空 比對discountStr並取出折扣數進行操作 重新設定商品的價格*/
	@GetMapping("/getDiscount")
	public String discount(Model model,@RequestParam String discountStr,RedirectAttributes redirectAtt) {
		BuyingCart cart = (BuyingCart) model.getAttribute("shoppingCart");
		if(cart == null) {
			System.out.println("購物車為空");
			redirectAtt.addFlashAttribute("FlashMSG_discountFail", "購物車為空");
			return  "AD/shoppingCartTest";
		}
		//預設折扣為100%(即無折扣)
		Double discount = 1.0;
		
		/* 讀取折扣碼檔案 將檔案內的 key||value寫入map物件中
		 * 設定FileInputStream讀入檔案
		 * InputStreamReader的建構子可進行解碼(InputStream in,String charsetName)
		 * 將byte資料流轉為character資料流
		 * 再利用BufferedReader一行行讀取資料
		 * 每行讀取進來後利用spilt切割 同時放入map物件
		 * key放key value轉型為Double後放入value*/
		String line = "";
		Map<String,Double> map = new HashMap<>();
		try (FileInputStream fis = new FileInputStream("C:\\_springMVC\\workspace\\iiiNews\\data\\discount.txt");
			InputStreamReader isr = new InputStreamReader(fis, "UTF-8");
			BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				String[] sa = line.split("\\|");
				map.put(sa[0],Double.valueOf(sa[1]));
			}
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		
		/* 檢查折扣碼是否存在在map當中
		 * 為避免使用者輸入小寫 因此強制都轉為大寫後再進行比對
		 * 若為真則取出該折扣碼對應的折扣數 放入Double discount中
		 * 並設立model物件存放屬性物件
		 * 若比對不成功 回覆查無折扣碼並重導回購物車頁面*/
		String upperDiscountStr = discountStr.toUpperCase();
		if (map.containsKey(upperDiscountStr)) {
			System.out.println("contain:"+map.get(discountStr));
			discount = map.get(upperDiscountStr);
			model.addAttribute("discount", discount);
		}else {
			redirectAtt.addFlashAttribute("FlashMSG_discountFail", "查無折扣碼");
			return  "redirect:/ShowCartContent";
		}
		
		
//		if(discountStr.equals("HELLO")) {
//			discount = 0.8;
//			model.addAttribute("discount", discount);
//		}else {
//			redirectAtt.addFlashAttribute("FlashMSG_discountFail", "查無折扣碼");
//			return  "redirect:/ShowCartContent";
//		}
		
		/* 處理購物車內商品打折問題
		 * 將購物車內的商品一一取出
		 * keySet取到購物車物件map的key值
		 * 跑迴圈後取出AdOrderItemBean
		 * 利用所存放的pk值去找到AdBean 拿到商品的價格
		 * 若此處是拿AdOrderItemBean內所抄寫的價格
		 * 會造成折扣碼重複輸入後價格不斷打折的問題
		 * 因此改用AdBean取出原商品的價格避免出錯
		 * 計算完折扣數後
		 * 使用BigDecimal並去取得捨棄小數點與四捨五入後的值
		 * 再重新放入AdOrderItemBean內的價格*/
		Double pay;
		Integer count;
		
		Set<Integer> item = cart.getContent().keySet();
		for(int n : item) {
			AdOrderItemBean bean = cart.getContent().get(n);
			
			AdBean adbean = adMainService.getOneAdByadPk(bean.getAdPk());
			int price = adbean.getPrice();
			
			pay = price * discount;
			count = (new BigDecimal(pay).setScale(0, BigDecimal.ROUND_HALF_UP)).intValue();
			bean.setUnitPrice(count);
		}
		
		return "redirect:/ShowCartContent";
	}
	
	


}
