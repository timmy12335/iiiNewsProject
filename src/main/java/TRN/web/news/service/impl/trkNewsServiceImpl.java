package TRN.web.news.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import TRN.web.news.dao.trkNewsDao;
import TRN.web.news.model.trkNewsBean;
import TRN.web.news.service.trkNewsService;

@Service
public class trkNewsServiceImpl implements trkNewsService {
	trkNewsDao dao;
	
	@Autowired
    public void setDao(trkNewsDao dao) {
		this.dao = dao;
	}
	
	@Transactional
	@Override
	public List<trkNewsBean> getAllProducts() {
		return dao.getAllProducts();
	}

}
