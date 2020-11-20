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

	// 使用AJAX顯示新聞頁面-----------------------------------
	@Override
	public int getTotalPages() {
		int totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return totalPages;
	}

	// 計算資料庫總共有幾筆資料
	public long getRecordCounts() {
		Long count = null; // 必須使用 long 型態
		String hql = "SELECT count(*) FROM MtAddBean WHERE status = 1";
		Session session = factory.getCurrentSession();
		count = (Long) session.createQuery(hql).getSingleResult();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MtAddBean> getPageComment(Integer pageComNo) {
		int startRecordNo = (pageComNo - 1) * recordsPerPage;
		String hql = "FROM MtAddBean WHERE status = 1";
		Session session = factory.getCurrentSession();
		List<MtAddBean> list = session.createQuery(hql)
									.setMaxResults(recordsPerPage)
									.setFirstResult(startRecordNo)
									.getResultList();
		return list;
	}

	
	//搜尋keyWord頁數-----------------------------------
	@Override
	public int getKeyWordPages(String searchWord) {
		int KeyWordPages = (int) (Math.ceil(getSearchRecordCounts(searchWord) / (double) recordsPerPage));
		return KeyWordPages;
	}
	
	// 計算資料庫總共有幾筆資料
	public long getSearchRecordCounts(String searchWord) {
		Long count = null; // 必須使用 long 型態
		String hql = "SELECT count(*) FROM MtAddBean WHERE status = 1 AND (title LIKE :word)";
		Session session = factory.getCurrentSession();
		count = (Long) session.createQuery(hql)
							.setParameter("word", "%" + searchWord + "%")
							.getSingleResult();
		return count;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MtAddBean> getAllArtWord(String searchWord, Integer keyWordPage) {
		System.out.println("------------------pageComNo------------------" + keyWordPage);
		int startRecordNo = (keyWordPage - 1) * recordsPerPage;
		String hql = "FROM MtAddBean WHERE status = 1 AND "
				+ "(title LIKE :word)";
		System.out.println("------------------startRecordNo------------------" + startRecordNo);
		Session session = factory.getCurrentSession();
		List<MtAddBean> list = session.createQuery(hql)
									.setParameter("word", "%" + searchWord + "%")
									.setMaxResults(recordsPerPage)
									.setFirstResult(startRecordNo)
									.getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MtAddBean> getAllMtByAjax(String set) {
		
		String hql = "FROM MtAddBean WHERE status = 1";
		
		if(set.equals("ALL")) {
			hql = "FROM MtAddBean";
			System.out.println("-----------------選擇全部文章-----------------");
		}
		
		Session session = factory.getCurrentSession();
		List<MtAddBean> list = session.createQuery(hql)
									.getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MtAddBean> getMtByCateNoAjax(Integer statusNo, String set) {
		
		String hql = "FROM MtAddBean WHERE status = 1 ";
		
		if(set.equals("ALL")) {
			hql = "FROM MtAddBean WHERE status = :statusno";
			System.out.println("-----------------選擇文章類別-----------------");
		}
		Session session = factory.getCurrentSession();
		List<MtAddBean> list = session.createQuery(hql)
									.setParameter("statusno", statusNo)
									.getResultList();
		return list;

	}

	
}
