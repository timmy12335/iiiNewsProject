package CR.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import CR.dao.CR_boardDao;
import CR.model.CRBoardBean;
import CR.service.CR_boardService;


@Service
@Transactional
public class CR_boardService_impl implements CR_boardService {

	@Autowired
	CR_boardDao dao;
	
	@Override
	public void addBorad(CRBoardBean crbbean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CRBoardBean> getboard() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteBoardById(int boardpk) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBoard(CRBoardBean crbbean) {
		// TODO Auto-generated method stub
		
	}
	
	
	

}
