package iiiNews.MT.service;

import java.util.List;

import iiiNews.MT.model.MtAddBean;

public interface MtAjaxService {

	// 使用AJAX顯示新聞頁面，會員專區
	public int getTotalPages();
	public List<MtAddBean> getPageComment(Integer pageComNo);
	
	//搜尋keyWord頁數
	public int getKeyWordPages(String searchWord);	
	public List<MtAddBean> getAllArtWord(String searchWord, Integer keyWordPage);		//模糊搜尋標題

	//後端文章總覽，標籤分類
	public List<MtAddBean> getAllMtByAjax(String set);	//set為前端網址所送的資料，如ALL
	public List<MtAddBean> getMtByCateNoAjax(Integer CateNo, String set);
	
}
