package iiiNews.MT.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.AD.model.AdBean;
import iiiNews.MT.dao.MtAddDao;
import iiiNews.MT.model.MtAddBean;

@Repository
public class MtAddDaoImpl implements MtAddDao{

	@Autowired
	SessionFactory factory;
	
	public MtAddDaoImpl() {
	}
	
	@Override
	public int saveMtAddDao(MtAddBean mtAddBean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(mtAddBean);
		n++;
		return n;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MtAddBean> getAllAddDao() {
		String hql = "FROM MtAddBean";
		Session session = factory.getCurrentSession();
		List<MtAddBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@Override
	public MtAddBean getLastRecord() {
		String hql = "FROM MtAddBean ORDER BY updateDate DESC";
		Session session = factory.getCurrentSession();
		MtAddBean mtAddBean = null;
		try {
			mtAddBean = (MtAddBean) session.createQuery(hql).setMaxResults(1).getSingleResult();
		}catch(NoResultException e) {
			;
		}
		return mtAddBean;
	}

	@Override	//抓pkey
	public List<String> getAllAddDao1() {
		String hql = "SELECT m.pkey From MtAddBean m";
		List<String> list = new ArrayList<String>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql)
						.getResultList();
		return list;
	}

}
