package iiiNews.NP.dao;

import java.util.List;

import iiiNews.NP.model.NewsBean;

public interface NewsSearchDao {
	//關鍵字查詢
	public List<NewsBean> getNewsByWords(String searchWords);
	
	//類型查詢
	public List<NewsBean> getNewsByType(String Type);
		
}
