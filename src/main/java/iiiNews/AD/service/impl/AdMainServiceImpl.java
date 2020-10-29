package iiiNews.AD.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iiiNews.AD.dao.AdMainDao;
import iiiNews.AD.model.AdBean;
import iiiNews.AD.service.AdMainService;

@Service
public class AdMainServiceImpl implements AdMainService {
	
	@Autowired
	AdMainDao adMaindao;
	
	
	public AdMainServiceImpl() {
	}

	@Override
	@Transactional
	public int saveAds(AdBean ab) {
		int n = 0;
		adMaindao.saveAds(ab);
		n++;
		return n;
	}

	@Override
	@Transactional
	public List<AdBean> getAllAds() {
		return adMaindao.getAllAds();
	}

	@Override
	@Transactional
	public AdBean getLastRecord() {
		return adMaindao.getLastRecord();
	}
	
	
	//^^^^注意此處memberId是String還是int 未來會用到!!!
	@Override
	@Transactional
	public List<AdBean> getMemberAdList(String memberId) {
		return adMaindao.getMemberAdList(memberId);
	}

	@Override
	@Transactional
	public int deleteAdByMemberPkid(int pkId) {
		int n = 0;
		adMaindao.deleteAdByMemberPkid(pkId);
		n++;
		return n;
	}

	@Override
	@Transactional
	public AdBean getOneAdByadPk(int adPk) {
		return adMaindao.getOneAdByadPk(adPk);
	}

}
