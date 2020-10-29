package iiiNews.AD.service;

import java.util.List;

import iiiNews.AD.model.AdBean;

public interface AdMainService {
	
	public int saveAds(AdBean ab);
	
	public List<AdBean> getAllAds();
	
	public AdBean getLastRecord() ;
	
	//^^^^注意此處memberId是String還是int 未來會用到!!!
	public List<AdBean> getMemberAdList(String memberId);
	
	public int deleteAdByMemberPkid(int pkId);
	
	public AdBean getOneAdByadPk(int adPk);
}
