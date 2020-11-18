package iiiNews.NP.dao;

import java.util.List;

import iiiNews.NP.model.NewsBean;

public interface NewsBackHaulDao {
	//類別查詢For報表	
	public Integer getNewByTypeForBB(String Type);
}
