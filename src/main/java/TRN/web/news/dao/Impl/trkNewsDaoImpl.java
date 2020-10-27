package TRN.web.news.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import TRN.web.news.dao.trkNewsDao;
import TRN.web.news.model.trkNewsBean;

@Repository
public class trkNewsDaoImpl implements trkNewsDao {
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<trkNewsBean> getAllProducts() {
		String hql = "FROM trkNewsBean";
		Session session = null;
		List<trkNewsBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

}
