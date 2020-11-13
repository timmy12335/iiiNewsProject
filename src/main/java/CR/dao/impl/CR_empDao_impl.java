package CR.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import CR.dao.CR_empDao;
import CR.model.CRBean;
import CR.model.CRemployee;

@Repository
public class CR_empDao_impl implements CR_empDao {

	@Autowired
	SessionFactory factory;
	
	
	@Override
	public void addemployee(CRemployee emp) {
		Session session=factory.getCurrentSession();
		session.save(emp);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CRemployee> getemployee() {
		String hql ="FROM CRBean";
		Session session=factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@Override
	public void deleteemployeeByPk(int pk) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateemployee(CRBean cb) {
		// TODO Auto-generated method stub

	}

}
