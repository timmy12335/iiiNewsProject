package iiiNews.AD.controller;


import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import iiiNews.AD.model.AdBean;
import iiiNews.AD.service.AdMainService;
import iiiNews.AD.validate.AdUploadValidator;
import iiiNews.MB.model.CpMemberBean;

@Controller
@SessionAttributes({"shoppingCart","CpMemberBean"})
public class AdMainController {
	
	@Autowired
	AdMainService service;
	
	/*在此controller內的功能有
	 * 取得上傳表格、送出使用者填好的上傳表格
	 * 取得所有廣告列表
	 * 根據企業會員資料(編號)取得該會員所有廣告列表
	 * 根據pk鍵 刪除該則廣告(單則)
	 * 根據pk鍵 下架該則廣告(單則)
	 * 根據pk鍵 更新該則廣告(單則)*/
	
	
	
	
	//取得上傳表格
	@GetMapping("/uploadAds")
	public String goUploadForm(Model model) {
		/*是Get方法時進來這裡 為的是傳表格給使用者
		*使用了表單綁定的方法 SpringMVC課本262頁 有三個地方名字要一樣 取叫adBean
		*new AdBean 跟 model.addAttribute也是這件事
		*最後回傳上傳的網頁的網址*/
		
		AdBean bean = new AdBean();
		
		//先確定他有登入 且是企業會員
		CpMemberBean cpbean = (CpMemberBean) model.getAttribute("CpMemberBean");
		String cpmemberId ="";
		if(cpbean == null) {
			System.out.println("按下上傳廣告 但尚未登入企業會員 彈回到企業登入");
			return "redirect:/CpLogin";
		}else {
			System.out.println("按下上傳廣告 企業會員登入完成");
			cpmemberId = cpbean.getCpmemberId();
			System.out.println("登入的帳號是"+cpmemberId);
			model.addAttribute("showmemberId", cpmemberId);
		}
		
		/*這裡可以給初始值實際操作可以不寫
		 * bean.setAdNo("AD20201024");
		 * bean.setWidth(600.0);
		 * bean.setHeight(200.0);
		 * bean.setPrice(1000);
		 * bean.setStock(10);*/
		
		model.addAttribute("adBean",bean);
		return "AD/entMem/uploadAds";
	}
	
	
	/* 送出使用者填好的上傳表格
	 * 利用post方法傳入 並透過springMVC的Validate去檢查*/
	@PostMapping("/uploadAds")
	public String uploadAdsForm(
			@ModelAttribute("adBean") AdBean bean, Model model, BindingResult bindingResult,RedirectAttributes redirectAtt) {
		/* 是Post方法 使用者送出表格時進來這裡
		 * 讀取使用者資料跟型態轉換 這裡是透過@ModelAttribute("adBean") AdBean bean
		 * 就會傳完整的資料放在bean裡面傳進來給我們用
		 * 再填一些不是使用者輸入的資料 然後進行驗證資料 */
		
		/* 利用springMVC的Validate去檢查資料
		 * new出所寫的AdUploadValidator呼叫validate方法(Object target, Errors errors)
		 * target是放AdBean,errors就是綁定的bindingresult
		 * 如果error有錯 則彈回 並且抓出所有錯誤訊息
		 * 錯誤訊息會存在 ObjectError error中*/
		new AdUploadValidator().validate(bean, bindingResult);
		if(bindingResult.hasErrors()) {
			System.out.println("==============");
			List<ObjectError> list = bindingResult.getAllErrors();
			for(ObjectError error : list) {
				System.out.println("有錯："+error);
			}
			return "AD/entMem/uploadAds";
		}
		
		/* 先確定他有登入 且是企業會員
		 * 得到企業cpmemberId與cpname (從Attribute取)
		 * 若未登入則導回登入畫面*/
		CpMemberBean cpbean = (CpMemberBean) model.getAttribute("CpMemberBean");
		String cpmemberId ="";
		String cpname = "";
		if(cpbean == null) {
			System.out.println("送出上傳廣告 但尚未登入企業會員 彈回到企業登入");
			return "redirect:/CpLogin";
		}else {
			System.out.println("按下上傳廣告 企業會員登入完成");
			cpmemberId = cpbean.getCpmemberId();
			cpname = cpbean.getCpname();
			System.out.println("登入的帳號是"+cpmemberId+",名稱是："+cpname);
		}
		
		bean.setMemberId(cpmemberId);
		bean.setMemberName(cpname);
		
		//取得上傳時間
		Timestamp uploadDate = new Timestamp(System.currentTimeMillis());
		bean.setUploadDate(uploadDate);
		
		/* 處理廣告編號問題
		 * 編號命名方式 AD+日期+編號 AD2020102500001
		 * 取得最後一筆編號資料進行判斷*/
		String noStr = service.createAdNo();
		bean.setAdNo(noStr);
		
		//預先設定上架狀態 1為上架
		bean.setStatus(1);
		
		int n = service.saveAds(bean);
		System.out.println("成功筆數："+n);
		redirectAtt.addFlashAttribute("FlashMSG_uploadAdSuccess", "上架廣告欄位成功，新增： "+n+" 筆<br>廣告編號："+noStr);

		return "redirect:/memberAllAdsList";
	}
	
	
	/**取得所有廣告列表**/
	@GetMapping("/getAllAds")
	public String getAllAdsList(Model model){
		service.changeStatus();
		List<AdBean> list = service.getAllAds();
		model.addAttribute("adLists",list);
		return "AD/adlist/allAdsList";
	}
	
	
	/**根據企業會員資料(編號)取得該會員所有廣告列表**/
	@GetMapping("/memberAllAdsList")
	public String getMemberAdList(Model model){
		
		/* 會員資料從Attribute中取
		 * 先確定他有登入 且是企業會員
		 * 之後再傳送到getCpMemberAdList去查*/
		CpMemberBean cpbean = (CpMemberBean) model.getAttribute("CpMemberBean");
		String cpmemberId ="";
		if(cpbean == null) {
			System.out.println("企業會員想查自己的單 但尚未登入 彈回到企業登入");
			return "redirect:/CpLogin";
		}else {
			System.out.println("企業會員想查自己的單 登入完成");
			cpmemberId = cpbean.getCpmemberId();
			System.out.println("登入的帳號是"+cpmemberId);
		}

		List<AdBean> list = service.getCpMemberAdList(cpmemberId);
		model.addAttribute("CpAdLists",list);
		return "AD/entMem/memberAllAdsList";
	}

	
	
	/**根據pk鍵 刪除該則廣告(單則)**/
	//####優化：要跳轉回去時告訴使用者刪掉幾筆 目前不讓使用者刪除 由後台操作
	@GetMapping("/deleteAdProduct/{adPk}")
	public String deleteAdProductById(@PathVariable Integer adPk,Model model) {
		int n = service.deleteAdByMemberPkid(adPk);
		System.out.println("成功更動 "+n+" 筆");
		return "redirect:/backGetAdListAjax";
	}
	
	/**根據pk鍵 下架該則廣告(單則)**/
	@GetMapping("/offShelfAdProduct/{adPk}")
	public String offShelfAdProductById(@PathVariable Integer adPk,Model model) {
		int n = service.offShelfAdByMemberPkid(adPk);
		System.out.println("成功更動 "+n+" 筆");
		return "redirect:/backGetAdListAjax";
	}
	
	/**根據pk鍵 修改該則廣告(單則)**/
	/* 由商業會員來進行內容更新
	 * 去查詢AdBean後利用setter的方法
	 * 把要更新的內容寫回去之後
	 * 再將整個bean存回去*/
	@PostMapping("/updateAdProduct/{adPk}")
	public String updateAdProductById(@PathVariable Integer adPk,
									@RequestParam Double width,
									@RequestParam Double height,
									@RequestParam Integer price,
									@RequestParam Integer stock,Model model
									,RedirectAttributes redirectAtt) {
		
		AdBean ab = service.getOneAdByadPk(adPk);
		ab.setWidth(width);
		ab.setHeight(height);
		ab.setPrice(price);
		ab.setStock(stock);
		service.updateAds(ab);
		String noStr = ab.getAdNo();
		redirectAtt.addFlashAttribute("FlashMSG_updateAdSuccess", "廣告欄位資訊修改成功，<br>異動廣告編號："+noStr);
		return "redirect:/memberAllAdsList";
	}

	
	
	
}
