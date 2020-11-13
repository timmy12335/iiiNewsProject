package iiiNews.MT.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iiiNews.MT.dao.MtAddDao;
import iiiNews.MT.model.MtAddBean;
import iiiNews.MT.service.MtAddService;

@Service
public class MtAddServiceImpl implements MtAddService {

	@Autowired
	MtAddDao dao;

	public MtAddServiceImpl() {
	}

	@Override
	@Transactional
	public int saveMtAddService(MtAddBean mtAddBean) { // 存mtAddBean資料，對應saveMtAddDao
		int n = 0;
		dao.saveMtAddDao(mtAddBean);
		n++;
		return n;
	}

	@Override
	@Transactional
	public MtAddBean getLastRecord() { // 取一筆資料至新增成功頁面
		return dao.getLastRecord();
	}

	@Override
	@Transactional
	public MtAddBean getArticleById(String articleId) { // 抓到文章ID之後取出圖片
		return dao.getArticleById(articleId);
	}

	@Override
	@Transactional
	public MtAddBean deleteArticle(Integer pkey) { // 未完成******
		return dao.deleteArticle(pkey);
	}

	@Override
	@Transactional
	public MtAddBean getpkey(int pkey) {
		return dao.getpkey(pkey);
	}

	@Override
	@Transactional
	public void delete(Integer pkey) { // 刪除文章
		dao.delete(pkey);
	}

	@Override
	@Transactional
	public void update(MtAddBean mtAddBean) { // 更新文章資訊
		dao.update(mtAddBean);
	}

	// --------------------------------------------------------------
	@Override
	@Transactional
	public List<MtAddBean> getAllMtAdd() { // 取所有mtAddBean資料，對應getAllMtAdd
		return dao.getAllMtAdd();
	}

	@Override
	@Transactional
	public void modifyArticle(MtAddBean ModArt) {
		 dao.modifyArticle(ModArt);
	}

	@Override
	@Transactional
	public MtAddBean getSingleArticle(String articleId) { // 查詢單一文章
		return dao.getSingleArticle(articleId);
	}

	@Override
	@Transactional
	public List<MtAddBean> getMemArticle(String memberId) { // 查詢單一會員的文章列表
		return dao.getMemArticle(memberId);
	}

	@Override
	@Transactional
	public void delSingleArticle(String articleId) { // 刪除文章，改狀態
		MtAddBean bean = dao.getSingleArticle(articleId);
		if (bean.getStatus() != null && bean.getStatus() > 0) {
			dao.updateStatus(articleId, bean.getStatus() - 1);
		}
	}

//	@Override		//抓pkey
//	@Transactional
//	public List<String> getAllAddDao1() {
//		return dao.getAllAddDao1();
//	}

}
