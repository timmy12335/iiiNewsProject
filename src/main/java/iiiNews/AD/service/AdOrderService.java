package iiiNews.AD.service;

import java.util.List;

import iiiNews.AD.model.AdOrderBean;

public interface AdOrderService {
	
	//注意此處memberId是String還是int 未來會用到!!!
	public List<AdOrderBean> getMemberOrderList(int memberId);
	
	public String createOrderNo();
	
	public int saveOrders(AdOrderBean aob);
}
