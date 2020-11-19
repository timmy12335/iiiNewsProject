package iiiNews.AD.service;

import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import iiiNews.AD.model.AdBean;

public interface AdMainService {
	
	public int saveAds(AdBean ab);
	
	public String createAdNo();
	
	public List<AdBean> getAllAds();
	
	public AdBean getLastRecord() ;
	
	public List<AdBean> getCpMemberAdList(String cpmemberId);
	
	public int deleteAdByMemberPkid(int pkId);
	
	public int offShelfAdByMemberPkid(int pkId);
	
	public AdBean getOneAdByadPk(int adPk);
	
	public void changeStatus();
	
	public int updateAds(AdBean ab);
	
	//ajax
	public List<AdBean> getPageAds(Integer pageNo);
	public int getTotalPageCount();
	
	
}
