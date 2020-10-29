package iiiNews.AD.dao.impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.AD.dao.AdOrderDao;
import iiiNews.AD.model.AdOrderBean;

@Repository
public class AdOrderDaoImpl implements AdOrderDao {

	@Autowired
	SessionFactory factory;
	
	public AdOrderDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<AdOrderBean> getMemberOrderList(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AdOrderBean getLastRecord() {
		String hql = "FROM AdOrderBean ORDER BY orderDate DESC";
		Session session = factory.getCurrentSession();
		AdOrderBean bean = null;
		try {
			bean = (AdOrderBean) session.createQuery(hql).setMaxResults(1).getSingleResult();
		}catch(NoResultException e) {
			;
		}
		return bean;
	}

	@Override
	public int saveOrders(AdOrderBean aob) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(aob);
		n++;
		return n;
	}

}
