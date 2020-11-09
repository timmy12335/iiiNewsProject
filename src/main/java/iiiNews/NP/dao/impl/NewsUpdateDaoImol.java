package iiiNews.NP.dao.impl;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.NP.dao.NewsUpdateDao;
import iiiNews.NP.model.NewsBean;


@Repository
public class NewsUpdateDaoImol implements NewsUpdateDao {
	@Autowired
	SessionFactory factory ;

	
	//將限時時間塞進單則新聞(DB),並將新聞上架(status=1)
	@Override
	public void updatelimitTime(String limitTime01,String newsId) {
		
		String hql = "UPDATE NewsBean SET limitTime=:lit , futureTime=:fTi ,status=1 "
				+ "WHERE newsId = :id";
		Session session = factory.getCurrentSession();
		SimpleDateFormat stf = new SimpleDateFormat("HH:mm:ss");
//		String sti = stf.format(limitTime);
		System.out.println(limitTime01);
		String[] stiarr = limitTime01.split(":");
		
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		java.util.Date d = null; 
		Date date = new Date();
		String strDate = sdFormat.format(date);

		
		String[] dateAndTime=strDate.split(" ");
		String[] TimeStr=dateAndTime[1].split(":");
		
		int h = Integer.valueOf(stiarr[0]) + Integer.valueOf(TimeStr[0]);
		int m = Integer.valueOf(stiarr[1]) + Integer.valueOf(TimeStr[1]);
		int s = Integer.valueOf(stiarr[2]) + Integer.valueOf(TimeStr[2]);
		String countime =dateAndTime[0]+" "+ h +":" + m + ":" + s;

		try {
			d = sdFormat.parse(countime);
		} catch (ParseException e1) {			
			e1.printStackTrace();
		} 
		java.sql.Timestamp futureTime = new java.sql.Timestamp(d.getTime());
		
		java.util.Date ltime = null; 		
		System.out.println("limitTime01 = "+limitTime01);
		try {
			ltime = stf.parse(limitTime01);
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		java.sql.Time limitTime = new java.sql.Time(ltime.getTime());
		
		session.createQuery(hql).setParameter("lit", limitTime)
								.setParameter("fTi", futureTime)			
								.setParameter("id", newsId)						
								.executeUpdate();

	}
	//修改單則新聞
	@Override
	public void updateNewsProduct(NewsBean newsBean) {
		Session session = factory.getCurrentSession();
		session.update(newsBean);
		
	}
	
}
