package CR.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import CR.dao.CR_calDao;
import CR.service.CR_calService;

@Service
@Transactional
public class CR_calService_impl implements CR_calService {

	@Autowired
	CR_calDao dao;
	
	@Override
	public Map<String, Long> calFromCate() {
		
		return dao.calFromCate();
	}

}
