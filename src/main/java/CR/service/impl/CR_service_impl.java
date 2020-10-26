package CR.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import CR.dao.CR_Dao;
import CR.model.CRBean;
import CR.service.CR_service;
import franktest.model.MemberBean;

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
	public MemberBean getMemberById(int memberId) {
		
		return dao.getMemberById(memberId);
	}

	@Override
	public void addReport(CRBean report) {
		dao.addReport(report);
		
	}

}