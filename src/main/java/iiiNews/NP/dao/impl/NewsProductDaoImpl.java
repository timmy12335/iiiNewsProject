package iiiNews.NP.dao.impl;

import java.sql.Timestamp;
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
	
	//先預設一頁5筆資料
	Integer recordsPerPage = 5;
	
	//使用AJAX顯示新聞頁面
	@Override
	public int getTotalPages() {
		// 注意下一列敘述的每一個型態轉換
		int totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));

		return totalPages;
	}
	//計算資料庫總共有幾筆資料
	public long getRecordCounts() {
		Long count = null; // 必須使用 long 型態		
		String hql = "SELECT count(*) FROM NewsBean";
		Session session = factory.getCurrentSession();		
		count = (Long)session.createQuery(hql).getSingleResult();	
		return count;
	}

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
	
	//查詢所有上架的新聞
	@SuppressWarnings("unchecked")
	@Override
	public List<NewsBean> getAllNews() {
		String hql = "FROM NewsBean WHERE status = 1 ORDER BY uploadTime DESC";
		Session session = factory.getCurrentSession();
		List<NewsBean> list = session.createQuery(hql).getResultList();	
		return list;
	}
	
	//確認時間是否超過今天 若超過將status改為0
	@SuppressWarnings("unchecked")
	@Override
	public List<NewsBean> checkTime() {
		Timestamp statusTime = new Timestamp(System.currentTimeMillis());
		String hql = "UPDATE NewsBean set status=0 WHERE futureTime < :sTime"; 
		String hql2 = "FROM NewsBean WHERE status = 1 ORDER BY uploadTime DESC";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("sTime", statusTime).executeUpdate();
		List<NewsBean> list = session.createQuery(hql2).getResultList();	
		return list;
	}
		
	//抓已上架的單一筆新聞
	@Override
	public NewsBean getSingleNews(String newsId) {
		String hql = "FROM NewsBean WHERE newsId = :nId AND status = 1 ";
		Session session = factory.getCurrentSession();
		NewsBean newsbean = (NewsBean) session.createQuery(hql)
				.setParameter("nId", newsId).getSingleResult();
		return newsbean;
	}
	//未上架的單一新聞
	public NewsBean getSingleNewsForUpdate(String newsId) {
		String hql = "FROM NewsBean WHERE newsId = :nId AND status = 2 ";
		Session session = factory.getCurrentSession();
		NewsBean newsbean = (NewsBean) session.createQuery(hql)
				.setParameter("nId", newsId).getSingleResult();
		return newsbean;
	}
	//查詢已上架單一會員的新聞列表(status為1)
	@SuppressWarnings("unchecked")
	@Override
	public List<NewsBean> getUpMemNews(String memberId) {
		Timestamp statusTime = new Timestamp(System.currentTimeMillis());
		String hql0 = "UPDATE NewsBean set status=0 WHERE futureTime < :sTime";
		String hql = "FROM NewsBean WHERE memberId = :memId "
				+ "AND status = 1 ORDER BY uploadTime DESC";
		Session session = factory.getCurrentSession();
		session.createQuery(hql0).setParameter("sTime", statusTime).executeUpdate();
		 List<NewsBean> list = session.createQuery(hql)
				.setParameter("memId", memberId)
				.getResultList();
		return list;		
	}
	//查詢未上架單一會員的新聞列表(status為2)
	@SuppressWarnings("unchecked")
	@Override
	public List<NewsBean> getMemNews(String memberId) {
		String hql = "FROM NewsBean WHERE memberId = :memId "
				+ "AND status = 2 ORDER BY uploadTime DESC";
		Session session = factory.getCurrentSession();
		 List<NewsBean> list = session.createQuery(hql)
				.setParameter("memId", memberId)
				.getResultList();
		return list;
	}
	
	//刪除單一新聞紀錄
	@Override
	public void updateStatus(String newsId, Integer status) {
		String hql = "UPDATE NewsBean nb SET nb.status= :status "
				+ "WHERE nb.newsId = :id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("status", status)
				.setParameter("id", newsId).executeUpdate();
	}
	//修改單則新聞
	@SuppressWarnings("unchecked")
	@Override
	public List<NewsBean> getPageNews(Integer pageNo) {
		int startRecordNo = (pageNo - 1) * recordsPerPage;
		String hql = "FROM NewsBean";
		Session session = factory.getCurrentSession();
		List<NewsBean> list = session.createQuery(hql)
								.setMaxResults(recordsPerPage)
								.setFirstResult(startRecordNo)
								.getResultList();
		return list;
	}
	

	

	

}
