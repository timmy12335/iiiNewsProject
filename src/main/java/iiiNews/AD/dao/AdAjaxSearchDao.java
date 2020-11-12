package iiiNews.AD.dao;

import java.sql.Date;
import java.util.List;

import iiiNews.AD.model.AdBean;
import iiiNews.AD.model.AdOrderBean;

public interface AdAjaxSearchDao {
	
	public List<AdBean> getAllAdByAjax(String set);
	
	public List<AdBean> getAdByCateNoAjax(String CateNo,String set);
	
	public List<AdBean> getAdByDateAjax(Date adDate,String set);
	
	public List<AdBean> getAdByWordAjax(String searchword,String set);
	
	//訂單ajax
	public List<AdOrderBean> getOrderByAjax(String buyerMemberId, String adOrderNo, String orderDate);
}
