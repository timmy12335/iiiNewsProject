package iiiNews.AD.dao.impl;

import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.AD.dao.AdAjaxSearchDao;
import iiiNews.AD.model.AdBean;
@Repository
public class AdAjaxSearchDaoImpl implements AdAjaxSearchDao {
	
	@Autowired
	SessionFactory factory;
	
	public AdAjaxSearchDaoImpl() {
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AdBean> getAllAdByAjax(String set) {
		
		String hql = "FROM AdBean WHERE stock > 0 AND status = 1";
		
		if(set.equals("ALL")) {
			hql = "FROM AdBean";
			System.out.println("all print by dao");
		}
		
		Session session = factory.getCurrentSession();
		List<AdBean> list = session.createQuery(hql)
						.getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AdBean> getAdByCateNoAjax(String CateNo,String set) {
//		int startRecordNo = (pageNo - 1) * recordsPerPage;
		String hql = "FROM AdBean WHERE stock > 0 AND status = 1 AND categoryNo = :cateno";
		
		if(set.equals("ALL")) {
			hql = "FROM AdBean WHERE categoryNo = :cateno";
			System.out.println("all print by dao");
		}
		Session session = factory.getCurrentSession();
		List<AdBean> list = session.createQuery(hql)
						.setParameter("cateno", CateNo)
						.getResultList();
		return list;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<AdBean> getAdByDateAjax(Date adDate,String set) {
		String hql = "FROM AdBean WHERE stock > 0 AND status = 1 AND adDate = :date";
		
		if(set.equals("ALL")) {
			hql = "FROM AdBean WHERE adDate = :date";
			System.out.println("all print by dao");
		}
		
		Session session = factory.getCurrentSession();
		List<AdBean> list = session.createQuery(hql)
						.setParameter("date", adDate)
						.getResultList();
		return list;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<AdBean> getAdByWordAjax(String searchword,String set) {
		String hql = "FROM AdBean WHERE stock > 0 AND status = 1 AND "
				+ "(memberName LIKE :word OR adNo LIKE :word "
				+ "OR adTitle LIKE :word OR statement LIKE :word"
				+ ")";
		
		if(set.equals("ALL")) {
			hql = "FROM AdBean WHERE "
					+ "(memberName LIKE :word OR adNo LIKE :word "
					+ "OR adTitle LIKE :word OR statement LIKE :word"
					+ ")";
			System.out.println("all print by dao");
		}
		Session session = factory.getCurrentSession();
		List<AdBean> list = session.createQuery(hql)
						.setParameter("word", "%"+searchword+"%")
						.getResultList();
		return list;
	}

}
