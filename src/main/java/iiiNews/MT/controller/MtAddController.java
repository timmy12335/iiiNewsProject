package iiiNews.MT.controller;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import iiiNews.MT.dao.MtAddDao;
import iiiNews.MT.model.MtAddBean;
import iiiNews.MT.service.MtAddService;

@Controller
public class MtAddController {

	@Autowired
	MtAddService service;
	@Autowired
	ServletContext servletContext;

	@GetMapping("/MtCreate")
	public String toCreateForm(Model model, HttpSession session) {
		MtAddBean bean = new MtAddBean();
//		List<String> list1 = service.getAllAddDao1();
//		Integer a = Integer.valueOf(list1.size());
//		bean.setPkey(a+1);
//		MtAddBean bean = (MtAddBean) session.getAttribute("MtAddBean");
//		bean.setCategory("惡搞");
//		bean.setTitle("今晚吃啥");
//		bean.setImgLink(null);
//		bean.setVideoLink("https://www.youtube.com/watch?v=n-hy9MswmcA");
//		bean.setArticle("HELLO,HELLO,小名");

		model.addAttribute("mtBean", bean);
		System.out.println("*******************************************");
		return "MT/Create";
	}

	@PostMapping("/MtCreate")
	public String CreateForm(@ModelAttribute("mtBean") MtAddBean bean, Model model) {

//		Map<String, String> map = new HashMap<>();
		Timestamp uploadDate = new Timestamp(System.currentTimeMillis());
		bean.setUpdateDate(uploadDate);
//		bean.setMemberId(987);					//等會員資料串起來後修改**************
//		bean.setArticleStatus("已上架");			//等會員資料串起來後修改**************

		// ---------------------------------------------------
		/*
		 * 處理廣告編號問題 編號命名方式 AD+日期+編號 AD2020102500001 取得最後一筆編號資料進行判斷 如果不是今天日期 代表今天沒資料
		 * 則是今天日期然後編號是00001 如果有今天日期 則後面數字加一
		 */

		String str = null;
		java.util.Date now = new java.util.Date();
		// 取得最後一筆的編號資料
		MtAddBean lastRecord = service.getLastRecord();
		String lastRecordNo = null;
		String lastRecordNoDate = null;
		// 設定時間格式 取得現在時間 將時間轉成想要的格式並設為Date型態以供比對
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMdd");
		if (lastRecord == null) {
			str = "MT" + ft.format(now) + "00001";
		} else {
			lastRecordNo = lastRecord.getArticleId();
			lastRecordNoDate = lastRecordNo.substring(2, 10);
			str = "MT" + ft.format(now);
			// 用字串的方式進行比較
			if (ft.format(now).equals(lastRecordNoDate)) {
				str += String.format("%05d", (Integer.parseInt(lastRecordNo.substring(10)) + 1));
			} else {
				str = "MT" + ft.format(now) + "00001";
			}
			System.out.println("articleId--------" + str);
		}
		bean.setArticleId(str);

		// ---------------------------------------------------

		MultipartFile Image = bean.getImage();
		System.out.println(Image);

		if (Image.isEmpty()) {
			System.out.println("無法找到圖片");
		} else {
			bean.setImgName(Image.getOriginalFilename());
		}
		// ******************************************
		if (Image != null && !Image.isEmpty()) { // 兩種寫法
			try {
				byte[] b1 = Image.getBytes();
				Blob blob1 = new SerialBlob(b1);
				bean.setImgLink(blob1);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
			// ******************************************
//			MultipartFile file = bean.getImage();		//兩種寫法
//			if(Image != null && !Image.isEmpty()) {	
//			try {
//				byte[] bytes = file.getBytes();
//				Blob blob1 = new SerialBlob(bytes);
//				for(byte b : bytes){
//					bean.setImgLink(blob1);
//				}
//			}catch (Exception e) {
//				e.printStackTrace();
//			}
			// ******************************************
		}

		// ---------------------------------------------------

		int n = service.saveMtAddService(bean);
		System.out.println("成功筆數----" + n);
		System.out.println(bean.getArticleId());
		System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
//		model.addAttribute("mtBean", bean);
		return "/MT/showCreate";

	}

	// +++++++++++++++++++++++++++++++++++++++++++++++++++
	@GetMapping("/getMtCreate/{articleId}")
	public ResponseEntity<byte[]> getPicture(@PathVariable String articleId) throws Exception {
		System.out.println("articleId=" + articleId);
		ResponseEntity<byte[]> re = null;
		InputStream is = null;
		String mimeType = null;
		MtAddBean bean = service.getArticleById(articleId);
		if (bean != null) {
			Blob blob = bean.getImgLink();
			if (blob != null) {
				is = blob.getBinaryStream();
				mimeType = servletContext.getMimeType(bean.getImgName());
			}
		}
		if (is == null) {
			is = servletContext.getResourceAsStream("/img/NoImage.jpg");
			mimeType = servletContext.getMimeType("NoImage.jpg");
		}
		MediaType mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] b = new byte[81920];
		int len = 0;
		while ((len = is.read(b)) != -1) {
			baos.write(b, 0, len);
		}
		byte[] content = baos.toByteArray();
//re = new ResponseEntity<byte[]>(content, HttpStatus.OK);
		re = new ResponseEntity<byte[]>(content, headers, HttpStatus.OK);
		return re;
	}
	// +++++++++++++++++++++++++++++++++++++++++++++++++++
//	@GetMapping("/getMtCreate")
//	public String getMtCreate(Model model) {
//		
////		try {
////            InputStream in = null;
////            in = new FileInputStream(path);
////            byte[] b = new byte[in.available()];
////            in.read(b);
////            in.close();
////            gp.setPicture(b);
////
////            myDao.save(gp);
////        } catch (Exception e) {
////            e.printStackTrace();
////        }
//		
////		List<MtAddBean> list = service.getLastRecord();
//		MtAddBean mtAddBean = service.getLastRecord();
//		model.addAttribute("mtbean", mtAddBean);
//		System.out.println("--------------------------------------------");
//		return "MT/showCreate";
//	}

}
