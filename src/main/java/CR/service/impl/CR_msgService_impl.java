package CR.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import CR.dao.CR_msgDao;
import CR.model.CrMsgBean;
import CR.service.CR_msgService;
import iiiNews.MB.model.MBBean;

@Service
@Transactional
public class CR_msgService_impl implements CR_msgService{

	@Autowired
	CR_msgDao dao;
	
	@Override
	public void addMsg(CrMsgBean msg) {
		dao.addMsg(msg);
		
	}

	
	@Override
	public MBBean getMemberById(int memberId) {
		
		return dao.getMemberById(memberId);
	}
}
