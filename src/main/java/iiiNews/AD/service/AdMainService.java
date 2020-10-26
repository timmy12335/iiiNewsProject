package iiiNews.AD.service;

import java.util.List;

import iiiNews.AD.model.AdBean;

public interface AdMainService {
	
	public int saveAds(AdBean ab);
	
	public List<AdBean> getAllAds();
	
	public AdBean getLastRecord() ;
}
