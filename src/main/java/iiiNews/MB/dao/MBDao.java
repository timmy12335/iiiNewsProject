package iiiNews.MB.dao;

import java.util.List;
import iiiNews.MB.model.MBBean;

public interface MBDao {

	public int passwordForm(MBBean mb);

	public int saveMember(MBBean mb);

	public List<MBBean> getAllMember();

	public MBBean getSingleMmeber(String memberId);

	public List<MBBean> getMember(String name);

	void addMember(MBBean member);

	MBBean saveMember();
}