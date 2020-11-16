package CR.service;

import java.util.List;

import CR.model.CRBean;
import CR.model.CRemployee;
import iiiNews.MB.model.CpMemberBean;
import iiiNews.MB.model.MBBean;

public interface CR_service {
	public List<CRBean> getRecord();
	

	void addReport(CRBean report);
	
	void deleteReprotByPk(Integer pk);
	public CRBean getReportById(int pk);
	void updateReport(CRBean cb);
	void evictReport(CRBean cb);

	public MBBean getMemberById(int memberId);
	public MBBean getMembersByMemberId(String memberId);


	public List<CRBean> getReportBymemberId(String memberId);
	
	public CRemployee getemployeeBytreatamt();
	
	CpMemberBean getCpMembersByMemberId(String memberId);
	
	List<CRBean> getReportBycpmemberId(String memberId);
}
