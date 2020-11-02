package iiiNews.MT.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import iiiNews.MT.model.MtAddBean;
import iiiNews.MT.service.MtAddService;

@Controller
public class MtAddController {

	@Autowired
	MtAddService service;
	@Autowired
	ServletContext servletContext;
	
	@GetMapping("/MtCreate")
	public String toCreateForm(Model model) {		//載入新增欄位頁面getBean
		MtAddBean bean = new MtAddBean();
		model.addAttribute("mtBean", bean);
		System.out.println("*******************************************");
		return "MT/Create";
	}

	@PostMapping("/MtCreate")		//新增欄位頁面
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

		String str = null;					//文章序號規則
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
		MultipartFile Image = bean.getImage();				//把圖片塞進資料庫
		System.out.println(Image);

		if (Image.isEmpty()) {
			System.out.println("無法找到圖片");
		} else {
			bean.setImgName(Image.getOriginalFilename());
		}
		// ******************************************
		if (Image != null && !Image.isEmpty()) { 		//兩種寫法
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
		bean.setStatus(1);
		int n = service.saveMtAddService(bean);
		System.out.println("成功筆數----" + n);
		System.out.println(bean.getArticleId());
		System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
//		model.addAttribute("mtBean", bean);
//		return "/MT/showCreate";
		return "redirect:/getSingleArticle/" + str;
	}

	// +++++++++++++++++++++++++++++++++++++++++++++++++++
	@GetMapping("/getMtCreate/{articleId}")						//取圖片至新增成功頁面
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

	
//	@GetMapping(value="/getAllMtAdd/{articleId}")		//刪除，未完成*******
//	public String deleteArticle(@PathVariable Integer pkey,
//			RedirectAttributes redirectAttributes
//		) {
//		service.deleteArticle(pkey);
////		redirectAttributes.addFlashAttribute("SUCCESS", "刪除成功!!!");
//		return "redirect:" + "/getAllMtAdd";
//	}
	
	@RequestMapping("/getAllMtAdd/Del/{id}")		//刪除文章，OK，直接從DB刪除不留資料
	public String delete(@ModelAttribute("mtBean") MtAddBean bean, @PathVariable("id") Integer id) {
		bean.setPkey(id);
		service.delete(id);
		return "redirect:/getAllMtAdd";
	}
	//--------------------------------------------------
	
	
	@GetMapping("/getAllMtAdd")			//查詢所有的文章
	public String getAllMtList(Model model){	
		List<MtAddBean> list = service.getAllMtAdd();
		model.addAttribute("getAllMtList",list);
		return "MT/getAllMtAdd";
	}
		
	@GetMapping("/getSingleArticle/{articleId}")	//查詢單一文章
	public String getSingleArticle(@PathVariable String articleId ,Model model) {
		MtAddBean bean = service.getSingleArticle(articleId);
		model.addAttribute("singleArticle", bean);
		return "MT/singleArticle";
	}
	
	@GetMapping("/getMemAarticleList/{memberId}")	//查詢單一會員的文章列表
	public String  getMemAarticleList(@PathVariable String memberId ,Model model) {
		List<MtAddBean> list = service.getMemAarticle(memberId);
		model.addAttribute("memAarticleList", list);
		return "MT/memAarticleList";
	}
		
//	//下架一則新聞
//	@GetMapping("/delSingleArticle/{articleId}")	//刪除文章，改狀態
//	public String delSingleArticle(@PathVariable String articleId ,Model model) {
//		service.delSingleArticle(articleId);
//		return "redirect:/getAllMtAdd";
//	}
	
	//下架一則新聞
	@GetMapping("/delSingleArticle/{articleId}")	//刪除文章，改狀態
	public String delSingleArticle(@PathVariable String articleId ,Model model) {
		service.delSingleArticle(articleId);
		return "redirect:/getAllMtAdd";
	}
	
}
