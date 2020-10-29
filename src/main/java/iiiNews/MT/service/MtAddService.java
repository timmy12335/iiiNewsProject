package iiiNews.MT.service;

import java.util.List;

import iiiNews.MT.model.MtAddBean;

public interface MtAddService {

	public int saveMtAddService(MtAddBean mtAddBean);
	
	public List<MtAddBean> getAllMtService();
	
	public MtAddBean getLastRecord() ;
	
	public List<String> getAllAddDao1();	//抓pkey
}
