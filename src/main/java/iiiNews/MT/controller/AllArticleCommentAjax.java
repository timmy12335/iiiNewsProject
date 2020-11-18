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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import iiiNews.MB.model.MBBean;
import iiiNews.MT.model.MtAddBean;
import iiiNews.MT.service.MtAddService;
import iiiNews.MT.service.MtAjaxService;
import iiiNews.MT.service.MtCommentService;

@Controller
@SessionAttributes({"MBBean"})
public class AllArticleCommentAjax {


//	@Autowired
//	MtAddService AddService;
	
//	@Autowired
//	MtCommentService ComService;
	
	@Autowired
	MtAjaxService AjaxService;
	
//	@Autowired
//	ServletContext servletContext;
	
	@GetMapping("/AllArticleComment")
	public String showAllArticleComment() {	
			return"MT/AllArticleCommentAjax";
	}
	
	@GetMapping("/allArtCom.json")
	public @ResponseBody List<MtAddBean> getAllArticleComment(
			@RequestParam(value="pageNoCom",defaultValue = "1" )Integer pageNoCom) {	
		
		List<MtAddBean> list =  AjaxService.getPageComment(pageNoCom);
		return list;
	}
	
	@GetMapping("/allArtComNo")
	public @ResponseBody Map<String, Integer> getPage(
			@RequestParam(value="pageNoCom",defaultValue = "1" )Integer pageNoCom,
			@RequestParam(value="totalPageCom", defaultValue = "1") Integer totalPageCom) {	
		
		totalPageCom = AjaxService.getTotalPages();
		
		Map<String, Integer>  map = new HashMap<>();
        map.put("totalPageCom", totalPageCom);
        map.put("currPage", pageNoCom);
		return map;
	
	}
	
	
//	@GetMapping("/AllArticleComment")			//使用者進入查看所有文章頁面，暫時OK
//	public String ArticleComment(@ModelAttribute("mtBean") MtAddBean bean, Model model, HttpSession session, HttpServletRequest request){	
//		
//		
//		MBBean mbb = (MBBean) model.getAttribute("MBBean");
//		if (mbb == null) {
//			return "redirect: " + servletContext.getContextPath() + "/Login";
//		}
//	
//		session = request.getSession(false); 
//		if (session == null) {
//			return "redirect: " + servletContext.getContextPath() + "/Login";
//		}
//		bean.setMemberId(mbb.getMemberId());
//		
//		List<MtAddBean> list = AddService.getMtAdd();//++++++++++++++++++++
//		model.addAttribute("ArticleComment",list);
//        //--------------------------手動測試才加
////        MBBean mb = new MBBean();   //手動設session
////        mb.setMemberId("9999");
////        model.addAttribute("MBBean", mb);
//        //--------------------------手動測試才加
//		System.out.println("**********" + bean.getMemberId() + "查看文章囉**********");
//		return "MT/AllArticleComment";
//	}
	
}
