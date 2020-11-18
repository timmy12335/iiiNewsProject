package CR.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import CR.dao.CR_empDao;
import CR.model.CRemployee;
import CR.service.CR_empService;

@Service
@Transactional
public class CR_empService_impl implements CR_empService {

	@Autowired
	CR_empDao dao;
	
	@Override
	public List<CRemployee> getemployee() {
		
		return dao.getemployee();
	}

	@Override
	public void addemployee(CRemployee emp) {
		dao.addemployee(emp);
		
	}

	@Override
	public void deleteemployeeByPk(int empPk) {
		
		dao.deleteemployeeByPk(empPk);
	}

	@Override
	public void updateemployee(CRemployee crb) {
		dao.updateemployee(crb);
		System.out.println("success");
		
	}

	@Override
	public CRemployee getemployeeBytreatamt() {
		
		return dao.getemployeeBytreatamt();
	}

	@Override
	public List<CRemployee> getemployeeisstay() {
		
		return dao.getemployeeisstay();
	}

	@Override
	public List<CRemployee> getemployeenotstay() {
		return dao.getemployeenotstay();
	}

	@Override
	public List<CRemployee> getempByName(String empName) {
		
		return dao.getempByName(empName);
	}

	@Override
	public List<CRemployee> getempByDate(Date date) {
		
		return dao.getempByDate(date);
	}

	@Override
	public void returnemployeeByPk(int empPk) {
		dao.returnemployeeByPk(empPk);
		
	}

	

}
