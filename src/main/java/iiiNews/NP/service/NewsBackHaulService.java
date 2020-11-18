package iiiNews.NP.service;

import java.util.List;

import iiiNews.NP.model.NewsBean;

public interface NewsBackHaulService {
	//類別查詢For報表	
	public List<NewsBean> getNewByTypeForBB(String Type);

}
