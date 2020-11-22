package iiiNews.AD.dao.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.AD.dao.AdAjaxSearchDao;
import iiiNews.AD.model.AdBean;
import iiiNews.AD.model.AdOrderBean;
@Repository
public class AdAjaxSearchDaoImpl implements AdAjaxSearchDao {
	
	@Autowired
	SessionFactory factory;
	
	public AdAjaxSearchDaoImpl() {
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AdBean> getAllAdByAjax(String set) {
		
		String hql = "FROM AdBean WHERE stock > 0 AND status = 1 ORDER BY adPk DESC";
		
		if(set.equals("ALL")) {
			hql = "FROM AdBean ORDER BY adPk DESC";
			System.out.println("all print by dao DESC");
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
		System.out.println("getAdByCateNoAjax ORDER BY adPk DESC");
		String hql = "FROM AdBean WHERE stock > 0 AND status = 1 AND categoryNo = :cateno ORDER BY adPk DESC";
		
		if(set.equals("ALL")) {
			hql = "FROM AdBean WHERE categoryNo = :cateno ORDER BY adPk DESC";
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
		System.out.println("getAdByDateAjax ORDER BY adPk DESC");
		String hql = "FROM AdBean WHERE stock > 0 AND status = 1 AND adDate = :date ORDER BY adPk DESC";
		
		if(set.equals("ALL")) {
			hql = "FROM AdBean WHERE adDate = :date ORDER BY adPk DESC";
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
		System.out.println("getAdByWordAjax ORDER BY adPk DESC");
		String hql = "FROM AdBean WHERE stock > 0 AND status = 1 AND "
				+ "(memberName LIKE :word OR adNo LIKE :word "
				+ "OR adTitle LIKE :word OR statement LIKE :word"
				+ ") ORDER BY adPk DESC";
		
		if(set.equals("ALL")) {
			hql = "FROM AdBean WHERE "
					+ "(memberName LIKE :word OR adNo LIKE :word "
					+ "OR adTitle LIKE :word OR statement LIKE :word"
					+ ") ORDER BY adPk DESC";
			System.out.println("all print by dao");
		}
		Session session = factory.getCurrentSession();
		List<AdBean> list = session.createQuery(hql)
						.setParameter("word", "%"+searchword+"%")
						.getResultList();
		return list;
	}

/*訂單系列的ajax*/
	@SuppressWarnings("unchecked")
	@Override
	public List<AdOrderBean> getOrderByAjax(String buyerMemberId, String adOrderNo, String orderDate) {
		Session session = factory.getCurrentSession();
		List<AdOrderBean> list = new ArrayList<>();
		System.out.println("參數buyerMemberId："+buyerMemberId+"參數adOrderNo："+adOrderNo+"參數orderDate："+orderDate);
		
		String hql = "FROM AdOrderBean";
		if (buyerMemberId.equals("ALL")&&adOrderNo.equals("ALL")) {
			hql = "FROM AdOrderBean ORDER BY adOrderPk DESC";
			list = session.createQuery(hql).getResultList();
			System.out.println("======================  方法一  ======================DESC");
		}else if(! buyerMemberId.equals("ALL")) {
			hql = "FROM AdOrderBean WHERE buyerMemberId = :mid ORDER BY adOrderPk DESC";
			list = session.createQuery(hql).setParameter("mid", buyerMemberId).getResultList();
			System.out.println("======================  方法2  ======================DESC");
		}else {
			hql = "FROM AdOrderBean ORDER BY adOrderPk DESC";
			list = session.createQuery(hql).getResultList();
			System.out.println("======================  方法3  ======================");
		}
		
//		List<AdOrderBean> list = session.createQuery(hql).getResultList();
		return list;
	}

}
