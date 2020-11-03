package iiiNews.NP.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import iiiNews.NP.model.NewsBean;
import iiiNews.NP.service.NewsProductService;

@Controller
public class NewsProductController {
	
	@Autowired
	NewsProductService service;
	@Autowired
	ServletContext servletContext;
	
	@GetMapping("/uploadNews")
	public String goUploadForm(Model model) {
		
		NewsBean nb = new NewsBean();		
		model.addAttribute("newsBean", nb);		
		return "NP/uploadNews";
	}
	//新增一則新聞
	@PostMapping("/uploadNews")
	public String uploadNewsForm(
			@ModelAttribute("newsBean")NewsBean nb		
			,Model model) {
		Timestamp uploadTime = new Timestamp(System.currentTimeMillis());
		nb.setUploadTime(uploadTime);
//		System.out.println(uploadTime);
		
		Time ti = nb.getLimitTime();	
		SimpleDateFormat stf = new SimpleDateFormat("HH:mm:ss");
		String sti = stf.format(ti);
		System.out.println(sti);
		String[] stiarr = sti.split(":");
		for(int i=0;i<stiarr.length;i++) {
			System.out.println(stiarr[i]);
		}
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		java.util.Date d = null; 
		Date date = new Date();
		String strDate = sdFormat.format(date);
		System.out.println(strDate);
		
		String[] dateAndTime=strDate.split(" ");
		String[] TimeStr=dateAndTime[1].split(":");
		for(int i=0;i<TimeStr.length;i++) {
			System.out.println(TimeStr[i]);
		}
		
		int h = Integer.valueOf(stiarr[0]) + Integer.valueOf(TimeStr[0]);
		int m = Integer.valueOf(stiarr[1]) + Integer.valueOf(TimeStr[1]);
		int s = Integer.valueOf(stiarr[2]) + Integer.valueOf(TimeStr[2]);
		String countime =dateAndTime[0]+" "+ h +":" + m + ":" + s;
		System.out.println(countime);
		System.out.println("----------------------------------------");
		try {
			d = sdFormat.parse(countime);
		} catch (ParseException e1) {			
			e1.printStackTrace();
		} 
		java.sql.Timestamp countimesql = new java.sql.Timestamp(d.getTime());
		System.out.println(countimesql);
		
		nb.setFutureTime(countimesql);
		
		System.out.println("----------------------------------------");
	
		
		MultipartFile[] productImages = nb.getProductImage();
		System.out.println(productImages);

			if(productImages[0].isEmpty()) {
				System.out.println("無法找到圖片");
			}else {
				nb.setPic_One(productImages[0].getOriginalFilename());
				nb.setPic_Two(productImages[1].getOriginalFilename());
				nb.setPic_Three(productImages[2].getOriginalFilename());
			}
			for(int i = 0;i<productImages.length;i++) {
				if(productImages[i] != null && !productImages[i].isEmpty()) {
					try {
						byte[] b1 = productImages[0].getBytes();
						byte[] b2 = productImages[1].getBytes();
						byte[] b3 = productImages[2].getBytes();
						Blob blob1 = new SerialBlob(b1);
						Blob blob2 = new SerialBlob(b2);
						Blob blob3 = new SerialBlob(b3);
						nb.setImg_I(blob1);
						nb.setImg_II(blob2);
						nb.setImg_III(blob3);						
					}catch(Exception e) {
						e.printStackTrace();
						throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
		
		String md = service.getLastRecord();
		nb.setMemberId("A0002");
		nb.setNewsId(md);
		
		nb.setStatus(1);
		service.uploadNewsForm(nb);
		return "redirect:/getMemNewsList/A0002";
	}
	

	
	@GetMapping("/getNewsPicture/{newsId}")
	public ResponseEntity<byte[]> getNewsPicture(
			@PathVariable String newsId)throws IOException, SQLException{
		ResponseEntity<byte[]> npic = null;
		
		//定義一個InputStream來判斷圖片有沒有成功的叫出來 有可能Blob是null或是這筆資料不存在等等
		InputStream is = null;
		String mimeType = null;
		//跟Service說 把我的bookId傳給你 你把BookBean傳回給我 我再從bean取出blob
		//把blob變成位元組陣列byte[]
		//檔名跟mimetype有關 要記得給瀏覽器
		NewsBean nb = service.getSingleNews(newsId);
		if(nb !=null) {
			Blob blob = nb.getImg_I();
			if(blob !=null) {
				is = blob.getBinaryStream();
				mimeType = servletContext.getMimeType(nb.getPic_One());			
			}
			
			
		}
		if(is == null) {
			is = servletContext.getResourceAsStream("/img/NoImage.jpg");
			mimeType = servletContext.getMimeType("NoImage.jpg");
		}
		//寫mimeType出去 放在標頭給出去
		//告訴瀏覽器收到這份資料要怎麼放到快取區 告訴她不要存 每次要用到都要抓最新
		MediaType mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		
		//要來轉成位元組陣列了
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] b = new byte[81920];
		int len = 0;
		while ((len = is.read(b)) != -1) {
			baos.write(b, 0, len);
		}
		byte[] content = baos.toByteArray();
		
		//要傳送請求本體 請求標頭 狀態列
		npic = new ResponseEntity<byte[]>(content, headers, HttpStatus.OK);
		return npic;
	}
	
	
	
	//查詢所有的新聞
	@GetMapping("/getAllNews")
	public String getAllNewsList(Model model) {
		List<NewsBean> list = service.getAllNews();
		model.addAttribute("newsLists", list);
		return "NP/allNewsList";
	}
	//查詢單一筆新聞
	@GetMapping("/getSingleNews/{newsId}")
	public String getSingleNews(@PathVariable String newsId ,Model model) {
		NewsBean newsBean = service.getSingleNews(newsId);
		model.addAttribute("newsSingle", newsBean);
		return "NP/singleNews";
	}
	//查詢單一會員的新聞列表
	@GetMapping("/getMemNewsList/{memberId}")
	public String  getMemNewaList(@PathVariable String memberId ,Model model) {
		List<NewsBean> list = service.getMemNews(memberId);
		model.addAttribute("memNewsList", list);
		return "NP/memNewsList";
	}
	//下架一則新聞
	@GetMapping("/delSingleNews/{newsId}")
	public String delSingleNews(@PathVariable String newsId ,Model model) {
		
		service.delSingleNews(newsId);
		return "redirect:/getMemNewsList/A0001";
	}
	@GetMapping("/showAllNewsbyPages")
	public String showbookPage() {	
			return"NP/ShowNewsByPageAjax";
		
	}
	@GetMapping("/pagingNewsData.json")
	public @ResponseBody List<NewsBean> getbookPage(
			@RequestParam(value="pageNo",defaultValue = "1" )Integer pageNo) {	
		
		List<NewsBean> list =  service.getPageNews(pageNo);
		return list;		
	}
	@GetMapping("/pagingNewsNo")
	public @ResponseBody Map<String, Integer> getPage(
			@RequestParam(value="pageNo",defaultValue = "1" )Integer pageNo,
			@RequestParam(value="totalPage", defaultValue = "1") Integer totalPage) {	
		
		totalPage = service.getTotalPages();
		
		Map<String, Integer>  map = new HashMap<>();
        map.put("totalPage", totalPage);
        map.put("currPage", pageNo);
		return map;
	
	}
	
}



