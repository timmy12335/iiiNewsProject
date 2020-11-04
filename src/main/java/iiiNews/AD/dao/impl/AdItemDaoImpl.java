package iiiNews.AD.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.AD.dao.AdItemDao;
import iiiNews.AD.model.AdOrderItemBean;

@Repository
public class AdItemDaoImpl implements AdItemDao {
	
	@Autowired
	SessionFactory factory;
	
	public AdItemDaoImpl() {
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<AdOrderItemBean> getItemsInOneOrder(int adOrderPk) {
		String hql = "FROM AdOrderItemBean WHERE FK_AdOrderBean_orderNo = :orderNo";
		Session session = factory.getCurrentSession();
		List<AdOrderItemBean> list = session.createQuery(hql).setParameter("orderNo", adOrderPk).getResultList();
		return list;
	}


	@Override
	public AdOrderItemBean getOneItems(int itemPk) {
		Session session = factory.getCurrentSession();
		AdOrderItemBean aoib = session.get(AdOrderItemBean.class, itemPk);
		return aoib;
	}


	@Override
	public int updateItemPicture(AdOrderItemBean aoib) {
		int n = 0;
		
		Session session = factory.getCurrentSession();
		AdOrderItemBean bean = (AdOrderItemBean) session.merge(aoib);
//		AdOrderItemBean entityBean = session.get(AdOrderItemBean.class,aoib.getItemPk());
		System.out.println(bean.toString());
		n++;
		return n;
	}
	
	

}
