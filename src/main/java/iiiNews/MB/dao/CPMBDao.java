package iiiNews.MB.dao;

import java.util.List;

import iiiNews.MB.model.CpMemberBean;
import iiiNews.MB.model.MBBean;

public interface CPMBDao {

	public int cppasswordForm(CpMemberBean cpmb);

	public int saveCpMember(CpMemberBean cpmb);

	public List<CpMemberBean> getAllCpMember();

	public CpMemberBean getSingleCpMmeber(String cpmemberId);

	public List<CpMemberBean> getCpMember(String cpname);

	void addCpMember(CpMemberBean cpmember);

	CpMemberBean saveCpMember();
	
	public CpMemberBean cplogin(String account, String password);

	public boolean idcpExists(String id);
}