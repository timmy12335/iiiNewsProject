package iiiNews.AD.dao;

import java.util.List;

import iiiNews.AD.model.AdBean;
import iiiNews.AD.model.AdOrderBean;

public interface AdOrderDao {
	
	public List<AdOrderBean> getMemberOrderList(String memberId);
	
	public AdOrderBean getLastRecord();
	
	public int saveOrders(AdOrderBean aob);
	
	public int changeQuantity(AdBean ab);
	
	public AdOrderBean getOneOrder(int adOrderPk);
	
	public int changePaymentStatus(int adOrderPk);
}
