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
import iiiNews.MB.model.MBBean;

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
		MBBean mb = getMemberById(report.getMemberId());
		Timestamp date=new Timestamp(System.currentTimeMillis());
		report.setCrApplyDate(date);
		report.setMbBean(mb);
		session.save(report);
		
	}


	@Override
	public MBBean getMemberById(int memberId) {
		Session session=factory.getCurrentSession();
		return session.get(MBBean.class, memberId);
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

	@Override
	public void updateReport(CRBean report) {
		Session session=factory.getCurrentSession();
		session.update(report);		
		
	}

	@Override
	public void evictReport(CRBean cb) {
		Session session = factory.getCurrentSession();
		session.evict(cb);		
	}
	
}
