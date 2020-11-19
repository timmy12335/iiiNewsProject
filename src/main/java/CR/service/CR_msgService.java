package CR.service;

import CR.model.CrMsgBean;
import iiiNews.MB.model.MBBean;

public interface CR_msgService {
	
	void addMsg(CrMsgBean msg);

	MBBean getMemberById(int memberId);
	
	void updateMsg(CrMsgBean msg);
	
	void deleteMsg(int pk);

	void addMsg(String message);
}
