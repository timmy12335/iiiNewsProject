package iiiNews.MT.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


import iiiNews.MT.model.MtAddBean;
import iiiNews.MT.service.MtAddService;

@Controller
public class MtAddController {

	@Autowired
	MtAddService service;

	@GetMapping("/MtCreate")
	public String toCreateForm(Model model, HttpSession session) {
		MtAddBean bean = new MtAddBean();
		List<String> list1 = service.getAllAddDao1();
		Integer a = Integer.valueOf(list1.size());
		bean.setPkey(a+1);
//		MtAddBean bean = (MtAddBean) session.getAttribute("MtAddBean");
//		bean.setCategory("惡搞");
//		bean.setTitle("今晚吃啥");
//		bean.setImgLink(null);
		bean.setVideoLink("https://www.youtube.com/watch?v=n-hy9MswmcA");
//		bean.setArticle("HELLO,HELLO,小名");

		model.addAttribute("mtBean", bean);

		System.out.println("*******************************************");
		return "MT/Create";
	}

	@PostMapping("/MtCreate")
	public String CreateForm(@ModelAttribute("mtBean") MtAddBean bean, Model model) {

		Map<String, String> map = new HashMap<>();
//		bean.setArticleId("100-20-1025-144830-001");
		Timestamp uploadDate = new Timestamp(System.currentTimeMillis());
		bean.setUpdateDate(uploadDate);
		bean.setMemberId(987);
		bean.setArticleStatus("已上架");
		
		//---------------------------------------------------
		/*處理廣告編號問題
		 * 編號命名方式 AD+日期+編號 AD2020102500001
		 * 取得最後一筆編號資料進行判斷
		 * 如果不是今天日期 代表今天沒資料 則是今天日期然後編號是00001
		 * 如果有今天日期 則後面數字加一*/
		
		String str = null;
		java.util.Date now = new java.util.Date();
		//取得最後一筆的編號資料
		MtAddBean lastRecord = service.getLastRecord();
		String lastRecordNo = bean.getArticleId();
		String lastRecordNoDate = null;
		//設定時間格式	取得現在時間	將時間轉成想要的格式並設為Date型態以供比對
		SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMdd");
//		SimpleDateFormat ft2 = new SimpleDateFormat ("yyyy-MM-dd");
		
		if(lastRecord == null) {
			str = "MT"+ft.format(now)+"00001";
		}else {
			lastRecordNo = lastRecord.getArticleId();
			lastRecordNoDate = lastRecordNo.substring(2,10);
			
			str = "MT"+ft.format(now);
			
			//用字串的方式進行比較
			if(ft.format(now).equals(lastRecordNoDate)) {
				str += String.format("%05d",(Integer.parseInt(lastRecordNo.substring(10))+1));
			}else {
				str = "MT"+ft.format(now)+"00001";
			}
			System.out.println(str);
			
		}
		bean.setArticleId(str);
		

		//---------------------------------------------------

		int n = service.saveMtAddService(bean);
		map.put("addStatus", "新增成功筆數："+n);
		model.mergeAttributes(map);
		
		System.out.println("成功筆數----" + n);
		System.out.println(bean.getArticleId());
		System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
		return "redirect:/getMtCreate";
	}

	@GetMapping("/getMtCreate")
	public String getMtCreate(Model model) {
//		List<MtAddBean> list = service.getLastRecord();
		MtAddBean mtAddBean = service.getLastRecord();
		model.addAttribute("mtbean", mtAddBean);
		System.out.println("--------------------------------------------");
		return "MT/showCreate";
	}

}
