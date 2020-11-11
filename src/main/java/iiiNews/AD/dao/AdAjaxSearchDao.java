package iiiNews.AD.dao;

import java.sql.Date;
import java.util.List;

import iiiNews.AD.model.AdBean;

public interface AdAjaxSearchDao {
	
	public List<AdBean> getAllAdByAjax(String set);
	
	public List<AdBean> getAdByCateNoAjax(String CateNo,String set);
	
	public List<AdBean> getAdByDateAjax(Date adDate,String set);
	
	public List<AdBean> getAdByWordAjax(String searchword,String set);
}
