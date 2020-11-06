package iiiNews.NP.dao;

import iiiNews.NP.model.NewsBean;





public interface NewsUpdateDao {
	//將限時時間塞進資料庫
	public void updatelimitTime(String limitTime,String newsId);
	
	//更新單則新聞
	void updateNewsProduct(NewsBean newsBean);
}
