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
	
	//使用AJAX顯示新聞頁面
	@Override
	public int getTotalPages() {
		return newsProductDao.getTotalPages();
	}
	@Override
	public List<NewsBean> getPageNews(Integer pageNo) {
		
		return newsProductDao.getPageNews(pageNo);
	}
	
	//新增一則新聞
	@Override
	public int uploadNewsForm(NewsBean nb) {
		int n = 0;
		newsProductDao.uploadNewsForm(nb);
		n++;
		return n;
	}
	
	//抓最後一筆資料(為了取新聞的流水號)
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
    //查詢所有上架的新聞
	@Override
	public List<NewsBean> getAllNews() {
		
		return newsProductDao.getAllNews();
	}
	//抓單一筆新聞
	@Override
	public NewsBean getSingleNews(String newsId) {		
		return newsProductDao.getSingleNews(newsId);
	}
	//未上架的單一新聞
	@Override
	public NewsBean getSingleNewsForUpdate(String newsId) {
		return newsProductDao.getSingleNewsForUpdate(newsId);
	}
	//查詢單一會員已上架的新聞列表
	@Override
	public List<NewsBean> getMemNews(String memberId) {		
		return newsProductDao.getMemNews(memberId);
	}
	//查詢單一會員未上架的新聞列表
	@Override
	public List<NewsBean> getUpMemNews(String memberId) {		
		return newsProductDao.getUpMemNews(memberId);
	}
	//刪除單一新聞紀錄
	@Override
	public void delSingleNews(String newsId) {
		NewsBean newsbean = newsProductDao.getSingleNewsForUpdate(newsId);
		if(newsbean.getStatus() != null && newsbean.getStatus() > 0 ) {
			newsProductDao.updateStatus(newsId, newsbean.getStatus() - 2);
		}		
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
	//確認時間是否超過今天,時間到下架
	@Override
	public List<NewsBean> checkTime() {		
		return newsProductDao.checkTime();
	}
	

	
}
