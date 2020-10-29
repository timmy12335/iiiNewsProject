package iiiNews.MT.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iiiNews.MT.dao.MtAddDao;
import iiiNews.MT.model.MtAddBean;
import iiiNews.MT.service.MtAddService;

@Service
public class MtAddServiceImpl implements MtAddService{

	@Autowired
	MtAddDao dao;
	
	public MtAddServiceImpl() {
	}
	
	@Override
	@Transactional
	public int saveMtAddService(MtAddBean mtAddBean) {
		int n = 0;
		dao.saveMtAddDao(mtAddBean);
		n++;
		return n;
	}

	@Override
	@Transactional
	public List<MtAddBean> getAllMtService() {
		return dao.getAllAddDao();
	}

	@Override
	@Transactional
	public MtAddBean getLastRecord() {
		return dao.getLastRecord();
	}

//	@Override		//抓pkey
//	@Transactional
//	public List<String> getAllAddDao1() {
//		return dao.getAllAddDao1();
//	}

}
