package iiiNews.NP.dao;


import java.util.List;

import iiiNews.NP.model.NewsBean;

public interface NewsProductDao {
	public int uploadNewsForm(NewsBean nb); 
	
	public List<NewsBean> getAllNews();
	
}
