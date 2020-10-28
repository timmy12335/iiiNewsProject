package iiiNews.MT.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
