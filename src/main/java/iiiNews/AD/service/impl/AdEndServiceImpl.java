package iiiNews.AD.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iiiNews.AD.dao.AdEndDao;
import iiiNews.AD.model.AdOrderItemBean;
import iiiNews.AD.service.AdEndService;

@Service
public class AdEndServiceImpl implements AdEndService {

	@Autowired
	AdEndDao adEndDao;
	
	public AdEndServiceImpl() {
	}

	@Override
	@Transactional
	public Map<String, Integer> eachCateCount(ArrayList<String> array,String cpmemberId) {
		
		Map<String, Integer> map = new HashMap<>();
//		$$$$$
//		= new ArrayList<>();
		int size = 0;
		for(String cateNo : array) {
			List<AdOrderItemBean> list = adEndDao.eachCateFunction(cateNo,cpmemberId);
			size = list.size();
			map.put(cateNo, size);
		}
		return map;
	}
	
	
	@Override
	@Transactional
	public Map<String, Integer> eachCatePrice(String cpmemberId) {
		
		Map<String, Integer> map = new HashMap<>();
		int total = 0;
		List<String> array = cateArray();
		
		for(String cateNo : array) {
			total = 0 ;
			List<AdOrderItemBean> list = adEndDao.eachCateFunction(cateNo,cpmemberId);
			for(AdOrderItemBean aoid :list) {
				total += aoid.getUnitPrice();
			}
			map.put(cateNo, total);
		}
		return map;
	}
	
	//創建一個分類的arraylist
	public List<String> cateArray(){
		List<String> list = new ArrayList<>();
		list.add("100");
		list.add("200");
		list.add("300");
		list.add("400");
		list.add("500");
		return list;
	}

	@Override
	@Transactional
	public Map<String, Integer> allOrderPriceAndCount(){
		Map<String, Integer> map = new HashMap<>();
		List<AdOrderItemBean> list = adEndDao.allOrderFunction();
		int price = 0;
		int count = 0;
		for(AdOrderItemBean aoib:list) {
			price += aoib.getUnitPrice();
			count++;
		}
		map.put("monthPrice",price);
		map.put("monthCount",count);
		return map;
	}
	
}
