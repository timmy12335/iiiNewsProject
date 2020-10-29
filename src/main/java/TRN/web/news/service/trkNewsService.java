package TRN.web.news.service;

import java.util.List;

import TRN.web.news.model.trkNewsBean;

public interface trkNewsService {
	
	List<trkNewsBean> getAllProducts(); // 查詢所有資料

	void updateNews(); // 點按鈕直接更新數量

	List<String> getAlltypes();  //分類查詢 show有哪些分類

	List<trkNewsBean> getNewsBytypes(String type); //分類查詢 show 單個分類所有新聞 

	public trkNewsBean getNewsById(int NewsId); // 查詢單筆產品資料
}


