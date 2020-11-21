package iiiNews.MT.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.MT.dao.MtReportDao;

@Repository
public class MtReportDaoImpl implements MtReportDao{
	
	@Autowired
	SessionFactory factory;
	
	public MtReportDaoImpl() {
	}

	@Override
	public Long getMtArtTotalReport(String category, Integer status) {
		String hql = "SELECT count(*) FROM MtAddBean WHERE category = :cate AND status = :status";
		Session session = factory.getCurrentSession();
		Long cateNum = (Long) session.createQuery(hql)
										.setParameter("cate", category)
										.setParameter("status", status)
										.getSingleResult();
		return cateNum;
	}
	
	// 類別金額查詢For報表
	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getMtCateReport(String category) {
		String hql = "SELECT status FROM NewsBean WHERE category =:cate ";
		Session session = factory.getCurrentSession();
		List<Integer> list = session.createQuery(hql)
									.setParameter("cate", category)
									.getResultList();
		return list;
	}

}
