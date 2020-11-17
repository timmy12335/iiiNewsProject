package iiiNews.MB.service;

import java.util.List;

import iiiNews.MB.model.CpMemberBean;
import iiiNews.MB.model.MBBean;

public interface CPMBService {

	public int saveCpMemberService(CpMemberBean MB);

	public CpMemberBean getLastRecord();

	public List<CpMemberBean> getAllCpMember();

	public CpMemberBean getSingleCpMember(String cpmemberId);

	public List<CpMemberBean> getCpMember(String cpname);

	void addCpMember(CpMemberBean cpmember);
	
	public CpMemberBean cplogin(String account, String password);

	public boolean idcpExists(String id);
}
