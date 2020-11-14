package CR.controller;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import CR.model.CRBean;
import CR.model.CRemployee;
import CR.service.CR_empService;
import CR.service.CR_service;
import CR.validation.CRaddValidator;
import iiiNews.MB.model.MBBean;


@Controller
@SessionAttributes({"MBBean","CpMemberBean"})
public class CR_Controller {
	@Autowired
	ServletContext ctx;
	@Autowired
	CR_service service;
	@Autowired
	CR_empService empService;
	
	@Autowired
	JavaMailSender mailSender;
	
	@GetMapping("/sendmail")
	public String email(Model model) {
		return "CR/sendEmail";
	}
	
	
	@GetMapping("/CRindex")
	public String showlist(Model model) {
		return "CR/CRindex";		
	}
	
	//取全部客服資料
	@GetMapping("/customerReports")
	public String list(Model model,HttpServletRequest request, HttpServletResponse response) {
		List<CRBean> beans = service.getRecord();
		model.addAttribute("CrReport",beans);		
		return "CR/CrReport";
	}
	
	//依客服單編號取得
	@GetMapping("/crReport/{pk}")
	public String getReportByPk(@PathVariable Integer pk, Model model,HttpServletRequest request, HttpServletResponse response) {
		CRBean cb = service.getReportById(pk);
		model.addAttribute("report", cb);
		return "CR/Report";
	}

	
	//會員申請客服表單
	//給空白表單的方法
	@GetMapping("/addReport")
	public String getAddNewReportForm(Model model,HttpServletRequest request,HttpServletResponse response) {
		MBBean memberBean = (MBBean) model.getAttribute("MBBean");
		if (memberBean == null) {
			return "redirect: " + ctx.getContextPath() + "/Login";
		}
	
		HttpSession session = request.getSession(false); 
		if (session == null) {
			return "redirect: " + ctx.getContextPath() + "/Login";
		}
		CRBean cb = new CRBean();
		model.addAttribute("crBean", cb);
		return "CR/CrAddReport";
	}
	//會員申請客服表單送出並寄信
	@PostMapping("/addReport")
	public String processAddNewReportForm(@ModelAttribute("crBean") CRBean cb,Model model, BindingResult bindingResult) { //bindingResult表單綁定
		//通過會員編號取得會員資料
		MBBean mb = service.getMembersByMemberId(cb.getMemberId());
		//確認欄位
		new CRaddValidator().validate(cb, bindingResult);
		if(bindingResult.hasErrors()) {
			return "CR/CrAddReport";
		}
		//取附件的圖片
		MultipartFile images = cb.getImage();
		//判斷有無附件圖片
		if(images.isEmpty()) {
			System.out.println("無法找到圖片");
		}else {
			//取檔案名
			cb.setAttachmentName(images.getOriginalFilename());
		}
		//處理圖片
		if(images != null && !images.isEmpty()) {
			try {
				byte[] bb = images.getBytes();
				Blob blob = new SerialBlob(bb);
				cb.setAttachment(blob);
			}catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
				//寄信確認
				MimeMessage msg = mailSender.createMimeMessage();
				try {
					MimeMessageHelper email = new MimeMessageHelper(msg,true,"utf-8");
					email.setTo(mb.getEmail());
					email.setSubject("iiiNews客服表單申請成功通知信");
					String text = "<h2>客服申請</h2><p>感謝您使用iiiNews專業新聞網站客服系統，以下是您申請的內容:<p><br>"
							+ "<table><tr><td>客服類別:"+cb.getCrClass()+"</td></tr><tr><td>客服標題:"+
									cb.getCrTitle()+"</td></tr><tr><td>客服內容:"+cb.getCrContent()+
									"</td></tr></table><br><p>感謝您的申請，我們將會盡快回覆您";
					email.setText(text,true);
					//有圖才寄附件
					if(images != null && !images.isEmpty()) {
					email.addAttachment(cb.getAttachmentName(), cb.getImage());
					}
					mailSender.send(msg);
				} catch (MessagingException e) {					
					e.printStackTrace();
				}
		service.addReport(cb);
	    return "redirect:/success/"+cb.getMemberId();
	}
	
	@GetMapping("/success/{memberId}")
	public String successjsp(@PathVariable String memberId, Model model) {
		 List<CRBean> cb = service.getReportBymemberId(memberId);
		model.addAttribute("CrReport", cb);
		
		return "CR/CrReportforMB";
	}
	
	
	
	
	//依客服單編號刪除
	@DeleteMapping("/customerReports/{pk}")
	public @ResponseBody Map<String, String> deleteReportByPk(@PathVariable Integer pk){
		Map<String, String> map = new HashMap<>();
		try {
			service.deleteReprotByPk(pk);
			map.put("success","刪除成功");
		}catch(Exception e) {
			map.put("fail","刪除失敗");
		}
		return map;
		
	}
	//依客服單編號修改
	@PatchMapping(value="/crReport/{pk}",
			consumes= {"application/json"}, produces= {"application/json"})
	public @ResponseBody Map<String, String> updateReportByPk(
			@RequestBody CRBean cb,@PathVariable Integer pk){
		Map<String, String> map = new HashMap<>();	
		CRBean cb0 = null;
		if(pk != null) {
			cb0 = service.getReportById(pk);
			service.evictReport(cb0);
		}
		copyUnupdateField(cb0,cb);
		try{
			service.updateReport(cb);
			map.put("success","修改完成");
		}catch(Exception e) {
			map.put("fail","修改失敗");
		}
		return map;
		}
	
	private void copyUnupdateField(CRBean cb0, CRBean cb) {
		cb.setMemberId(cb0.getMemberId());
		cb.setPk(cb0.getPk());
		cb.setCrApplyDate(cb0.getCrApplyDate());
		cb.setMbBean(cb0.getMbBean());
		cb.setCremployee(cb0.getCremployee());
		cb.setMbBean(cb0.getMbBean());
		Timestamp today=new Timestamp(System.currentTimeMillis());
		cb.setCrReDate(today);
	}	

//	@ModelAttribute("cb0")
//	public CRBean editCrBean(@RequestParam(value="pk", required=false) Integer pk) {
//		CRBean cb0; 
//		if(pk != null) {
//			cb0 =service.getReportById(pk);
//		}else {
//			cb0 = new CRBean();
//		}
//		
//		
//		return cb0;
//		
//	}
	
	
}
