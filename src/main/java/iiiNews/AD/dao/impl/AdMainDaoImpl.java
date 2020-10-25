package iiiNews.AD.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.AD.dao.AdMainDao;
import iiiNews.AD.model.AdBean;

@Repository
public class AdMainDaoImpl implements AdMainDao {
	
	@Autowired
	SessionFactory factory;
	
	public AdMainDaoImpl() {
	}


	// 儲存AdBean物件，將參數ab新增到Ad表格內。
	@Override
	public int saveAds(AdBean ab) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(ab);
		n++;
		return n;
	}

	// 查詢全部廣告列表 一次查全部
	@SuppressWarnings("unchecked")
	@Override
	public List<AdBean> getAllAds() {
		String hql = "FROM AdBean";
		Session session = factory.getCurrentSession();
		List<AdBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	
}
