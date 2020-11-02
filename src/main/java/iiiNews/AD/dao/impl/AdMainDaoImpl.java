package iiiNews.AD.dao.impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.AD.dao.AdMainDao;
import iiiNews.AD.model.AdBean;

@Repository
public class AdMainDaoImpl implements AdMainDao {
	
	@Autowired
	SessionFactory factory;
	
	public AdMainDaoImpl() {
	}


	// 新增一筆廣告資料
	// 利用save方法，儲存AdBean物件，將ab新增到Ad表格內。
	// 回傳int 若成功應該會回傳1
	@Override
	public int saveAds(AdBean ab) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(ab);
		n++;
		return n;
	}

	
	// 查詢全部廣告列表 一次查全部
	@SuppressWarnings("unchecked")
	@Override
	public List<AdBean> getAllAds() {
		String hql = "FROM AdBean WHERE stock > 0";
		Session session = factory.getCurrentSession();
		List<AdBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	
	//抓最後一筆資料 為了新增時能查出最後一筆資料的廣告編號(AD2020102500001)
	//先設初值為null 若查無資料就回傳null 不處理例外
	@Override
	public AdBean getLastRecord() {
		String hql = "FROM AdBean ORDER BY uploadDate DESC";
		Session session = factory.getCurrentSession();
		AdBean adbean = null;
		try {
			adbean = (AdBean) session.createQuery(hql).setMaxResults(1).getSingleResult();
		}catch(NoResultException e) {
			;
		}
		return adbean;
	}

	
	//$$$$ 更新廣告上架資料 還沒測試沒寫完!!!!
	@Override
	public int updateAds(String adNo, AdBean ab) {
		int n = 0;
		String hql = "UPDATE AdBean ab" 
				+" SET ab.categoryNo=:cateNo, ab.width=:width, ab.height=:height, ab.adDate=:adDate,"
				+" ab.price=:price, ab.stock=:stock"
				+" WHERE ab.adNo";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("cateNo", ab.getCategoryNo())
								.setParameter("width", ab.getWidth())
								.setParameter("height", ab.getHeight())
								.setParameter("adDate", ab.getAdDate())
								.setParameter("price", ab.getPrice())
								.setParameter("stock", ab.getStock())
								.executeUpdate();
		//$$$$ ..............
		n++;
		return n;
	}

	
	//以會員id來查詢該會員的上傳廣告清單
	@SuppressWarnings("unchecked")
	@Override
	public List<AdBean> getMemberAdList(String cpmemberId) {
		String hql = "FROM AdBean WHERE memberId = :mid";
		Session session = factory.getCurrentSession();
		List<AdBean> list = session.createQuery(hql)
							.setParameter("mid", cpmemberId)	//^^^^注意此處memberId是String還是int 未來會用到!!!
							.getResultList();
		return list;
	}


	@Override
	public int deleteAdByMemberPkid(int pkId) {
		int n = 0;
		Session session = factory.getCurrentSession();
		AdBean ab = session.get(AdBean.class, pkId);
		session.delete(ab);
		n++;
		return n;
	}


	@Override
	public AdBean getOneAdByadPk(int adPk) {
		Session session = factory.getCurrentSession();
		AdBean ab = session.get(AdBean.class, adPk);
		return ab;
	}
	
	
}
