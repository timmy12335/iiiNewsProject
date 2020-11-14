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
		session.save(emp);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CRemployee> getemployee() {
		String hql ="FROM CRemployee";
		Session session=factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@Override
	public void deleteemployeeByPk(int empPk) {
		Session session = factory.getCurrentSession();
		CRemployee crb = new CRemployee(); 
		crb.setEmpPk(empPk);
		session.delete(crb);

	}

	@Override
	public void updateemployee(CRemployee crb) {
		Session session = factory.getCurrentSession();
		String hql ="UPDATE CRemployee "
				+"SET empId=:Id, empName=:name, empemail=:email "
				+ "where empPk = :pk";
		System.out.println("HI"+crb.getEmpId()+crb.getEmpemail()+"pk="+crb.getEmpPk());
		session.createQuery(hql).setParameter("Id", crb.getEmpId())
								.setParameter("name", crb.getEmpName())
								.setParameter("email", crb.getEmpemail())
								.setParameter("pk", crb.getEmpPk())
								.executeUpdate();
	}
	
	
}
