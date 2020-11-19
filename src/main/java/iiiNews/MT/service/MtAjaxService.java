package iiiNews.MT.service;

import java.util.List;

import iiiNews.MT.model.MtAddBean;

public interface MtAjaxService {

	// 使用AJAX顯示新聞頁面，會員專區
	public int getTotalPages();
	public List<MtAddBean> getPageComment(Integer pageComNo);
	
	public List<MtAddBean> getAllArtWord(String searchWord);		//模糊搜尋標題

}
