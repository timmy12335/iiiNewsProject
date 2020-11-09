package CR.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import CR.dao.CR_Dao;
import CR.model.CRBean;
import CR.service.CR_service;
import iiiNews.MB.model.MBBean;

@Service
@Transactional
public class CR_service_impl implements CR_service {
	
	@Autowired
	CR_Dao dao;
	
	@Override
	public List<CRBean> getRecord() {
		return dao.getRecord();
	}

	@Override
	public MBBean getMemberById(int memberId) {
		
		return dao.getMemberById(memberId);
	}

	@Override
	public void addReport(CRBean report) {
		
		
		dao.addReport(report);
		
	}

	@Override
	public void deleteReprotByPk(Integer pk) {
		dao.deleteReportByPk(pk);
		
	}

	@Override
	public CRBean getReportById(int pk) {
		
		return dao.getReportById(pk);
	}

	@Override
	public void updateReport(CRBean cb) {
		dao.updateReport(cb);
		
	}

	@Override
	public void evictReport(CRBean cb) {
		dao.evictReport(cb);
		
	}



}
