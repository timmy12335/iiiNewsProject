package TRN.web.news.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import TRN.web.news.dao.trkNewsDao;
import TRN.web.news.model.rptNewsBean;
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

		@Override
		public void addtrkNews(trkNewsBean trkNew) {       //新增資料
			Session session = factory.getCurrentSession();
//			System.out.println(trkNew.getFounder());               //配合原本的 product dao impl  方法是:要把書級資料新增到資料庫, 作法1.先取得連線,  
//			rptNewsBean tb = getReportById(trkNew.getreportId());                              2. 因為書籍資料有外鍵companyBean 所以利用使用者給予的id查companybean對應名稱,
//			System.out.println(tb);                                                            3.把查到的companybean存入bookbean,
//			trkNew.setTrkNewsBean(tb);                                                         4. 將使用者輸入的資料一起存進bookbean並放入資料庫
		    session.save(trkNew);
		}
		
	

		@Override
		public rptNewsBean getReportById(int reportId) {       //原註記書本的出版公司
//			rptNewsBean tb = null;
//			Session session = factory.getCurrentSession();
//			tb = session.get(rptNewsBean.class, reportId);
			return null;
		}
		@SuppressWarnings("unchecked")                       //追蹤類別
		@Override
		public List<rptNewsBean> getReportList() {
			String hql = "FROM rptNewsBean";
			Session session = factory.getCurrentSession();
			List<rptNewsBean> list = session.createQuery(hql).getResultList();
			return list;
		}

		@Override //依pk刪除單則追蹤
		public void deletetrkNewsByPK(Integer trackId) {
			Session session = factory.getCurrentSession();
            trkNewsBean trkNewsBean = new trkNewsBean();
            trkNewsBean.setTrackId(trackId);
            session.delete(trkNewsBean);
		}

		@Override
		public void updatetrkNews(trkNewsBean trkNew) {
			Session session = factory.getCurrentSession();
			session.update(trkNew);
		}
		@Override
		public void evicttrkNews(trkNewsBean trkNew) {
			Session session = factory.getCurrentSession();
			session.evict(trkNew);
		}

		@Override
		public trkNewsBean findByPrimaryKey(Integer NewsId) { //為修改資料先找主鍵
			Session session = factory.getCurrentSession();
			trkNewsBean trkNewsBean = session.get(trkNewsBean.class, NewsId);
			return trkNewsBean;
		}

}
