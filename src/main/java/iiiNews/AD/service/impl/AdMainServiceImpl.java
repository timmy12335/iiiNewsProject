package iiiNews.AD.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iiiNews.AD.dao.AdMainDao;
import iiiNews.AD.model.AdBean;
import iiiNews.AD.service.AdMainService;

@Service
public class AdMainServiceImpl implements AdMainService {
	
	@Autowired
	AdMainDao dao;
	
	
	public AdMainServiceImpl() {
	}

	@Override
	@Transactional
	public int saveAds(AdBean ab) {
		int n = 0;
		dao.saveAds(ab);
		n++;
		return n;
	}

	@Override
	@Transactional
	public List<AdBean> getAllAds() {
		return dao.getAllAds();
	}

	@Override
	@Transactional
	public AdBean getLastRecord() {
		return dao.getLastRecord();
	}

}
