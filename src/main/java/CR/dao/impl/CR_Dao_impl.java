package CR.dao.impl;

import java.util.List;

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
		report.setMemberBean(mb);
		session.save(report);
		
	}


	@Override
	public MemberBean getMemberById(int memberId) {
		Session session=factory.getCurrentSession();
		return session.get(MemberBean.class, memberId);
	}

}
