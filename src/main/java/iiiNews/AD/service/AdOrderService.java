package iiiNews.AD.service;

import java.util.List;

import iiiNews.AD.model.AdOrderBean;

public interface AdOrderService {
	
	public List<AdOrderBean> getMemberOrderList(String memberId);
	
	public String createOrderNo();
	
	public int saveOrders(AdOrderBean aob);
}
