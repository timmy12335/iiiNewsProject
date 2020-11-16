package iiiNews.NP.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import iiiNews.NP.dao.NewsSearchDao;
import iiiNews.NP.model.NewsBean;
import iiiNews.NP.service.NewsSearchService;
@Service
@Transactional
public class NewsSearchServiceImpl implements NewsSearchService {
	@Autowired
	NewsSearchDao newsSearchDao;

	@Override
	public List<NewsBean> getNewsByWords(String searchWords) {		
		return newsSearchDao.getNewsByWords(searchWords);
	}

	@Override
	public List<NewsBean> getNewsByType(String Type) {		
		return newsSearchDao.getNewsByType(Type);
	}

}
