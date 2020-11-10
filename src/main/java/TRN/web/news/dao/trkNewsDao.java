package TRN.web.news.dao;

import java.util.List;


import TRN.web.news.model.rptNewsBean;
import TRN.web.news.model.trkNewsBean;

public interface trkNewsDao {

	List<trkNewsBean> getAllProducts(); // 查詢所有資料

	void updateNews(int NewsId, int newQuantity); // 點按鈕直接更新數量

	List<String> getAlltypes(); // 分類查詢 show有哪些分類

	List<trkNewsBean> getNewsBytypes(String type); // 分類查詢 show 單個分類所有新聞

	public trkNewsBean getNewsById(int NewsId); // 查詢單筆產品資料

	void addtrkNews(trkNewsBean trkNew);   //新增追蹤新聞

	rptNewsBean getReportById(int reportId); // 取得報導資料

	List<rptNewsBean> getReportList();    // 取得報導列表
	
	void deletetrkNewsByPK(Integer trackId); //依pk值刪除追蹤新聞
	
    void updatetrkNews(trkNewsBean trkNew);  //修改追蹤新聞
	
	void evicttrkNews(trkNewsBean trkNew);  //驅逐未修改的屬性
	
	trkNewsBean findByPrimaryKey(Integer NewsId); //為修改資料先找主鍵
	
}
