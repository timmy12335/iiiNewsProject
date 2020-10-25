package iiiNews.AD.controller;


import java.sql.Date;
import java.sql.Timestamp;
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
		AdBean bean = new AdBean();
//		bean.setAdNo("AD20201024");
		bean.setWidth(600.0);
		bean.setHeight(200.0);
		bean.setAdDate(Date.valueOf("2020-10-24"));
		bean.setPrice(1000);
		bean.setStock(10);
		
		model.addAttribute("adBean",bean);
		
		return "AD/uploadAds";
	}
	
	@PostMapping("/uploadAds")
	public String uploadAdsForm(
			@ModelAttribute("adBean") AdBean bean, Model model) {
		
		//取得會員編號>>去讀會員表格?從哪取得?
		bean.setMemberId("frank");
		bean.setAdNo("");
		
		Timestamp uploadDate = new Timestamp(System.currentTimeMillis());
		bean.setUploadDate(uploadDate);
		
//		Map<String, String> errorMsg = new HashMap<>();
//		if (bean.getCategoryNo() == null) {
//			errorMsg.put("errorCategoryNoEmpty","分類必須輸入");
//		}
//		if (bean.getWidth() == null) {
//			errorMsg.put("errorWidthEmpty","寬必須輸入");
//		}
//		if (bean.getHeight() == null) {
//			errorMsg.put("errorHeightPlaceEmpty","高必須輸入");
//		}
//		if (bean.getAdDate() == null) {
//			errorMsg.put("errorDateEmpty","日期必須輸入");
//		}
//		if (bean.getPrice() == null) {
//			errorMsg.put("errorPriceEmpty","價格必須輸入");
//		}
//		if (bean.getStock() == null) {
//			errorMsg.put("errorContextEmpty","庫存必須輸入");
//		}
		

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
