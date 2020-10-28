package iiiNews.NP.service.impl;

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
	public List<NewsBean> getAllNews() {		
		return newsProductDao.getAllNews();
	}

}
