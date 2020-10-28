package CR.dao.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.NonUniqueResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import CR.dao.CR_Dao;
import CR.model.CRBean;
import franktest.model.MemberBean;

@Repository
public class CR_Dao_impl implements CR_Dao {

	@Autowired
	SessionFactory factory;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CRBean> getRecord() {
		String hql ="FROM CRBean";
		Session session=factory.getCurrentSession();		
		return session.createQuery(hql).getResultList();
	}

	@Override
	public void addReport(CRBean report) {
		Session session=factory.getCurrentSession();
		MemberBean mb = getMemberById(report.getMemberId());
		Timestamp date=new Timestamp(System.currentTimeMillis());
		report.setCrApplyDate(date);
		report.setMemberBean(mb);
		session.save(report);
		
	}


	@Override
	public MemberBean getMemberById(int memberId) {
		Session session=factory.getCurrentSession();
		return session.get(MemberBean.class, memberId);
	}

	@Override
	public void deleteReportByPk(int pk) {
		Session session = factory.getCurrentSession();
		CRBean cb = new CRBean(); 
		cb.setPk(pk);
		session.delete(cb);
	}

	@Override
	public CRBean getReportById(int pk) {
		Session session = factory.getCurrentSession();
		String hql ="FROM CRBean WHERE pk = :pk";
		CRBean cb = null;
		try {
			cb =(CRBean) session.createQuery(hql)
					.setParameter("pk", pk)
					.getSingleResult();
		}catch(NonUniqueResultException e) {
			e.printStackTrace();
		}
		return cb;
	}
	
}
