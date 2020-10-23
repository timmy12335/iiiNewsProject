package franktest.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import franktest.model.MemberBean;

@Repository
public class MemberDao {
	
	@Autowired
	SessionFactory factory;

	public MemberDao() {
	}
	
	public int saveMember(MemberBean mb1) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(mb1);
		n++;
		return n;
	}
	
	
	
}
