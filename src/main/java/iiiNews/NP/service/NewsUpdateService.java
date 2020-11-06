package iiiNews.NP.service;

import java.sql.Time;

import iiiNews.NP.model.NewsBean;


public interface NewsUpdateService {
	public void updatelimitTime(String limitTime,String newsId);
	
	//更新單則新聞
		void updateNewsProduct(NewsBean newsBean);
}
