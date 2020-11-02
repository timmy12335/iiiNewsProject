package iiiNews.AD.dao;

import java.util.List;

import iiiNews.AD.model.AdOrderBean;

public interface AdOrderDao {
	
	public List<AdOrderBean> getMemberOrderList(String memberId);
	
	public AdOrderBean getLastRecord();
	
	public int saveOrders(AdOrderBean aob);
}
