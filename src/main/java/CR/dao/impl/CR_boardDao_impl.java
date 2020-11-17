package CR.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import CR.dao.CR_boardDao;
import CR.model.CRBoardBean;


@Repository
public class CR_boardDao_impl implements CR_boardDao{

	@Autowired
	SessionFactory factory;
	
	@Override
	public void addBorad(CRBoardBean crbbean) {
		Session session=factory.getCurrentSession();
		
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
