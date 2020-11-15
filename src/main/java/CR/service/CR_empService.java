package CR.service;

import java.util.List;

import CR.model.CRBean;
import CR.model.CRemployee;

public interface CR_empService {
public List<CRemployee> getemployee();
	

	void addemployee(CRemployee emp);
	
	void deleteemployeeByPk(int empPk);
	
	void updateemployee(CRemployee crb);
	
	public CRemployee getemployeeBytreatamt();
}
