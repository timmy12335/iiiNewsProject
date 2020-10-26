package iiiNews.AD.dao;

import java.util.List;

import iiiNews.AD.model.AdOrderBean;

public interface AdOrderDao {
	
	//^^^^ 注意此處memberId是String還是int 未來會用到!!!
	public List<AdOrderBean> getMemberOrderList(String memberId);
}
