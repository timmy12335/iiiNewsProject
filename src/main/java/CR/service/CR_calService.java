package CR.service;

import java.util.Map;

public interface CR_calService {
	
	
	Map<String, Long> calFromCate();
	Map<String, Integer> calunFromEmp();
	Map<String, Long> calAllFromEmp();
	Map<String, Integer> calDoneFromEmp();
}
