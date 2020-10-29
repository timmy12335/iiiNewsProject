package iiiNews.NP.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import iiiNews.NP.dao.NewsProductDao;
import iiiNews.NP.model.NewsBean;
import iiiNews.NP.service.NewsProductService;
@Service
@Transactional
public class NewsProductServiceImpl implements NewsProductService {
	
	@Autowired
	NewsProductDao newsProductDao;

	@Override
	public int uploadNewsForm(NewsBean nb) {
		int n = 0;
		newsProductDao.uploadNewsForm(nb);
		n++;
		return n;
	}
    @Override
	public String getLastRecord() {
		NewsBean lastRecord = newsProductDao.getLastRecord();
		String noStr = null;
		java.util.Date dnow = new java.util.Date();
		String lastRecordNo = null;
		String lastRecordNoDate = null;
		SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMdd");
		if(lastRecord == null) {
			noStr = "NP"+ft.format(dnow)+"00001";
		}else {
			lastRecordNo = lastRecord.getNewsId();
			lastRecordNoDate = lastRecordNo.substring(2,10);
			
			noStr = "NP"+ft.format(dnow);
			
			//用字串的方式進行比較
			if(ft.format(dnow).equals(lastRecordNoDate)) {
				noStr += String.format("%05d",(Integer.parseInt(lastRecordNo.substring(10))+1));
			}else {
				noStr = "NP"+ft.format(dnow)+"00001";
			}
			System.out.println(noStr);
		}
		return noStr;
	}



	@Override
	public List<NewsBean> getAllNews() {		
		return newsProductDao.getAllNews();
	}
	@Override
	public NewsBean getSingleNews(String newsId) {		
		return newsProductDao.getSingleNews(newsId);
	}
	@Override
	public List<NewsBean> getMemNews(String memberId) {		
		return newsProductDao.getMemNews(memberId);
	}
	@Override
	public void delSingleNews(String newsId) {
		NewsBean newsbean = newsProductDao.getSingleNews(newsId);
		if(newsbean.getStatus() != null && newsbean.getStatus() > 0 ) {
			newsProductDao.updateStatus(newsId, newsbean.getStatus() - 1);
		}
		
	}

	
}
