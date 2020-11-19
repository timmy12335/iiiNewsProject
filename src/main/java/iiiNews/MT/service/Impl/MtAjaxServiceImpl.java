package iiiNews.MT.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iiiNews.MT.dao.MtAjaxDao;
import iiiNews.MT.model.MtAddBean;
import iiiNews.MT.service.MtAjaxService;

@Service
@Transactional
public class MtAjaxServiceImpl implements MtAjaxService {

	@Autowired
	MtAjaxDao ajaxDao;
	
	public MtAjaxServiceImpl(){
	}

	// 使用AJAX顯示新聞頁面-----------------------------------
	@Override
	public int getTotalPages() {
		return ajaxDao.getTotalPages();
	}

	@Override
	public List<MtAddBean> getPageComment(Integer pageComNo) {
		return ajaxDao.getPageComment(pageComNo);
	}

	//搜尋keyWord頁數-----------------------------------
	@Override
	public int getKeyWordPages(String searchWord) {
		return ajaxDao.getKeyWordPages(searchWord);
	}
	
	@Override
	public List<MtAddBean> getAllArtWord(String searchWord, Integer keyWordPage) {		//模糊搜尋標題
		return ajaxDao.getAllArtWord(searchWord, keyWordPage);
	}

	


	


}
