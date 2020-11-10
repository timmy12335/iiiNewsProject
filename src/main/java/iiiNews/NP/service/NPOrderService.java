package iiiNews.NP.service;

import java.util.List;

import iiiNews.NP.model.NewsOrderBean;

public interface NPOrderService {
	//取得訂單的流水號
	public String getOrderRecord();
	//新增訂單紀錄
	public int uploadNewsOrder(NewsOrderBean nOrderBean);
	//修改status為0
	public void updateStatusZero(String newsId);
	//列出企業購買紀錄
	public List<NewsOrderBean> getOrderListByAjax(String companyId);
	//列出會員被購買紀錄
	public List<NewsOrderBean> getOrderMemListByAjax(String memberId);


}
