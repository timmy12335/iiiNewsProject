package iiiNews.NP.dao;

import java.util.List;

import iiiNews.NP.model.NewsBean;
import iiiNews.NP.model.NewsOrderBean;

public interface NewsBackHaulDao {
	//類別查詢For報表	
	public Long getNewByTypeForBB(String Type,Integer status);
	
	//類別金額查詢For報表
	public List<Integer> getNewsCountForBB(String Type,Integer status);
	
	//後臺查詢所有訂單
	public List<NewsOrderBean> getOrderForBB();
	
	
}
