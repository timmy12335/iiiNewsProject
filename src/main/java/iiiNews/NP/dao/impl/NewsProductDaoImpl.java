package iiiNews.NP.dao.impl;

import java.util.List;

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
	
	//新增一則新聞
	@Override
	public int uploadNewsForm(NewsBean nb) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(nb);
	
		n++;
		return n;
	}
	
	//查詢所有的新聞
	@SuppressWarnings("unchecked")
	@Override
	public List<NewsBean> getAllNews() {
		String hql = "FROM NewsBean";
		Session session = factory.getCurrentSession();
		List<NewsBean> list = session.createQuery(hql).getResultList();	
		return list;
	}

}
