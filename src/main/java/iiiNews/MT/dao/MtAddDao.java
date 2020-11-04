package iiiNews.MT.dao;

import java.util.List;

import iiiNews.AD.model.AdOrderItemBean;
import iiiNews.MT.model.MtAddBean;

public interface MtAddDao {

	public int saveMtAddDao(MtAddBean mtAddBean);			//存mtAddBean資料，對應saveMtAddDao

	public MtAddBean getLastRecord();						//取一筆資料至新增成功頁面

	public MtAddBean getArticleById(String articleId);		//抓到文章ID之後取出圖片

	public MtAddBean deleteArticle(Integer pkey);			//未完成******

	MtAddBean getpkey(int pkey);
	void delete(Integer pkey);								//刪除文章
	void update(MtAddBean mtAddBean);							//更新文章資訊

	public List<MtAddBean> getAllMtAdd();					//取所有mtAddBean資料，對應getAllMtAdd
	public int modifyArticle(MtAddBean ModArt);				//編輯單一文章	
	
	public MtAddBean getSingleArticle(String articleId);	//查詢單一文章
	public List<MtAddBean> getMemAarticle(String memberId);	//查詢單一會員的文章列表
	void updateStatus(String articleId, int status);		//刪除文章，改狀態，對應至delSingleArticle

	
//	public List<String> getAllAddDao1();	//抓pkey
	
}
