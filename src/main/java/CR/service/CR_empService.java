package CR.service;

import java.util.List;

import CR.model.CRBean;
import CR.model.CRemployee;

public interface CR_empService {
	
public List<CRemployee> getemployee();//全部員工
public List<CRemployee> getemployeeisstay(); //在職員工
public List<CRemployee> getemployeenotstay(); //離職員工
	

	void addemployee(CRemployee emp);
	
	void deleteemployeeByPk(int empPk);
	
	void updateemployee(CRemployee crb);
	
	public CRemployee getemployeeBytreatamt();
}
