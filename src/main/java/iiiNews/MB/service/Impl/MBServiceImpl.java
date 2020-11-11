package iiiNews.MB.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//import com.web.store.dao.ProductDao;

import iiiNews.MB.dao.MBDao;
import iiiNews.MB.model.MBBean;
import iiiNews.MB.service.MBService;

//import com.web.store.model.BookBean;

@Service
public class MBServiceImpl implements MBService {

	@Autowired
	MBDao mbdao;

	@Transactional
	@Override
	public void addMember(MBBean member) {
		mbdao.addMember(member);

	}

	@Override
	public int saveMBService(MBBean MB) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MBBean getLastRecord() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MBBean> getAllMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MBBean getSingleMember(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MBBean> getMember(String name) {
		// TODO Auto-generated method stub
		return null;
	}
	@Transactional
	@Override
	public MBBean login(String account, String password) {
		System.out.println("service");
		return mbdao.login(account, password);
	}
}
