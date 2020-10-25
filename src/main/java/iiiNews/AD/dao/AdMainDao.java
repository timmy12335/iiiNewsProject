package iiiNews.AD.dao;

import java.util.List;

import iiiNews.AD.model.AdBean;

public interface AdMainDao {

	public int saveAds(AdBean ab);
	public List<AdBean> getAllAds();

}