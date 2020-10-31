package iiiNews.MT.service;

import java.util.List;

import iiiNews.MT.model.MtAddBean;

public interface MtAddService {

	public int saveMtAddService(MtAddBean mtAddBean);		//存mtAddBean資料，對應saveMtAddDao
	
	public List<MtAddBean> getAllMtAdd();					//取所有mtAddBean資料，對應getAllMtAdd
	
	public MtAddBean getLastRecord();						//取一筆資料至新增成功頁面

	public MtAddBean getArticleById(String articleId);		//抓到文章ID之後取出圖片

//	public List<String> getAllAddDao1();	//抓pkey
}
