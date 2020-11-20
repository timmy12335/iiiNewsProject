package CR.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import CR.dao.CR_calDao;

@Repository
public class CR_calDao_impl implements CR_calDao {

	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Long> calFromCate() {
		Session session = factory.getCurrentSession();
		Map<String, Long> map = new HashMap<>();
		String hql = "SELECT DISTINCT crClass FROM CRBean";
		List<String> list = session.createQuery(hql).getResultList();
		for(String cate:list) {
		String hql2 ="SELECT COUNT(*) FROM CRBean where crClass=:class";
		Long num= (Long) session.createQuery(hql2).setParameter("class", cate).uniqueResult();
		map.put(cate, num);
		}
	
		return map;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Integer> calunFromEmp() {
		Session session = factory.getCurrentSession();
		Map<String, Integer> map = new HashMap<>();
		String hql = "SELECT DISTINCT empName FROM CRemployee";
		List<String> list = session.createQuery(hql).getResultList();
		for(String emp:list) {
		String hql2 ="SELECT untreatamt FROM CRemployee where empName=:empname";
		Integer num= (Integer) session.createQuery(hql2).setParameter("empname", emp).uniqueResult();
		map.put(emp, num);
		}
		return map;
	}

}
