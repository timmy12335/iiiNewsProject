package iiiNews.AD.model;

import java.util.LinkedHashMap;
import java.util.Map;

public class BuyingCart {

	public BuyingCart() {
	}
	
	
	/* $$$$ cart
	 * 預計用來寫購物相關的購物車類別
	 * 創建購物車並且將商品(ItemBean)放入購物車以便之後寫入*/
	
	//建立一個存放購物內容的map物件 名為cart
	//key值是廣告的id value值是廣告項目
	private Map<Integer, AdOrderItemBean> cart = new LinkedHashMap< >();
	
	
	//要讓外面可以取得購物車map 寫一個get方法取得購物車
	public Map<Integer, AdOrderItemBean>  getContent() { // ${BuyingCart.content}
		return cart;
	}
	
	
	
	//把商品（傳進來的pk）加入到購物車裡
	public void addToCart(int adPk, AdOrderItemBean aoib) {
		
		//$$$$ 前端要處理return!!!
		if (aoib.getQuantity() <=0) {
			//.......
			return;
		}
		
		cart.put(adPk, aoib);
		
//		可能不用下面兩行 因為單一商品不以複數項顯示
//		AdOrderItemBean adItemBean = cart.get(adPk);
//		adItemBean.setQuantity(aoib.getQuantity()+adItemBean.getQuantity());
	}
	
	
	

}
