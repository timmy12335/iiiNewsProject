package iiiNews.MT.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import iiiNews.MB.model.MBBean;
import iiiNews.MT.model.MtAddBean;
import iiiNews.MT.model.MtCommentBean;
import iiiNews.MT.service.MtAddService;
import iiiNews.MT.service.MtCommentService;
import iiiNews.MT.validate.CheckCommentVaildator;

@Controller
@SessionAttributes({"MBBean"})
public class ArticleCommentController {

	@Autowired
	MtAddService AddService;
	
	@Autowired
	MtCommentService ComService;
	
	@Autowired
	ServletContext servletContext;
	
	
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
	
//	@GetMapping("/CreateComment")				
//	public String CreateComment(Model model, HttpSession session) {		//載入新增欄位頁面getBean
//		
////		MBBean mb = (MBBean) session.getAttribute("MBBean");	//抓會員session
////      String memberId = mb.getMemberId();
//		
//		MtAddBean bean = new MtAddBean();
//		model.addAttribute("CreateComment", bean);
//		System.out.println("-------------------USER----------查看單則詳細-------------------");
////		System.out.println("*******************************************" + memberId);
//		return "MT/CreateComment";
//	}
	
	@GetMapping("/CreateComment/{articleId}")	//USER瀏覽文章，要留言了，暫時OK
	public String CreateComment(@PathVariable String articleId ,Model model, HttpServletRequest request) {
		MtAddBean bean = AddService.getSingleArticle(articleId);
		model.addAttribute("CreateComment", bean);	//點文章編號後進入的頁面，用這兩行顯示
		System.out.println("getItems====" + bean.getItems().toString());
		
		MBBean mbb = (MBBean) model.getAttribute("MBBean");
//        bean.setMemberId(mbb.getMemberId());
        
		if (mbb == null) {		//抓會員session
			return "redirect: " + servletContext.getContextPath() + "/Login";
		}
		
        if (mbb.getMemberId() == null) {		//抓會員session
			return "redirect: " + servletContext.getContextPath() + "/Login";
		}
	
		HttpSession session = request.getSession(false); 
		if (session == null) {
			return "redirect: " + servletContext.getContextPath() + "/Login";
		}
		System.out.println( "<----------" + bean.getMemberId() + "---------->");
		return "/MT/CreateComment";
		
	}

	@PostMapping("/CreateComment/{articleId}")		//新增欄位頁面
	public String CreateForm(@ModelAttribute("mtBean") MtAddBean bean,
							 @ModelAttribute("mtArtComBean") MtCommentBean mtArtComBean,
							 @PathVariable String articleId, BindingResult result, Model model) {
//		CheckCommentVaildator validator = new CheckCommentVaildator();
//        validator.validate(mtArtComBean, result);
//		String strurl = articleId;
        new CheckCommentVaildator().validate(mtArtComBean, result);
		
		if (result.hasErrors()) {
    		System.out.println("---留言不能空白---");
            return "redirect:/CreateComment/"+articleId;
//            return "/MT/CreateComment/" + articleId;
        }
//        MBBean mbb = (MBBean) model.getAttribute("MBBean");
//        bean.setMemberId(mbb.getMemberId());
//        
//        try {
//            if (mtArtComBean.getComment().isEmpty()) {
//                result.rejectValue("comment","","");
//                System.out.println("---留言不能空白---");
//                return "/CreateComment/{articleId}";
//            }
//        } catch (Exception e) {
//            System.out.println("---標題catch---");
//            e.printStackTrace();
//        }
//        //-----------------------------------------------
//        try {
//            if (bean.getArticle().isEmpty()) {
//                result.rejectValue("article","","內文不能空白");
//                System.out.println("---內文不能空白---");
//                return "MT/Create";
//            }
//        } catch (Exception e) {
//            System.out.println("---標題catch---");
//            e.printStackTrace();
//        }
        
		// ---------------------------------------------------
		MBBean mbb = (MBBean) model.getAttribute("MBBean");
		MtAddBean mtAddBean = AddService.getSingleArticle(articleId);
		mtArtComBean.setMtAddBean(mtAddBean);
		
//		mtAddBean.setComment("TESTTESTTESE");
//		System.out.println("留言留言留言留言留言留言留言留言留言留言");
		
//		mtArtComBean.setCommentId(mtAddBean.getComment());
//		System.out.println("<-----CommentId----->");
		mtArtComBean.setComMemberId(mbb.getMemberId()); //要抓登入會員ID*****未完成
		System.out.println("<-----目前登入ID-----" + mtArtComBean.getComMemberId() + "----->");
//		mtArtComBean.setCommentPkey(mtAddBean.getPkey());
//		System.out.println("<-----CommentPkey----->");
		Timestamp uploadTime = new Timestamp(System.currentTimeMillis());
		mtArtComBean.setUploadTime(uploadTime);
		System.out.println("uploadTime----->" + uploadTime);
		
		
		
		//留言
		
		
		//-----------------------------------------11/05判斷功能
//		Map<String, String> map = new HashMap<>();
//		Timestamp uploadTime = new Timestamp(System.currentTimeMillis());
//		mtArtComBean.setUploadTime(uploadTime);
//		bean.setMemberId(987);					//等會員資料串起來後修改**************
//		bean.setArticleStatus("已上架");			//等會員資料串起來後修改**************

		// ---------------------------------------------------

		/*
		 * 處理廣告編號問題 編號命名方式 AD+日期+編號 AD2020102500001 取得最後一筆編號資料進行判斷 如果不是今天日期 代表今天沒資料
		 * 則是今天日期然後編號是00001 如果有今天日期 則後面數字加一
		 */

		String str = null;					//文章序號規則
		java.util.Date now = new java.util.Date();
//		// 取得最後一筆的編號資料
		MtCommentBean lastRecord = ComService.getComLastRecord();
		String lastRecordNo = null;
		String lastRecordNoDate = null;
//		// 設定時間格式 取得現在時間 將時間轉成想要的格式並設為Date型態以供比對
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMdd");
		if (lastRecord == null) {
			str = "MT-C" + ft.format(now) + "00001";
		} else {
			lastRecordNo = lastRecord.getCommentId();
			lastRecordNoDate = lastRecordNo.substring(4, 12);
			str = "MT-C" + ft.format(now);
//			// 用字串的方式進行比較
			if (ft.format(now).equals(lastRecordNoDate)) {
				str += String.format("%05d", (Integer.parseInt(lastRecordNo.substring(12)) + 1));
			} else {
				str = "MT-C" + ft.format(now) + "00001";
			}
			System.out.println("comArticleId-------- [MT-C] ===>" + str);
		}
		mtArtComBean.setCommentId(str);

		// ---------------------------------------------------
		List<MtCommentBean> items = new ArrayList<>();
		items.add(mtArtComBean);
		mtAddBean.setItems(items);
		System.out.println(mtAddBean.getItems());
		

		// ---------------------------------------------------
//		bean.setStatus(1);
		int n = ComService.saveMtCommentService(mtArtComBean);
//		AddService.saveMtAddService(mtAddBean);
		System.out.println("-----saveMtAddBean-----");
		System.out.println("留言新增***成功筆數----" + n);
		System.out.println("CommentId-----> " + mtArtComBean.getCommentId());
		System.out.println("+++++++++++++++++新增留言成功+++++++++++++++");
//		model.addAttribute("mtBean", bean);
//		return "/MT/CreateComment";
		return "redirect:/CreateComment/{articleId}";
//		return "redirect:/getSingleArticle/" + str;	//跳轉到顯示單篇文章
	}
	
}
