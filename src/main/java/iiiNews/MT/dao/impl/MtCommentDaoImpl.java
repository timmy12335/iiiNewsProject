package iiiNews.MT.dao.impl;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.MT.dao.MtCommentDao;
import iiiNews.MT.model.MtCommentBean;

@Repository
public class MtCommentDaoImpl implements MtCommentDao{

	@Autowired
	SessionFactory factory;
	
	public MtCommentDaoImpl() {
	}

	@Override
	public int saveMtCommentDao(MtCommentBean mtArtComBean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(mtArtComBean);
		n++;
		return n;
	}
	
	@Override
	public MtCommentBean getComLastRecord() {			//取一筆資料至新增成功頁面
		String hql = "FROM MtCommentBean ORDER BY uploadTime DESC";
		Session session = factory.getCurrentSession();
		MtCommentBean mtArtComBean = null;
		try {
			mtArtComBean = (MtCommentBean) session.createQuery(hql).setMaxResults(1).getSingleResult();
		}catch(NoResultException e) {
			;
		}
		return mtArtComBean;
	}
	
}
