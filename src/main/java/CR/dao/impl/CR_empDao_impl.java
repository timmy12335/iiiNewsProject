package CR.dao.impl;

import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import CR.dao.CR_empDao;
import CR.model.CRemployee;

@Repository
public class CR_empDao_impl implements CR_empDao {

	@Autowired
	SessionFactory factory;
	
	
	@Override
	public void addemployee(CRemployee emp) {
		Session session=factory.getCurrentSession();
		Date date=new Date(System.currentTimeMillis());
		emp.setApplyDate(date);
		emp.setReplyamt(0);
		emp.setUntreatamt(0);
		session.save(emp);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CRemployee> getemployee() {
		String hql ="FROM CRemployee";
		Session session=factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CRemployee> getemployeeisstay() {
		String hql ="FROM CRemployee where isstay=1";
		Session session=factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}
	

	@Override
	public void deleteemployeeByPk(int empPk) {
		Session session = factory.getCurrentSession();
		CRemployee crb = new CRemployee(); 
		crb.setEmpPk(empPk);
		String hql ="UPDATE CRemployee SET isstay=0 Where empPk=:emppk";
		
		session.createQuery(hql).setParameter("emppk", empPk).executeUpdate();

	}

	@Override
	public void updateemployee(CRemployee crb) {
		Session session = factory.getCurrentSession();
		String hql ="UPDATE CRemployee "
				+"SET empId=:Id, empName=:name, empemail=:email "
				+ "where empPk = :pk";
		session.createQuery(hql).setParameter("Id", crb.getEmpId())
								.setParameter("name", crb.getEmpName())
								.setParameter("email", crb.getEmpemail())
								.setParameter("pk", crb.getEmpPk())
								.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public CRemployee getemployeeBytreatamt() {
		Session session=factory.getCurrentSession();
		String hql ="SELECT MIN(untreatamt) FROM CRemployee";
		List<CRemployee> list =session.createQuery(hql).getResultList();
		CRemployee first = list.get(0);
		return first;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CRemployee> getemployeenotstay() {
		String hql ="FROM CRemployee where isstay=0";
		Session session=factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}
	
	
}
