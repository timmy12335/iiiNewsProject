package CR.controller;

import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import CR.model.CRBean;
import CR.service.CR_service;
import iiiNews.MB.model.MBBean;


@Controller
public class CR_Controller {
	@Autowired
	ServletContext ctx;
	@Autowired
	CR_service service;
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
	
	
	@GetMapping("/customerReports")
	public String list(Model model) {
	List<CRBean> beans = service.getRecord();
		model.addAttribute("CrReport",beans);
		return "CR/CrReport";
	}
	
	
	@GetMapping("/crReport/{pk}")
	public String getReportByPk(@PathVariable Integer pk, Model model) {
		CRBean cb = service.getReportById(pk);
		model.addAttribute("report", cb);
		return "CR/Report";
	}
	
	@GetMapping("/addReport")
	public String getAddNewReportForm(Model model) {
		CRBean cb = new CRBean();
		model.addAttribute("crBean", cb);
		return "CR/CrAddReport";
	}
	
	@PostMapping("/addReport")
	public String processAddNewReportForm(@ModelAttribute("crBean") CRBean cb) { //bindingResult表單綁定
		MBBean mb = service.getMemberById(cb.getMemberId());

		MultipartFile images = cb.getImage();
		if(images.isEmpty()) {
			System.out.println("無法找到圖片");
		}else {
			cb.setAttachmentName(images.getOriginalFilename());
		}
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
		MimeMessage msg = mailSender.createMimeMessage();
		try {
			MimeMessageHelper email = new MimeMessageHelper(msg,true,"utf-8");
			email.setTo(mb.getEmail());
			email.setSubject("客服表單申請成功通知信");
			String text = "<h2>客服申請</h2><p>感謝您使用iiiNews專業新聞網站客服系統，以下是您申請的內容:<p><br>"
					+ "<table><tr><td>客服類別:"+cb.getCrClass()+"</td></tr><tr><td>客服標題:"+
							cb.getCrTitle()+"</td></tr><tr><td>客服內容:"+cb.getCrContent()+
							"</td></tr></table><br><p>感謝您的申請，我們將會盡快回覆您";
			email.setText(text,true);
			email.addAttachment(cb.getAttachmentName(), cb.getImage());
			mailSender.send(msg);
		} catch (MessagingException e) {
			
			e.printStackTrace();
		}
		service.addReport(cb);
	    return "redirect:/customerReports";
	}
	
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
