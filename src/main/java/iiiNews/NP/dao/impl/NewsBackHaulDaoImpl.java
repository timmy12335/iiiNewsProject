package iiiNews.NP.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.NP.dao.NewsBackHaulDao;
import iiiNews.NP.model.NewsBean;
import iiiNews.NP.model.NewsOrderBean;
@Repository
public class NewsBackHaulDaoImpl implements NewsBackHaulDao {
	
	@Autowired
	SessionFactory factory;
	
	
		//依類別查詢For後台		
		@Override
		public Long getNewByTypeForBB(String Type,Integer status) {
			String hql = "SELECT count(*) FROM NewsBean WHERE newsType=:Type AND status=:stu ";				
			Session session = factory.getCurrentSession();
			Long typeNum = (Long) session.createQuery(hql)
					.setParameter("Type", Type)
					.setParameter("stu", status)
					.getSingleResult();
			return typeNum;
		}

		//類別金額查詢For報表
		@SuppressWarnings("unchecked")
		@Override
		public List<Integer> getNewsCountForBB(String Type, Integer status) {
			String hql = "SELECT price FROM NewsBean WHERE newsType=:Type AND status=:stu ";
			Session session = factory.getCurrentSession();
			List<Integer> list = session.createQuery(hql)
					.setParameter("Type", Type)
					.setParameter("stu", status)
					.getResultList();
			return list;
		}

		//後臺查詢所有訂單
		@SuppressWarnings("unchecked")
		@Override
		public List<NewsOrderBean> getOrderForBB() {
			String hql = "FROM NewsOrderBean ORDER BY soldTime DESC ";
			Session session = factory.getCurrentSession();
			List<NewsOrderBean> list = session.createQuery(hql).getResultList();					
			return list;
		}
		
		
	

}
