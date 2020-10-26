package iiiNews.AD.controller;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import iiiNews.AD.model.AdBean;
import iiiNews.AD.service.AdMainService;

@Controller
public class AdMainController {
	
	@Autowired
	AdMainService service;
	
	
	@GetMapping("/uploadAds")
	public String goUploadForm(Model model) {
		/*是Get方法時進來這裡 為的是傳表格給使用者
		*使用了表單綁定的方法 SpringMVC課本262頁 有三個地方名字要一樣 取叫adBean
		*new AdBean 跟 model.addAttribute也是這件事
		*最後回傳上傳的網頁的網址*/
		
		AdBean bean = new AdBean();
		
		//純粹是為了給初始值 可以不寫
//		bean.setAdNo("AD20201024");
//		bean.setWidth(600.0);
//		bean.setHeight(200.0);
//		bean.setAdDate(Date.valueOf("2020-10-24"));
//		bean.setPrice(1000);
//		bean.setStock(10);
		
		model.addAttribute("adBean",bean);
		return "AD/uploadAds";
	}
	
	@PostMapping("/uploadAds")
	public String uploadAdsForm(
			@ModelAttribute("adBean") AdBean bean, Model model) {
		/*是Post方法 使用者送出表格時進來這裡
		 * 讀取使用者資料跟型態轉換 這裡是透過@ModelAttribute("adBean") AdBean bean
		 * 就會傳完整的資料放在bean裡面傳進來給我們用
		 * 再填一些不是使用者輸入的資料 然後進行驗證資料 */
		
		//取得會員編號>>會員編號先寫死 未來再改
		bean.setMemberId("frank");
		
		//取得上傳時間
		Timestamp uploadDate = new Timestamp(System.currentTimeMillis());
		bean.setUploadDate(uploadDate);
		
		/*處理廣告編號問題
		 * 編號命名方式 AD+日期+編號 AD2020102500001
		 * 取得最後一筆編號資料進行判斷
		 * 如果不是今天日期 代表今天沒資料 則是今天日期然後編號是00001
		 * 如果有今天日期 則後面數字加一*/
		
		String noStr = null;
		java.util.Date dnow = new java.util.Date();
		//取得最後一筆的編號資料
		AdBean lastRecord = service.getLastRecord();
		String lastRecordNo = null;
		String lastRecordNoDate = null;
		//設定時間格式	取得現在時間	將時間轉成想要的格式並設為Date型態以供比對
		SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMdd");
//		SimpleDateFormat ft2 = new SimpleDateFormat ("yyyy-MM-dd");
		
		if(lastRecord == null) {
			noStr = "AD"+ft.format(dnow)+"00001";
		}else {
			lastRecordNo = lastRecord.getAdNo();
			lastRecordNoDate = lastRecordNo.substring(2,10);
			
			noStr = "AD"+ft.format(dnow);
			
			//用字串的方式進行比較
			if(ft.format(dnow).equals(lastRecordNoDate)) {
				noStr += String.format("%05d",(Integer.parseInt(lastRecordNo.substring(10))+1));
			}else {
				noStr = "AD"+ft.format(dnow)+"00001";
			}
			System.out.println(noStr);
			
		}
		bean.setAdNo(noStr);
		
		
		int n = service.saveAds(bean);
		System.out.println("成功筆數："+n);
		return "index";
	}
	
	
	@GetMapping("/getAllAds")
	public String getAllAdsList(Model model){
		List<AdBean> list = service.getAllAds();
		model.addAttribute("adLists",list);
		return "AD/allAdsList";
	}
	
	
	

	
	
}
