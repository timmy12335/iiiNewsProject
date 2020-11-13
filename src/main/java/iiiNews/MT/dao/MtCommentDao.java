package iiiNews.MT.dao;

import iiiNews.MT.model.MtCommentBean;

public interface MtCommentDao {
	
	public int saveMtCommentDao(MtCommentBean mtArtComBean);	//存mtArtComBean資料，對應saveArtComDao

	public MtCommentBean getComLastRecord();						//取一筆資料至新增成功頁面
}
