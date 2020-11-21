package iiiNews.AD.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.AD.dao.AdEndDao;
import iiiNews.AD.model.AdOrderItemBean;

@Repository
public class AdEndDaoImpl implements AdEndDao {
	
	@Autowired
	SessionFactory factory;
	
	public AdEndDaoImpl() {
	}
	
	
	@SuppressWarnings("unchecked")
	public List<AdOrderItemBean> eachCateFunction(String categoryNo,String cpmemberId){
		String hql = "";
		Session session = factory.getCurrentSession();
		List<AdOrderItemBean> list = null;
		if (cpmemberId == null) {
			hql = "FROM AdOrderItemBean WHERE categoryNo = :cateNo";
			list = session.createQuery(hql).setParameter("cateNo", categoryNo).getResultList();
		}else {
			hql = "FROM AdOrderItemBean WHERE categoryNo = :cateNo AND sellerMemberId = :cpmem";
			list = session.createQuery(hql).setParameter("cateNo", categoryNo).setParameter("cpmem", cpmemberId).getResultList();
		}
		
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<AdOrderItemBean> allOrderFunction(){
		String hql = "FROM AdOrderItemBean";
		Session session = factory.getCurrentSession();
		List<AdOrderItemBean> list = session.createQuery(hql).getResultList();
		return list;
	}
}
