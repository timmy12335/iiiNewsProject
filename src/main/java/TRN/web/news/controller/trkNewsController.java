package TRN.web.news.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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

	@GetMapping("/trkNews")     //查詢所有資料
	public String list(Model model) {
		List<trkNewsBean> list = service.getAllProducts();
		model.addAttribute("trkNews", list);
		return "TRN/trkNews";
	}
//	@RequestMapping("/update/news")            //點按鈕直接更新數量
//	public String updateStock(Model model) {
//		service.updateAllStocks();
//		return "redirect:/products";
//	}

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
	
	@RequestMapping(value = "/trknews/add", method = RequestMethod.GET)   
	public String getAddNewsForm(Model model) {
		trkNewsBean tb = new trkNewsBean();      //取得新增產品表單欄位表格
	    model.addAttribute("trkNewsBean", tb); 
	    return "TRN/addtrkNew";   //該路徑連到顯示得jsp路徑錯誤會404
}
	@RequestMapping(value = "/trknews/add", method = RequestMethod.POST)
	public String processAddNewsForm(@ModelAttribute("trkNewsBean") trkNewsBean tb) { 
		//if (tb.getStock() ==null) {                      //原是判斷
		//	tb.setStock(0);
		//}
	    service.addtrkNews(tb);                         
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
	
	@ModelAttribute("typeList")   //追蹤新聞總類
	public List<String> gettypeList() {
	    return service.getAlltypes();
	}
}
