package iiiNews.NP.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.NP.dao.NewsBackHaulDao;
import iiiNews.NP.model.NewsBean;
@Repository
public class NewsBackHaulDaoImpl implements NewsBackHaulDao {
	@Autowired
	SessionFactory factory;
	
	
	//依類別查詢For後台		
		@Override
		public Integer getNewByTypeForBB(String Type) {
			String hql = "SELECT count(*) FROM NewsBean WHERE newsType=:Type ";				
			Session session = factory.getCurrentSession();
			Integer typeNum = (Integer) session.createQuery(hql)
					.setParameter("Type", Type)
					.getSingleResult();
			return typeNum;
		}

}
