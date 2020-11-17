package CR.dao;

import java.sql.Date;
import java.util.List;

import CR.model.CRBean;
import CR.model.CRemployee;

public interface CR_empDao {

	
	void addemployee(CRemployee emp);
	
	public List<CRemployee> getemployee();
	public List<CRemployee> getemployeeisstay();
	public List<CRemployee> getemployeenotstay();
	public List<CRemployee> getempByName(String empName);
	
	void deleteemployeeByPk(int empPk);
	
	void updateemployee(CRemployee crb);
	
	public CRemployee getemployeeBytreatamt();

	List<CRemployee> getempByDate(Date date);


	
}
