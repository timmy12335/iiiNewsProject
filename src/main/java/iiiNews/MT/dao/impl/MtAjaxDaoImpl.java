package iiiNews.MT.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.MT.dao.MtAjaxDao;
import iiiNews.MT.model.MtAddBean;

@Repository
public class MtAjaxDaoImpl implements MtAjaxDao {

	@Autowired
	SessionFactory factory;

	// 先預設一頁5筆資料
	Integer recordsPerPage = 5;

	public MtAjaxDaoImpl() {
	}

	// 使用AJAX顯示新聞頁面
	@Override
	public int getTotalPages() {
		int totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return totalPages;
	}

	// 計算資料庫總共有幾筆資料
	public long getRecordCounts() {
		Long count = null; // 必須使用 long 型態
		String hql = "SELECT count(*) FROM MtAddBean";
		Session session = factory.getCurrentSession();
		count = (Long) session.createQuery(hql).getSingleResult();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MtAddBean> getPageComment(Integer pageComNo) {
		int startRecordNo = (pageComNo - 1) * recordsPerPage;
		String hql = "FROM MtAddBean";
		Session session = factory.getCurrentSession();
		List<MtAddBean> list = session.createQuery(hql)
									.setMaxResults(recordsPerPage)
									.setFirstResult(startRecordNo)
									.getResultList();
		return list;
	}

}
