package TRN.web.news.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import TRN.web.news.model.trkNewsBean;
import TRN.web.news.service.trkNewsService;

@Controller
public class trkNewsController {

	trkNewsService service;

	@Autowired
	public void setService(trkNewsService service) {
		this.service = service;
	}
	
	ServletContext context;       //定義圖片輸出格式

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;       //定義圖片輸出格式
	}

	@GetMapping("/trkNews")     //查詢所有資料
	public String list(Model model) {
		List<trkNewsBean> list = service.getAllProducts();
		model.addAttribute("trkNews", list);
		return "TRN/trkNews";
	}

	@RequestMapping("/queryByType")          //分類查詢 show有哪些分類
	public String gettypeList(Model model) {
		List<String>  list = service.getAlltypes();
		model.addAttribute("typeList", list);
		return "types/type";
	}

	@RequestMapping("/trkNews/{type}")      //分類查詢 show 單個分類所有新聞 
	public String getNewsBytypes(@PathVariable("type") String type, Model model){
		List<trkNewsBean> trkNews = service.getNewsBytypes(type);
		model.addAttribute("trkNews", trkNews);
		return "TRN/trkNews";
	}

	@RequestMapping("/trkNew")                       //查詢單筆產品資料
	public String getNewsById(@RequestParam("id") Integer id, Model model){ 
		model.addAttribute("trkNew", service.getNewsById(id));
		return "TRN/trkNew";
	}
//	@RequestMapping("/update/news")            //點按鈕直接更新數量
//	public String updateStock(Model model) {
//		service.updateAllStocks();
//		return "redirect:/products";
//	}
	
	@RequestMapping(value = "/trknews/add", method = RequestMethod.GET)   
	public String getAddNewsForm(Model model) {
		trkNewsBean tb = new trkNewsBean();      //取得新增產品表單欄位表格
	    model.addAttribute("trkNewsBean", tb); 
	    return "addtrkNew";
}
	@RequestMapping(value = "/trknews/add", method = RequestMethod.POST)  //新增追蹤新聞
	public String processAddNewsForm(@ModelAttribute("trkNewsBean") trkNewsBean tb) { 
		//if (tb.getStock() ==null) {                      //原是判斷庫存
		//	tb.setStock(0);
		//}
	    service.addtrkNews(tb);                         
	    return "redirect:/trkNews";	   //不用加檔案外的資料夾
	}
	@RequestMapping(value = "/trknews/delete", method = RequestMethod.POST)  //刪除追蹤新聞
	public String processDeleteNewsForm(@ModelAttribute("trkNewsBean") trkNewsBean dtb) { 
		//if (tb.getStock() ==null) {                      //原是判斷
		//	tb.setStock(0);
		//}
	    service.addtrkNews(dtb);                         
	    return "redirect:/trkNews";	   //不用加檔案外的資料夾
	}
	
//	@ModelAttribute("companyList")      //原書商種類  報導跟聲明 有外建追蹤種類 應改成取得種類或追蹤的種類
//	public Map<Integer, String> getCompanyList() {
//	    Map<Integer, String> companyMap = new HashMap<>();
//	    List<CompanyBean> list = service.getCompanyList();
//	    for (CompanyBean cb : list) {
//	        companyMap.put(cb.getId(), cb.getName());
//	    }
//	    return companyMap;
//	}
	
	@ModelAttribute("typeList")   //追蹤新聞種類
	public List<String> gettypeList() {
	    return service.getAlltypes();
	}
	@RequestMapping(value = "/getPictureTK/{trackId}", method = RequestMethod.GET) //取得圖片再顯示圖片
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp1, @PathVariable Integer trackId) {
		String filePath = "/resources/images/NoImage.jpg";

		byte[] media = null; 
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;                                           //取得圖片再顯示圖片
		trkNewsBean bean = service.getNewsById(trackId);
		if (bean != null) {
			Blob blob = bean.getCoverimage();
			filename = bean.getFilename();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	private byte[] toByteArray(String filepath) {    //陣列方式寫出圖片
		byte[] b = null;
		String realPath = context.getRealPath(filepath);   //前面已定義變數context
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
}
