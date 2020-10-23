package franktest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import franktest.dao.ProductDao;
import franktest.model.MemberBean;
import franktest.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDao dao;
	
	@Override
	@Transactional
	public List<MemberBean> getRecord() {
		return dao.getRecord();
	}



}
