package iiiNews.NP.service;


import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;

import iiiNews.NP.model.NewsBean;

public interface NewsProductService {
	//使用AJAX顯示新聞頁面
	public int getTotalPages();
	public List<NewsBean> getPageNews(Integer pageNo);
	//新增一則新聞
	public int uploadNewsForm(NewsBean nb); 
	//抓最後一筆資料(為了取新聞的流水號)
	public String getLastRecord();
	//查詢所有上架的新聞
	public List<NewsBean> getAllNews();
	//抓已上架單一筆新聞
	public NewsBean getSingleNews(String newsId);
	//未上架的單一新聞
	public NewsBean getSingleNewsForUpdate(String newsId);
	//查詢單一會員已上架的新聞列表
	public List<NewsBean> getMemNews(String memberId);
	//查詢單一會員未上架的新聞列表
	public List<NewsBean> getUpMemNews(String memberId);	
	//刪除單一新聞紀錄
	void delSingleNews(String newsId);
	//算出使用者輸入的限時時間，加上目前時間，塞進futureTime欄位
	public Timestamp getfutureTime(Time limitTime);
	//確認時間是否超過今天,時間到下架
	public List<NewsBean> checkTime();
	
}
