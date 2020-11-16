package CR.dao;

import java.util.List;

import CR.model.CRBoardBean;

public interface CR_boardDao {

	
	
	void addBorad(CRBoardBean crbbean);
	
	public List<CRBoardBean> getboard();
	
	void deleteBoardById(int boardpk);
	
	void updateBoard(CRBoardBean crbbean);
	
}
