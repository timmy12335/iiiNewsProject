package iiiNews.NP.service;


import java.util.List;

import iiiNews.NP.model.NewsBean;

public interface NewsProductService {
	public int uploadNewsForm(NewsBean nb); 
	public String getLastRecord();
	public List<NewsBean> getAllNews();
}
