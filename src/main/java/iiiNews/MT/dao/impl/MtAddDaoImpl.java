package iiiNews.MT.dao.impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.AD.model.AdOrderItemBean;
import iiiNews.MT.dao.MtAddDao;
import iiiNews.MT.model.MtAddBean;
import iiiNews.NP.model.NewsBean;

@Repository
public class MtAddDaoImpl implements MtAddDao{

	@Autowired
	SessionFactory factory;
	
	public MtAddDaoImpl() {
	}
	
	@Override
	public int saveMtAddDao(MtAddBean mtAddBean) {		//存mtAddBean資料，對應saveMtAddDao
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(mtAddBean);
		n++;
		return n;
	}
	
	@Override
	public MtAddBean getLastRecord() {			//取一筆資料至新增成功頁面
		String hql = "FROM MtAddBean ORDER BY updateDate DESC";
		Session session = factory.getCurrentSession();
		MtAddBean mtAddBean = null;
		try {
			mtAddBean = (MtAddBean) session.createQuery(hql).setMaxResults(1).getSingleResult();
		}catch(NoResultException e) {
			;
		}
		return mtAddBean;
	}

	@Override
	public MtAddBean getArticleById(String articleId) {		//抓到文章ID之後取出圖片
		String hql = "FROM MtAddBean WHERE articleId = :Id";
		Session session = factory.getCurrentSession();
		MtAddBean articleIdBean = (MtAddBean) session.createQuery(hql).setParameter("Id", articleId).getSingleResult();
		return articleIdBean;
	}

	@Override
	public MtAddBean deleteArticle(Integer pkey) {			//未完成******
        Session session = factory.getCurrentSession();
        String hql = "DELETE FROM MtAddBean WHERE pkey = :pkey";
        MtAddBean bean = (MtAddBean) session.createQuery(hql).setParameter("pkey", pkey).getSingleResult();
        return bean;
	}
	
	@Override
	public MtAddBean getpkey(int pkey) {
		Session session = factory.getCurrentSession();
		return session.get(MtAddBean.class, pkey);
	}
	
	@Override
	public void delete(Integer pkey) {				//刪除文章
		Session session = factory.getCurrentSession();
		MtAddBean bean = getpkey(pkey);
		session.delete(bean);
	}
	
	@Override
	public void update(MtAddBean mtAddBean) {			//更新文章資訊
		Session session = factory.getCurrentSession();
//		session.merge(mtAddBean);
		session.update(mtAddBean);	
	}

	

	@SuppressWarnings("unchecked")
	@Override
	public List<MtAddBean> getAllMtAdd() {			//取所有mtAddBean資料，對應getAllMtAdd
		String hql = "FROM MtAddBean ORDER BY pkey DESC ";		//選取狀態為1和0的使用者
//		String hql = "FROM MtAddBean WHERE status = 1 ORDER BY pkey DESC "; //選取狀態為1的使用者
//		String hql = "FROM MtAddBean";
		Session session = factory.getCurrentSession();
		List<MtAddBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@Override
	public void modifyArticle(MtAddBean ModArt) {		//編輯單一文章
		Session session = factory.getCurrentSession();
		session.update(ModArt);
//		MtAddBean bean = (MtAddBean) session.merge(ModArt);
//		System.out.println(bean.toString());
	}
	
	@Override
	public MtAddBean getSingleArticle(String articleId) {		//抓單一筆文章
		String hql = "FROM MtAddBean WHERE articleId = :artId AND status = 1 ";
		Session session = factory.getCurrentSession();
		MtAddBean bean = (MtAddBean) session.createQuery(hql)
				.setParameter("artId", articleId).getSingleResult();
		return bean;
	}
	
	@SuppressWarnings("unchecked")			//---------開始修改以下
	@Override
	public List<MtAddBean> getMemArticle(String memberId) {		//查詢單一會員的文章
		String hql = "FROM MtAddBean WHERE memberId = :memId "
				+ "AND status = 1 ORDER BY updateDate DESC";
		Session session = factory.getCurrentSession();
		List<MtAddBean> list = session.createQuery(hql)
				.setParameter("memId", memberId)
				.getResultList();
		return list;
	}
	
	@Override
	public void updateStatus(String articleId, int status) {		//刪除單一文章紀錄
		String hql = "UPDATE MtAddBean mtb SET mtb.status= :status "
				+ "WHERE mtb.articleId = :id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("status", status)
				.setParameter("id", articleId).executeUpdate();
	}


	
	
//	@Override	//抓pkey
//	public List<String> getAllAddDao1() {
//		String hql = "SELECT m.pkey From MtAddBean m";
//		List<String> list = new ArrayList<String>();
//		Session session = factory.getCurrentSession();
//		list = session.createQuery(hql)
//						.getResultList();
//		return list;
//	}

}
