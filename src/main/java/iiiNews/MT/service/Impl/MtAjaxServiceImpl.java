package iiiNews.MT.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iiiNews.AD.model.AdOrderBean;
import iiiNews.MT.dao.MtAjaxDao;
import iiiNews.MT.model.MtAddBean;
import iiiNews.MT.service.MtAjaxService;

@Service
public class MtAjaxServiceImpl implements MtAjaxService {

	@Autowired
	MtAjaxDao ajaxDao;
	
	public MtAjaxServiceImpl(){
	}

	// 使用AJAX顯示新聞頁面-----------------------------------
	@Override
	@Transactional
	public int getTotalPages() {
		return ajaxDao.getTotalPages();
	}

	@Override
	@Transactional
	public List<MtAddBean> getPageComment(Integer pageComNo) {
		return ajaxDao.getPageComment(pageComNo);
	}
	
	@Override
	@Transactional
	public List<MtAddBean> getAllArtWord(String buyerMemberId, String adOrderNo, String orderDate) {
		return ajaxDao.getAllArtWord(buyerMemberId, adOrderNo, orderDate);
	}

	@Override
	public List<MtAddBean> getAllArtWord(String searchword, String set) {
		return ajaxDao.getAllArtWord(buyerMemberId, adOrderNo, orderDate);
	}

}
