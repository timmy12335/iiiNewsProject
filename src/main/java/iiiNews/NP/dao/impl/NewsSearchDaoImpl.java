package iiiNews.NP.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.NP.dao.NewsSearchDao;
import iiiNews.NP.model.NewsBean;
@Repository
public class NewsSearchDaoImpl implements NewsSearchDao {
	
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<NewsBean> getNewsByWords(String searchWords) {
		String hql = "FROM NewsBean WHERE status = 1 AND "
				+ "(title LIKE :words OR location LIKE :words "
				+ "OR outline LIKE :words OR article LIKE :words"
				+ ")";
		Session session = factory.getCurrentSession();
		List<NewsBean> list = session.createQuery(hql)
							.setParameter("words", "%"+searchWords+"%")
							.getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<NewsBean> getNewsByType(String Type) {
		String hql = "FROM NewsBean WHERE status = 1 AND newsType=:Type ";				
		Session session = factory.getCurrentSession();
		List<NewsBean> list = session.createQuery(hql)
				.setParameter("Type", Type)
				.getResultList();
		return list;
	}

}
