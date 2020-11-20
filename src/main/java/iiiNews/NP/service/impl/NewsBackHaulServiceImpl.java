package iiiNews.NP.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import iiiNews.NP.dao.NewsBackHaulDao;
import iiiNews.NP.dao.NewsProductDao;
import iiiNews.NP.model.NewsBean;
import iiiNews.NP.model.NewsOrderBean;
import iiiNews.NP.service.NewsBackHaulService;
@Service
@Transactional
public class NewsBackHaulServiceImpl implements NewsBackHaulService {
	@Autowired
	NewsProductDao  newsProductDao;
	
	@Autowired
	NewsBackHaulDao newsBackHaulDao;
	
	
	
	

	//將類別筆數塞進map
	@Override
	public Map<String,Long> getNewByTypeForBB() {
		Map<String,Long> map = new HashMap<>();
		map.put("交通", newsBackHaulDao.getNewByTypeForBB("交通",-1));
		map.put("糾紛", newsBackHaulDao.getNewByTypeForBB("糾紛",-1));
		map.put("感情", newsBackHaulDao.getNewByTypeForBB("感情",-1));
		map.put("詐騙", newsBackHaulDao.getNewByTypeForBB("詐騙",-1));
		map.put("災情", newsBackHaulDao.getNewByTypeForBB("災情",-1));
		map.put("爆料", newsBackHaulDao.getNewByTypeForBB("爆料",-1));
		
		return map;
	}
	
	//將類別金額放進map
	@Override
	public Integer getNewsCountForBB(String Type) {		
		List<Integer> list = newsBackHaulDao.getNewsCountForBB(Type, -1);
		int sum = 0;
		for(int i=0;i<list.size();i++) {
			sum += list.get(i) ;
		}		
		return sum;		
	}
	
	//刪除單一新聞紀錄
		@Override
		public void delSingleNewsForBB(String newsId) {
			NewsBean newsbean = newsProductDao.getSingleNews(newsId);
			if(newsbean.getStatus() != null && newsbean.getStatus() > 0 ) {
				newsProductDao.updateStatus(newsId, newsbean.getStatus() - 1);
			}		
		}

		//後臺查詢所有訂單
		@Override
		public List<NewsOrderBean> getOrderForBB() {			
			return newsBackHaulDao.getOrderForBB();
		}

		

}
