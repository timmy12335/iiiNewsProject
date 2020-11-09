package iiiNews.NP.dao;


import java.util.List;

import iiiNews.NP.model.NewsBean;

public interface NewsProductDao {
	//使用AJAX顯示新聞頁面
	public int getTotalPages();
	List<NewsBean> getPageNews(Integer pageNo);
	//新增一則新聞
	public int uploadNewsForm(NewsBean nb); 
	//抓最後一筆資料
	public NewsBean getLastRecord();
	//查詢所有上架的新聞
	public List<NewsBean> getAllNews();
	//確認時間是否超過今天 若超過將status改為0
	public List<NewsBean> checkTime();
	//抓已上架的單一筆新聞
	public NewsBean getSingleNews(String newsId);
	//未上架的單一新聞
	public NewsBean getSingleNewsForUpdate(String newsId);	
	//查詢單一會員已上架的新聞列表
	public List<NewsBean> getMemNews(String memberId);
	//查詢單一會員未上架的新聞列表
	public List<NewsBean> getUpMemNews(String memberId);
	//刪除單一新聞紀錄
	void updateStatus(String newsId, Integer status);
	
	
	
}
