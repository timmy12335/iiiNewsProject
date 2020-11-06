package iiiNews.NP.service.impl;

import java.sql.Time;
import java.sql.Timestamp;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import iiiNews.NP.dao.NewsUpdateDao;
import iiiNews.NP.model.NewsBean;
import iiiNews.NP.service.NewsUpdateService;
@Service
@Transactional
public class NewsUpdateServiceImpl implements NewsUpdateService {
	
	@Autowired
	NewsUpdateDao newsUpdatedao;

	@Override
	public void updatelimitTime(String limitTime, String newsId) {
		newsUpdatedao.updatelimitTime(limitTime, newsId);

	}

	@Override
	public void updateNewsProduct(NewsBean newsBean) {
		newsUpdatedao.updateNewsProduct(newsBean);
		
	}

}
