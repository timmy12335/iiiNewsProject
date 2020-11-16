package CR.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import CR.dao.CR_boardDao;
import CR.model.CRBoardBean;
import CR.service.CR_boardService;


@Repository
public class CR_boardDao_impl implements CR_boardDao{

	@Autowired
	CR_boardService service;
	
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
