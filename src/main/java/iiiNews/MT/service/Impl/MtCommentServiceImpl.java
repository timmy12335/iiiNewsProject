package iiiNews.MT.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iiiNews.MT.dao.MtCommentDao;
import iiiNews.MT.model.MtCommentBean;
import iiiNews.MT.service.MtCommentService;

@Service
public class MtCommentServiceImpl implements MtCommentService{
	
	@Autowired
	MtCommentDao dao;
	
	public MtCommentServiceImpl(){
	}

	@Override
	@Transactional
	public int saveMtCommentService(MtCommentBean mtArtComBean) { // 存mtAddBean資料，對應saveMtAddDao
		int n = 0;
		dao.saveMtCommentDao(mtArtComBean);
		n++;
		return n;
	}
	
	@Override
	@Transactional
	public MtCommentBean getComLastRecord() { // 取一筆資料至新增成功頁面
		return dao.getComLastRecord();
	}
	
}
