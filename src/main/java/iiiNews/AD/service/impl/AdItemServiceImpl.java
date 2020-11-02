package iiiNews.AD.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iiiNews.AD.dao.AdItemDao;
import iiiNews.AD.model.AdOrderItemBean;
import iiiNews.AD.service.AdItemService;

@Service
public class AdItemServiceImpl implements AdItemService {

	@Autowired
	AdItemDao adItemDao;
	
	public AdItemServiceImpl() {
	}

	@Override
	@Transactional
	public List<AdOrderItemBean> getItemsInOneOrder(int adOrderPk) {
		return adItemDao.getItemsInOneOrder(adOrderPk);
	}

	@Override
	@Transactional
	public AdOrderItemBean getOneItems(int itemPk) {
		return adItemDao.getOneItems(itemPk);
	}
	
	

}
