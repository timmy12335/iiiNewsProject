package iiiNews.NP.dao;


import java.util.List;

import iiiNews.NP.model.NewsOrderBean;

public interface NewsOrderDao {
	//取得訂單的流水號
	public NewsOrderBean getOrderRecord();
	//新增訂單紀錄
	public int uploadNewsOrder(NewsOrderBean nOrderBean);
	//列出企業購買紀錄
	public List<NewsOrderBean> getOrderListByAjax(String companyId);
	//列出會員被購買紀錄
	public List<NewsOrderBean> getOrderMemListByAjax(String memberId);

}
