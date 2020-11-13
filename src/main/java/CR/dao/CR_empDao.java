package CR.dao;

import java.util.List;

import CR.model.CRBean;
import CR.model.CRemployee;

public interface CR_empDao {

	
	void addemployee(CRemployee emp);
	
	public List<CRemployee> getemployee();
	
	void deleteemployeeByPk(int pk);
	
	void updateemployee(CRBean cb);
	
}
