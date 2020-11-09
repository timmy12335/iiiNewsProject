package iiiNews.MB.dao.Impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.MB.dao.CPMBDao;
import iiiNews.MB.model.CpMemberBean;

@Repository
public class CPMBDaoImpl implements CPMBDao {

	@Autowired
	SessionFactory factory;

	@Override
	public int cppasswordForm(CpMemberBean cpmb) {

		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(cpmb);

		n++;
		return n;
	}

	@Override
	public CpMemberBean saveCpMember() {
		
		String hql = "FROM NewsBean ORDER BY uploadTime DESC";
		Session session = factory.getCurrentSession();
		CpMemberBean cpmbbean = null;
		try {
			cpmbbean = (CpMemberBean) session.createQuery(hql).setMaxResults(1).getSingleResult();
		} catch (NoResultException e) {
			;
		}
		return cpmbbean;
	}

	@Override
	public int saveCpMember(CpMemberBean cpmb) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CpMemberBean> getAllCpMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CpMemberBean getSingleCpMmeber(String cpmemberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CpMemberBean> getCpMember(String cpname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addCpMember(CpMemberBean cpmember) {
		Session session = factory.getCurrentSession();
		session.save(cpmember);

	}

}
