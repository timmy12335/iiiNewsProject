package iiiNews.MT.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import iiiNews.MB.model.MBBean;
import iiiNews.MT.model.MtAddBean;
import iiiNews.MT.service.MtAddService;
import iiiNews.MT.service.MtReportService;

@Controller
@SessionAttributes({"MBBean"})
public class backhaulController {

	@Autowired
	MtAddService service;
	
	@Autowired
	MtReportService reportService;
	
	@Autowired
	ServletContext servletContext;
	
	//改成Ajax----------------------------------------
//	@GetMapping("/getAllMtAdd")			//查詢所有的文章***後台部分
//	public String getAllMtList(Model model){	
//		List<MtAddBean> list = service.getAllMtAdd();
//		model.addAttribute("getAllMtList",list);
//        //--------------------------手動測試才加
////        MBBean mb = new MBBean();   //手動設session
////        mb.setMemberId("9999");
////        model.addAttribute("MBBean", mb);
//        //--------------------------手動測試才加
//		return "MT/getAllMtAdd2";
//	}
	//改成Ajax----------------------------------------
	
//	@GetMapping("/getSingleArticle/{articleId}")	//查詢單一文章***後台部分
//	public String getSingleArticle(@PathVariable String articleId ,Model model) {
//		MtAddBean bean = service.getSingleArticle(articleId);
//		model.addAttribute("singleArticle", bean);	//點文章編號後進入的頁面，用這兩行顯示
//		return "/MT/singleArticle";
//	}

	@GetMapping("/delSingleArticle/{articleId}")	//刪除文章，改狀態，OK***後台部分
	public String delSingleArticle(@PathVariable String articleId ,Model model) {
		service.delSingleArticle(articleId);
		return "redirect:/getAllMtAdd";
	}
	//--------------------------11/17--------------------------
	@GetMapping("/getAllMemArticle")	//載入查詢會員發文資料畫面
	public String getAllMemArticle(Model model, HttpSession session, HttpServletRequest request) {
		
//		MBBean memberBean = (MBBean) model.getAttribute("MBBean");		//登入判斷
//		if (memberBean == null) {
//			return "redirect: " + servletContext.getContextPath() + "/Login";
//		}
//	
//		session = request.getSession(false); 
//		if (session == null) {
//			return "redirect: " + servletContext.getContextPath() + "/Login";
//		}
//		List<MtAddBean> list = service.getMemArticle();
//		model.addAttribute("memArticleList", list);
		return "/MT/backhaulSearch";
	}
	
	@GetMapping("/getAllMemArticle/{memberId}")	//輸入ID後顯示文章列表
	public String getAllMemArticle(@PathVariable String memberId ,Model model) {
		List<MtAddBean> list = service.getMemArticle(memberId);
		model.addAttribute("AllMemArticle", list);
		return "/MT/backhaulAllMemArticle";
	}

	@GetMapping("/delAllMemArticle/{articleId}")	//刪除文章，改狀態，暫時OK
	public String delAllMemArticle(@PathVariable String articleId ,Model model) {
		String memberId = service.getSingleArticle(articleId).getMemberId();
		service.delSingleArticle(articleId);
		return "redirect:/getAllMemArticle/"+memberId;
	}
	//--------------------------11/17--------------------------
	//--------------------------報表--------------------------
	@GetMapping("/MtArtReport")
	public String MtArtReport() {
		return "MT/MtArtReport";
	}
		
	//將類別筆數回傳json
	@GetMapping("/getMtArtReport.json")
	public @ResponseBody Map<String, Long> getMtArtReport(){	
		System.out.println(reportService.getMtArtTotalReport());
		return reportService.getMtArtTotalReport();		 
	}
	
	@GetMapping("/getMtCateReport.json")
	public Map<String,Integer> getMtCateReport(){
		
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("未分類", reportService.getMtCateReport("未分類"));
		map.put("生活", reportService.getMtCateReport("生活"));
		map.put("娛樂", reportService.getMtCateReport("娛樂"));
		map.put("問卦", reportService.getMtCateReport("問卦"));
		map.put("美食", reportService.getMtCateReport("美食"));
		map.put("運動", reportService.getMtCateReport("運動"));
		map.put("趣味", reportService.getMtCateReport("趣味"));
		map.put("寵物", reportService.getMtCateReport("寵物"));
	
		return map;
	}
	
	
	
}
