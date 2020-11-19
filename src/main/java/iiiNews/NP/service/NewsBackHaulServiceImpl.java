package iiiNews.NP.service;

import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import iiiNews.NP.dao.NewsBackHaulDao;
@Service
@Transactional
public class NewsBackHaulServiceImpl implements NewsBackHaulService {

	@Override
	public Map getNewByTypeForBB() {
		// TODO Auto-generated method stub
		return null;
	}
//	@Autowired
//	NewsBackHaulDao newsBackHaulDao;
//
//	@Override
//	public Map getNewByTypeForBB() {
//		
//		return ;
//	}

}
