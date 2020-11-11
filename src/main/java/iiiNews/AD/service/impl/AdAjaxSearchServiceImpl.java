package iiiNews.AD.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iiiNews.AD.dao.AdAjaxSearchDao;
import iiiNews.AD.dao.AdMainDao;
import iiiNews.AD.model.AdBean;
import iiiNews.AD.service.AdAjaxSearchService;

@Service
public class AdAjaxSearchServiceImpl implements AdAjaxSearchService {
	
	@Autowired
	AdAjaxSearchDao ajaxdao;
	
	public AdAjaxSearchServiceImpl() {
	}
	
	@Override
	@Transactional
	public List<AdBean> getAllAdByAjax(String set) {
		return ajaxdao.getAllAdByAjax(set);
	}
	
	@Override
	@Transactional
	public List<AdBean> getAdByCateNoAjax(String CateNo,String set) {
		return ajaxdao.getAdByCateNoAjax(CateNo,set);
	}
	
	@Override
	@Transactional
	public List<AdBean> getAdByDateAjax(Date adDate,String set) {
		return ajaxdao.getAdByDateAjax(adDate,set);
	}

	@Override
	@Transactional
	public List<AdBean> getAdByWordAjax(String searchword,String set) {
		return ajaxdao.getAdByWordAjax(searchword,set);
	}

}
