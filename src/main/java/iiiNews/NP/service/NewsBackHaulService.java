package iiiNews.NP.service;

import java.util.List;
import java.util.Map;

import iiiNews.NP.model.NewsOrderBean;

public interface NewsBackHaulService {
	//將類別筆數塞進map
	public Map<String,Long> getNewByTypeForBB();
	
	//將類別金額放進map
	public Integer getNewsCountForBB(String Type);

	//後臺下架新聞
	public void delSingleNewsForBB(String newsId);
	
	//後臺查詢所有訂單
	public List<NewsOrderBean> getOrderForBB();
}
