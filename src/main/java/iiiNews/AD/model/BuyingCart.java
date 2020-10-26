package iiiNews.AD.model;

import java.util.LinkedHashMap;
import java.util.Map;

public class BuyingCart {

	public BuyingCart() {
	}
	
	//建立一個存放購物內容的map物件 名為cart
	private Map<Integer, AdOrderItemBean> cart = new LinkedHashMap< >();
	
	public void addToCart(int adPk, AdOrderItemBean aoib) {
		cart.put(adPk, aoib);
	}

}
