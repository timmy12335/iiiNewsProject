package iiiNews.NP.dao.impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.NP.dao.NewsProductDao;
import iiiNews.NP.model.NewsBean;
@Repository
public class NewsProductDaoImpl implements NewsProductDao {
	@Autowired
	SessionFactory factory;
	
	//新增一則新聞
	@Override
	public int uploadNewsForm(NewsBean nb) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(nb);
	
		n++;
		return n;
	}
	//抓最後一筆資料
	
	@Override
	public NewsBean getLastRecord() {
		String hql = "FROM NewsBean ORDER BY uploadTime DESC";		
		Session session = factory.getCurrentSession();
		NewsBean newsbean = null;
		try {
		newsbean = (NewsBean)session.createQuery(hql).setMaxResults(1).getSingleResult();
		}catch(NoResultException e) {
			;
		}
		return newsbean;
	}
	
	//查詢所有的新聞
	@SuppressWarnings("unchecked")
	@Override
	public List<NewsBean> getAllNews() {
		String hql = "FROM NewsBean WHERE status = 1 ORDER BY uploadTime DESC";
		Session session = factory.getCurrentSession();
		List<NewsBean> list = session.createQuery(hql).getResultList();	
		return list;
	}
	//抓單一筆新聞
	@Override
	public NewsBean getSingleNews(String newsId) {
		String hql = "FROM NewsBean WHERE newsId = :nId AND status = 1 ";
		Session session = factory.getCurrentSession();
		NewsBean newsbean = (NewsBean) session.createQuery(hql)
				.setParameter("nId", newsId).getSingleResult();
		return newsbean;
	}
	//查詢單一會員的新聞列表
	@SuppressWarnings("unchecked")
	@Override
	public List<NewsBean> getMemNews(String memberId) {
		String hql = "FROM NewsBean WHERE memberId = :memId "
				+ "AND status = 1 ORDER BY uploadTime DESC";
		Session session = factory.getCurrentSession();
		 List<NewsBean> list = session.createQuery(hql)
				.setParameter("memId", memberId)
				.getResultList();
		return list;
	}
	//刪除單一新聞紀錄
	@Override
	public void updateStatus(String newsId, int status) {
		String hql = "UPDATE NewsBean nb SET nb.status= :status "
				+ "WHERE nb.newsId = :id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("status", status)
				.setParameter("id", newsId).executeUpdate();
	}
	//修改單則新聞
	

	

}
