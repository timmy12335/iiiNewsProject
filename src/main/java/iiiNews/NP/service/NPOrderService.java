package iiiNews.NP.service;

import iiiNews.NP.model.NewsOrderBean;

public interface NPOrderService {
	//取得訂單的流水號
	public String getOrderRecord();
	//新增訂單紀錄
	public int uploadNewsOrder(NewsOrderBean nOrderBean);
	//修改status為0
	public void updateStatusZero(String newsId);

}
