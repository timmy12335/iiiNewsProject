package CR.dao;

import java.util.List;

import CR.model.CRBean;
import franktest.model.MemberBean;

public interface CR_Dao {
	
	public List<CRBean> getRecord();

	public MemberBean getMemberById(int memberId);

	void addReport(CRBean report);
	
	CRBean getReportById(int pk);
	
	void deleteReportByPk(int pk);
	
	void updateReport(CRBean cb);
}
