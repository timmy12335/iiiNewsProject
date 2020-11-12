package iiiNews.MB.dao.Impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import iiiNews.MB.dao.MBDao;
import iiiNews.MB.model.MBBean;

@Repository
public class MBDaoImpl implements MBDao {

	@Autowired
	SessionFactory factory;

	@Override
	public int passwordForm(MBBean mb) {

		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(mb);

		n++;
		return n;
	}

	@Override
	public MBBean saveMember() {

		String hql = "FROM NewsBean ORDER BY uploadTime DESC";
		Session session = factory.getCurrentSession();
		MBBean mbbean = null;
		try {
			mbbean = (MBBean) session.createQuery(hql).setMaxResults(1).getSingleResult();
		} catch (NoResultException e) {
			;
		}
		return mbbean;
	}

	@Override
	public List<MBBean> getAllMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MBBean getSingleMmeber(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MBBean> getMember(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int saveMember(MBBean mb) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void addMember(MBBean member) {
		Session session = factory.getCurrentSession();
		session.save(member);
	}

	@Override
	public MBBean login(String account, String password) {
		MBBean mb = null;
		Session session = factory.getCurrentSession();
		String hql = "From MBBean m WHERE m.memberId = :acc and m.password = :pwd";
		try {
			mb = (MBBean) session.createQuery(hql).setParameter("acc", account).setParameter("pwd", password)
					.getSingleResult();
			System.out.println(mb.getMemberId());
			System.out.println("登入成功");
		} catch (NoResultException e) {
			System.out.println("登入失敗");
		}

		return mb;
	}
}
