package iiiNews.NP.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import iiiNews.NP.dao.NewsBackHaulDao;
import iiiNews.NP.model.NewsBean;
@Service
@Transactional
public class NewsBackHaulServiceImpl implements NewsBackHaulService {
	@Autowired
	NewsBackHaulDao newsBackHaulDao;

	@Override
	public List<NewsBean> getNewByTypeForBB(String Type) {
		return newsBackHaulDao.getNewByTypeForBB(Type);
	}

}
