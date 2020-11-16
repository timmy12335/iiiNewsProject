package iiiNews.MB.service;

import java.util.List;

import iiiNews.MB.model.MBBean;

public interface MBService {

	public int saveMBService(MBBean MB);
	public MBBean getLastRecord();
	public List<MBBean> getAllMember();
	public MBBean getSingleMember(String memberId);
	public List<MBBean> getMember(String name);	
	void  addMember(MBBean member);
	public MBBean login(String account, String password);
	public boolean idExists(String id);
	public void updatePassword(String email);
	public List<String> seachMemberaccount();
}
