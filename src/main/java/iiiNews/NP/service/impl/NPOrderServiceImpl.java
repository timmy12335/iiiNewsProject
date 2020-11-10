package iiiNews.NP.service.impl;

import java.text.SimpleDateFormat;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import iiiNews.NP.dao.NewsOrderDao;
import iiiNews.NP.dao.NewsProductDao;
import iiiNews.NP.model.NewsBean;
import iiiNews.NP.model.NewsOrderBean;
import iiiNews.NP.service.NPOrderService;
@Service
@Transactional
public class NPOrderServiceImpl implements NPOrderService {
	
	@Autowired
	NewsOrderDao newsOrderDao;
	@Autowired
	NewsProductDao newsProductDao;
	//取得訂單的流水號
	@Override
	public String getOrderRecord() {
		NewsOrderBean lastRecord = newsOrderDao.getOrderRecord();
		String noStr = null;
		java.util.Date dnow = new java.util.Date();
		String lastRecordNo = null;
		String lastRecordNoDate = null;
		SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMdd");if(lastRecord == null) {
			noStr = "NPorder"+ft.format(dnow)+"00001";
		}else {
			lastRecordNo = lastRecord.getNewsId();
			lastRecordNoDate = lastRecordNo.substring(7,15);
			
			noStr = "NPorder"+ft.format(dnow);
			
			//用字串的方式進行比較
			if(ft.format(dnow).equals(lastRecordNoDate)) {
				noStr += String.format("%05d",(Integer.parseInt(lastRecordNo.substring(15))+1));
			}else {
				noStr = "NPorder"+ft.format(dnow)+"00001";
			}
			System.out.println(noStr);
		}
		return noStr;
	}
	//新增訂單紀錄
	@Override
	public int uploadNewsOrder(NewsOrderBean nOrderBean) {
		int n = 0;
		newsOrderDao.uploadNewsOrder(nOrderBean);
		return n;
	}
	@Override
	public void updateStatusZero(String newsId) {
		NewsBean newsbean = newsProductDao.getSingleNews(newsId);
		if(newsbean.getStatus() != null && newsbean.getStatus() > 0 ) {
			newsProductDao.updateStatus(newsId, newsbean.getStatus() - 2);
		}
		
	}

}
