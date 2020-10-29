package iiiNews.NP.dao;


import java.util.List;

import iiiNews.NP.model.NewsBean;

public interface NewsProductDao {
	//新增一則新聞
	public int uploadNewsForm(NewsBean nb); 
	//抓最後一筆資料
	public NewsBean getLastRecord();
	//查詢所有的新聞
	public List<NewsBean> getAllNews();
	
	
	
}
