package iiiNews.AD.dao;

import java.util.List;

import iiiNews.AD.model.AdOrderItemBean;

public interface AdEndDao {
	
	public List<AdOrderItemBean> eachCateFunction(String categoryNo,String cpmemberId);
	
	public List<AdOrderItemBean> allOrderFunction();
}
