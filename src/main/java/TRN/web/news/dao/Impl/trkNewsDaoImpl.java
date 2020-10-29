package TRN.web.news.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import TRN.web.news.dao.trkNewsDao;
import TRN.web.news.model.trkNewsBean;

@Repository
public class trkNewsDaoImpl implements trkNewsDao {
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override       //查詢所有資料
	@SuppressWarnings("unchecked")
	public List<trkNewsBean> getAllProducts() {
		String hql = "FROM trkNewsBean";
		Session session = null;
		List<trkNewsBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unused")    //點按鈕直接更新數量
	@Override
	public void updateNews(int productId, int newQuantity) {
		String hql = "UPDATE BookBean b SET b.stock = :stock WHERE bookId = :id";
		Session session = factory.getCurrentSession();
		int n = session.createQuery(hql).setParameter("stock", newQuantity)
	                            .setParameter("id", productId)
	                            .executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override                                  //分類查詢 show有哪些分類
	public List<String> getAlltypes() {
	    String hql = "SELECT DISTINCT b.type FROM trkNewsBean b";
	    Session session = factory.getCurrentSession();
	    List<String> list = new ArrayList<>();
	    list = session.createQuery(hql).getResultList();
	    return list;
	}


		@SuppressWarnings("unchecked")    
		@Override                             //分類查詢 show 單個分類所有新聞 
		public List<trkNewsBean> getNewsBytypes(String type) {
		    String hql = "FROM trkNewsBean bb WHERE bb.type = :type";
		    List<trkNewsBean> list = new ArrayList<>();
		    Session session = factory.getCurrentSession();
		    list = session.createQuery(hql).setParameter("type", type).getResultList();
		    return list;
		}
		@Override
		public trkNewsBean getNewsById(int NewsId) {   //查詢單筆產品資料
			Session session = factory.getCurrentSession();
			trkNewsBean bb = session.get(trkNewsBean.class, NewsId);
			return bb;
	}

}
