package CR.service;

import java.util.List;

import CR.model.CRBoardBean;

public interface CR_boardService {

	
	
	void addBorad(CRBoardBean crbbean);
	
	public List<CRBoardBean> getboard();
	
	void deleteBoardById(int boardpk);
	
	void updateBoard(CRBoardBean crbbean);
}
