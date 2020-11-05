package iiiNews.AD.dao;

import java.util.List;

import iiiNews.AD.model.AdBean;
import iiiNews.AD.model.AdOrderBean;
import iiiNews.NP.model.NewsBean;

public interface AdMainDao {

	public int saveAds(AdBean ab);
	public List<AdBean> getAllAds();
	
	public AdBean getLastRecord() ;
	
	public int updateAds(String adNo, AdBean ab);
	
	//^^^^注意此處memberId是String還是int 未來會用到!!!
	public List<AdBean> getMemberAdList(String cpmemberId); 
	
	public int deleteAdByMemberPkid(int pkId);
	
	public AdBean getOneAdByadPk(int adPk);
	
	//ajax
	public List<AdBean> getPageAds(Integer pageNo);
	public int getTotalPageCount();
}