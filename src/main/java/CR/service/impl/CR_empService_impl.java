package CR.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import CR.dao.CR_empDao;
import CR.model.CRBean;
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

	

}
