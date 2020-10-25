package franktest.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import franktest.dao.ProductDao;
import franktest.model.MemberBean;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SessionFactory factory;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getRecord() {
		String hql = "FROM MemberBean";
		Session session = factory.getCurrentSession();
		List<MemberBean> beans = new ArrayList<>();
		beans = session.createQuery(hql).getResultList();
		return beans;
	}
	
	
	
}
