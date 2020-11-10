package iiiNews.NP.dao;


import iiiNews.NP.model.NewsOrderBean;

public interface NewsOrderDao {
	//取得訂單的流水號
	public NewsOrderBean getOrderRecord();
	//新增訂單紀錄
	public int uploadNewsOrder(NewsOrderBean nOrderBean);
	

}
