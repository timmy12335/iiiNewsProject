package franktest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import franktest.dao.MemberDao;
import franktest.model.MemberBean;

@Service
public class MemberService {
	@Autowired
	MemberDao dao;
	
	@Transactional
	public int saveMember(MemberBean mb) {
		int n =0;
		dao.saveMember(mb);
		n++;
		return n;
	}
}
