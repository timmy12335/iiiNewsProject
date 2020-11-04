package iiiNews.NP.service.impl;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
	public int getTotalPages() {
		return newsProductDao.getTotalPages();
	}

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
	@Override
	public List<NewsBean> getPageNews(Integer pageNo) {
		
		return newsProductDao.getPageNews(pageNo);
	}
   //算出使用者輸入的限時時間，加上目前時間，塞進futureTime欄位
	@Override
	public Timestamp getfutureTime(Time ti) {	
		SimpleDateFormat stf = new SimpleDateFormat("HH:mm:ss");
		String sti = stf.format(ti);
		String[] stiarr = sti.split(":");
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		java.util.Date d = null; 
		Date date = new Date();
		String strDate = sdFormat.format(date);

		
		String[] dateAndTime=strDate.split(" ");
		String[] TimeStr=dateAndTime[1].split(":");
		
		int h = Integer.valueOf(stiarr[0]) + Integer.valueOf(TimeStr[0]);
		int m = Integer.valueOf(stiarr[1]) + Integer.valueOf(TimeStr[1]);
		int s = Integer.valueOf(stiarr[2]) + Integer.valueOf(TimeStr[2]);
		String countime =dateAndTime[0]+" "+ h +":" + m + ":" + s;

		try {
			d = sdFormat.parse(countime);
		} catch (ParseException e1) {			
			e1.printStackTrace();
		} 
		java.sql.Timestamp countimesql = new java.sql.Timestamp(d.getTime());
		
		return countimesql;
	}

	@Override
	public List<NewsBean> checkTime() {		
		return newsProductDao.checkTime();
	}

	
}
