package iiiNews.MB.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iiiNews.MB.dao.CPMBDao;
import iiiNews.MB.model.CpMemberBean;
import iiiNews.MB.service.CPMBService;

//import com.web.store.model.BookBean;

@Service
public class CPMBServiceImpl implements CPMBService {

	@Autowired
	CPMBDao cpmbdao;

	@Transactional
	@Override
	public void addCpMember(CpMemberBean cpmember) {
		cpmbdao.addCpMember(cpmember);

	}

	@Override
	public int saveCpMemberService(CpMemberBean MB) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CpMemberBean getLastRecord() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CpMemberBean> getAllCpMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CpMemberBean getSingleCpMember(String cpmemberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CpMemberBean> getCpMember(String cpname) {
		// TODO Auto-generated method stub
		return null;
	}
	@Transactional
	@Override
	public CpMemberBean cplogin(String account, String password) {
		System.out.println("service");
		return cpmbdao.cplogin(account, password);
	}
}
