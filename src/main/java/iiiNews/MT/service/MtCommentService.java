package iiiNews.MT.service;

import iiiNews.MT.model.MtCommentBean;

public interface MtCommentService {
	
	public int saveMtCommentService(MtCommentBean mtArtComBean);		//存mtArtComBean資料(留言)

	public MtCommentBean getComLastRecord();		//取一筆資料至新增成功頁面
	
}
