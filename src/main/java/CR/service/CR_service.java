package CR.service;

import java.util.List;

import CR.model.CRBean;
import franktest.model.MemberBean;

public interface CR_service {
	public List<CRBean> getRecord();
	
	public MemberBean getMemberById(int memberId);

	void addReport(CRBean report);
}
