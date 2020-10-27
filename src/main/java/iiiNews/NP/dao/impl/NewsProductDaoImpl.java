package iiiNews.NP.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.NP.dao.NewsProductDao;
import iiiNews.NP.model.NewsBean;
@Repository
public class NewsProductDaoImpl implements NewsProductDao {
	@Autowired
	SessionFactory factory;

	@Override
	public int uploadNewsForm(NewsBean nb) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(nb);
	
		n++;
		return n;
	}

}
