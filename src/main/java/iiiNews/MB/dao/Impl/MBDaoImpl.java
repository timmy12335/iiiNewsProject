package iiiNews.MB.dao.Impl;

import java.util.ArrayList;
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
		String hql = "FROM MBBean WHERE memberId = :mId AND status = 1 ";
		Session session = factory.getCurrentSession();
		MBBean mbbean = (MBBean) session.createQuery(hql)
				.setParameter("nId", memberId).getSingleResult();
		return mbbean;
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

	@Override
	public void updatePasswd(String email) {
		String password = "mimi90325";
		String hql = "UPDATE MBBean mb SET mb.password = :mpwd " +
					"Where mb.email = :memail";
		Session session = factory.getCurrentSession();
		System.out.println("密碼更新中0000000000000");
		session.createQuery(hql)
				.setParameter("mpwd", password)
				.setParameter("memail", email)
				.executeUpdate();
		System.out.println("密碼已更新");
	}

	@Override
	public List<String> seachMemberaccount() {
		String hql = "SELECT DISTINCT m.email From MBBean m ";
		List<String> list = new ArrayList<String>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql)
					  .getResultList();
		System.out.println("da05"+list);
		return list;
	}

	@Override
	public boolean idExists(String id) {
		boolean exist = false;
		String hql = "FROM MBBean m WHERE m.memberId = :maccount" ; 
		Session session = factory.getCurrentSession();
		List<MBBean> beans = session.createQuery(hql)
										.setParameter("maccount",id)
										.getResultList();
		if (beans.size() > 0) {
			exist = true;
		}
		return exist;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean CheckPassword(String oldpwd, String newpwd, Integer id) {
		boolean check = false;
		System.out.println(" DAO check1      "+ check);
//		String hql = "FROM MBBean m WHERE m.password = :mold";
		String hql2 = "UPDATE MBBean mb SET mb.password = :mpwd " 
		+ "WHERE mb.pkey = :mid"; 
		Session session = factory.getCurrentSession();
//		List<MBBean> beans = session.createQuery(hql)
//										.setParameter("mold", oldpwd)
//										.getResultList();
//		System.out.println(beans);
//		if (beans.size() == 0) {
//			check = false;
//			System.out.println(" DAO check2      "+ check);
//			return check;
//		}else {
			System.out.println("newpwd:"+newpwd);
			System.out.println("mid:"+id);
			int n = session.createQuery(hql2)
					.setParameter("mpwd", newpwd)
					.setParameter("mid", id)
					.executeUpdate();
			System.out.println("n:"+n);
			check = true;
			System.out.println(" DAO check3      "+ check);
			return check;
		}
//	}

	@Override
	public MBBean getProductById(int memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MBBean get(Integer id) {
		return factory.getCurrentSession().get(MBBean.class, id);
	}

	@Override
	public List<MBBean> getAll() {
		String hql = "FROM MBBean";
		Session session = getSession();
		List<MBBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	public Session getSession() {
        return factory.getCurrentSession();			
	}

//	@Override
//	public MBBean getProductById(int memberId) {
//		Session session = factory.getCurrentSession();
//		return session.get(MBBean.class, memberId);
//	}
}
