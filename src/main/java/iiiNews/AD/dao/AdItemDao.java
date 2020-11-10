package iiiNews.AD.dao;

import java.util.List;

import iiiNews.AD.model.AdOrderItemBean;

public interface AdItemDao {
	
	
	public List<AdOrderItemBean> getItemsInOneOrder(int adOrderPk);
	
	public AdOrderItemBean getOneItems(int itemPk);
	
	public int updateItemPicture(AdOrderItemBean aoib);
	
	public List<AdOrderItemBean> getCpMemberSoldList(String memberId);
}
