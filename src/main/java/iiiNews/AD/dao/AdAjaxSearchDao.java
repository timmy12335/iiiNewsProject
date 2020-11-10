package iiiNews.AD.dao;

import java.sql.Date;
import java.util.List;

import iiiNews.AD.model.AdBean;

public interface AdAjaxSearchDao {
	
	public List<AdBean> getAllAdByAjax();
	public List<AdBean> getAdByCateNoAjax(String CateNo);
	
	public List<AdBean> getAdByDateAjax(Date adDate);
	
	public List<AdBean> getAdByWordAjax(String searchword);
}
