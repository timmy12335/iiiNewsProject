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
	private Map<Integer, AdOrderItemBean> cart = new LinkedHashMap< >();
	
	public void addToCart(int adPk, AdOrderItemBean aoib) {
		cart.put(adPk, aoib);
	}

}
