package iiiNews.NP.dao.impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.NP.dao.NewsOrderDao;
import iiiNews.NP.model.NewsOrderBean;
@Repository
public class NewsOrderDaoImpl implements NewsOrderDao {
	
	@Autowired
	SessionFactory factory;
	//取得訂單的流水號
	@Override
	public NewsOrderBean getOrderRecord() {
		String hql = "FROM NewsOrderBean ORDER BY soldTime DESC";		
		Session session = factory.getCurrentSession();
		NewsOrderBean newsOrderBean = null;
		try {
		newsOrderBean = (NewsOrderBean) session.createQuery(hql).setMaxResults(1).getSingleResult();
		}catch(NoResultException e) {
			;
		}
		return newsOrderBean;
	}
	//新增訂單紀錄
	@Override
	public int uploadNewsOrder(NewsOrderBean nOrderBean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(nOrderBean);	
		n++;
		return n;
		
	}
	//取出企業所購買的新聞列表
	@SuppressWarnings("unchecked")
	@Override
	public List<NewsOrderBean> getOrderListByAjax(String companyId) {
		String hql = "FROM NewsOrderBean nob WHERE nob.companyId = :cId ";
		Session session = factory.getCurrentSession();
		List<NewsOrderBean> list = session.createQuery(hql).setParameter("cId", companyId).getResultList();
		return list;
	}
	//列出會員被購買紀錄
	@SuppressWarnings("unchecked")
	@Override
	public List<NewsOrderBean> getOrderMemListByAjax(String memberId) {
		String hql = "FROM NewsOrderBean nob WHERE nob.memberId = :mId ";
		Session session = factory.getCurrentSession();
		List<NewsOrderBean> list = session.createQuery(hql).setParameter("mId", memberId).getResultList();
		return list;
	}
	
	
	
	
	
	

}
