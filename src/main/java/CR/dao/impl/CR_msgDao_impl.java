package CR.dao.impl;

import java.sql.Timestamp;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import CR.dao.CR_msgDao;
import CR.model.CrMsgBean;
import iiiNews.MB.model.MBBean;

@Repository
public class CR_msgDao_impl implements CR_msgDao {

	@Autowired
	SessionFactory factory;
	
	
	@Override
	public void addMsg(CrMsgBean msg) {
		Session session=factory.getCurrentSession();
		MBBean mb = getMemberById(msg.getMemberId());
		Timestamp date = new Timestamp(System.currentTimeMillis());
		msg.setSendTime(date);
		msg.setMbBean(mb);
		session.save(msg);
	}
	
	@Override
	public MBBean getMemberById(int memberId) {
		Session session=factory.getCurrentSession();
		return session.get(MBBean.class, memberId);
	}

}
