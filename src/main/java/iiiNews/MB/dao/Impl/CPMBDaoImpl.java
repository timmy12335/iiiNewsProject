package iiiNews.MB.dao.Impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.MB.dao.CPMBDao;
import iiiNews.MB.model.CpMemberBean;
import iiiNews.MB.model.MBBean;

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
		String hql = "FROM MBBean WHERE memberId = :mId AND status = 1 ";
		Session session = factory.getCurrentSession();
		CpMemberBean cpmbbean = (CpMemberBean) session.createQuery(hql).setParameter("nId", cpmemberId)
				.getSingleResult();
		return cpmbbean;
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

	@Override
	public CpMemberBean cplogin(String account, String password) {
		CpMemberBean cpmb = null;
		Session session = factory.getCurrentSession();
		String hql = "From CpMemberBean m WHERE m.cpmemberId = :acc and m.password2 = :pwd";
		try {
			cpmb = (CpMemberBean) session.createQuery(hql).setParameter("acc", account).setParameter("pwd", password)
					.getSingleResult();
			System.out.println(cpmb.getCpmemberId());
			System.out.println("登入成功");
		} catch (NoResultException e) {
			System.out.println("登入失敗");
		}

		return cpmb;
	}

	@Override
	public boolean idcpExists(String id) {
		boolean exist = false;
		String hql = "FROM CpMemberBean m WHERE m.cpmemberId = :maccount";
		Session session = factory.getCurrentSession();
		List<CpMemberBean> beans = session.createQuery(hql).setParameter("maccount", id).getResultList();
		if (beans.size() > 0) {
			exist = true;
		}
		return exist;
	}

	@Override
	public CpMemberBean get(Integer id) {
		return factory.getCurrentSession().get(CpMemberBean.class, id);
	}

	@Override
	public List<CpMemberBean> getAll() {
		String hql = "FROM CpMemberBean";
		Session session = getSession();
		List<CpMemberBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	public Session getSession() {
        return factory.getCurrentSession();			
	}
}
