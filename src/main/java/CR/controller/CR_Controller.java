package CR.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
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

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Constants;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import CR.service.CR_empService;
import CR.service.CR_service;
import CR.validation.CRaddValidator;
import iiiNews.MB.model.CpMemberBean;
import iiiNews.MB.model.MBBean;

@Controller
@SessionAttributes({ "MBBean", "CpMemberBean" })
public class CR_Controller {
	@Autowired
	ServletContext ctx;
	@Autowired
	CR_service service;
	@Autowired
	CR_empService empService;
	@Autowired
	JavaMailSender mailSender;

//	@GetMapping("/sendmail")
//	public String email(Model model) {
//		return "CR/sendEmail";
//	}

	@GetMapping("/CRindex")
	public String showlist(Model model) {
		return "CR/CRindex";
	}

	// 取全部客服資料
	@GetMapping("/customerReports")
	public String list(Model model, HttpServletRequest request, HttpServletResponse response) {
		List<CRBean> beans = service.getRecord();
		model.addAttribute("CrReport", beans);
		return "CR/CrReport";
	}

	// 依客服單編號取得
	@GetMapping("/crReport/{pk}")
	public String getReportByPk(@PathVariable Integer pk, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		CRBean cb = service.getReportById(pk);
		model.addAttribute("report", cb);
		return "CR/Report";
	}

	// 會員申請客服表單
	// 給空白表單的方法
	@GetMapping("/addReport")
	public String getAddNewReportForm(Model model, HttpServletRequest request, HttpServletResponse response) {
		MBBean memberBean = (MBBean) model.getAttribute("MBBean");
		CpMemberBean cpmemberBean = (CpMemberBean) model.getAttribute("CpMemberBean");
		if (memberBean == null) {
			if (cpmemberBean == null) {
				return "redirect: " + ctx.getContextPath() + "/LoginMB";
			}
		}

		HttpSession session = request.getSession(false);
		if (session == null) {
			return "redirect: " + ctx.getContextPath() + "/Login";
		}
		CRBean cb = new CRBean();
		model.addAttribute("crBean", cb);
		return "CR/CrAddReport";
	}

	// 會員申請客服表單送出並寄信
	@PostMapping("/addReport")
	public String processAddNewReportForm(@ModelAttribute("crBean") CRBean cb, Model model, BindingResult bindingResult,
			HttpServletRequest request, HttpServletResponse response) { // bindingResult表單綁定
		CpMemberBean cpmb = null;
		MBBean mb = null;
		// 通過會員編號取得會員資料
		MBBean memberBean = (MBBean) model.getAttribute("MBBean");
		CpMemberBean cpmemberBean = (CpMemberBean) model.getAttribute("CpMemberBean");
		if (memberBean == null) {
			if (cpmemberBean == null) {
				return "redirect: " + ctx.getContextPath() + "/Login";
			}
			cpmb = service.getCpMembersByMemberId(cpmemberBean.getCpmemberId());
		} else {
			mb = service.getMembersByMemberId(memberBean.getMemberId());
		}

		// 確認欄位
		new CRaddValidator().validate(cb, bindingResult);
		if (bindingResult.hasErrors()) {
			return "CR/CrAddReport";
		}
		// 取附件的圖片
		MultipartFile images = cb.getImage();
		// 判斷有無附件圖片
		if (images.isEmpty()) {
			System.out.println("無法找到圖片");
		} else {
			// 取檔案名
			cb.setAttachmentName(images.getOriginalFilename());
		}
		// 處理圖片
		if (images != null && !images.isEmpty()) {
			try {
				byte[] bb = images.getBytes();
				Blob blob = new SerialBlob(bb);
				cb.setAttachment(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		// 寄信確認
		MimeMessage msg = mailSender.createMimeMessage();
		try {
			MimeMessageHelper email = new MimeMessageHelper(msg, true, "utf-8");
			if (mb != null) {
				email.setTo(mb.getEmail());
			} else if (cpmb != null) {				
				email.setTo(cpmb.getCpemail());
			} else {
				email.setTo("eeit2020119@gmail.com");
			};
			email.setSubject("iiiNews客服表單申請成功通知信");
			String text = "<h2>客服申請</h2><p>感謝您使用iiiNews專業新聞網站客服系統，以下是您申請的內容:<p><br>" + "<table><tr><td>客服類別:"
					+ cb.getCrClass() + "</td></tr><tr><td>客服標題:" + cb.getCrTitle() + "</td></tr><tr><td>客服內容:"
					+ cb.getCrContent() + "</td></tr></table><br><p>感謝您的申請，我們將會盡快回覆您</p>";
			email.setText(text, true);
			// 有圖才寄附件
			if (images != null && !images.isEmpty()) {
				email.addAttachment(cb.getAttachmentName(), cb.getImage());
			}
			mailSender.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		if (memberBean == null) {
			if (cpmemberBean == null) {
				return "redirect: " + ctx.getContextPath() + "/Login";
			}
			service.addcpReport(cb);
		} else {
			service.addReport(cb);
		}

		return "redirect:/success";
	}

	// 成功後跳轉其會員以申請表單畫面
	@GetMapping("/success")
	public String successjsp(Model model, HttpServletRequest request, HttpServletResponse response) {
		MBBean memberBean = (MBBean) model.getAttribute("MBBean");
		CpMemberBean cpmemberBean = (CpMemberBean) model.getAttribute("CpMemberBean");
		List<CRBean> cb = null;
		if (memberBean == null) {
			if (cpmemberBean == null) {
				return "redirect: " + ctx.getContextPath() + "/Login";
			}
			cb = service.getReportBycpmemberId(cpmemberBean.getCpmemberId());
		} else {
			cb = service.getReportBymemberId(memberBean.getMemberId());
		}

		HttpSession session = request.getSession(false);
		if (session == null) {
			return "redirect: " + ctx.getContextPath() + "/Login";
		}

		model.addAttribute("CrReport", cb);
		return "CR/CrReportforMB";
	}

	// 依客服單編號刪除
	@DeleteMapping("/customerReports/{pk}")
	public @ResponseBody Map<String, String> deleteReportByPk(@PathVariable Integer pk) {
		Map<String, String> map = new HashMap<>();
		try {
			service.deleteReprotByPk(pk);
			map.put("success", "刪除成功");
		} catch (Exception e) {
			map.put("fail", "刪除失敗");
		}
		return map;

	}

	// 依客服單編號修改
	@PatchMapping(value = "/crReport/{pk}", consumes = { "application/json" }, produces = { "application/json" })
	public @ResponseBody Map<String, String> updateReportByPk(@RequestBody CRBean cb, @PathVariable Integer pk) {
		Map<String, String> map = new HashMap<>();
		CRBean cb0 = null;
		cb0 = service.getReportById(pk);
		cb0.setCrReContent(cb.getCrReContent());
		Timestamp today = new Timestamp(System.currentTimeMillis());
		cb0.setCrReDate(today);
		try {
			service.updateReport(cb0);
			map.put("success", "修改完成");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("fail", "修改失敗");
		}
		return map;
	}
	// 取未被更新的資料
//	private void copyUnupdateField(CRBean cb0, CRBean cb) {
//		cb.setMemberId(cb0.getMemberId());
//		cb.setPk(cb0.getPk());
//		cb.setCrApplyDate(cb0.getCrApplyDate());
//		
//		cb.setAttachment(cb0.getAttachment());
//		cb.setAttachmentName(cb0.getAttachmentName());
//		cb.setState(cb0.getState());
//		cb.setCremployee(cb0.getCremployee());
//		cb.setMbBean(cb0.getMbBean());
//		cb.setCpBean(cb0.getCpBean());
//		Timestamp today=new Timestamp(System.currentTimeMillis());
//		cb.setCrReDate(today);
//	}	

	@GetMapping(value = "/getCRimg/{pk}")
	public ResponseEntity<byte[]> getPicture(@PathVariable Integer pk) throws Exception {
		ResponseEntity<byte[]> re = null;
		InputStream is = null;
		String mimeType = null;
		CRBean bean = service.getReportById(pk);
		if (bean != null) {
			Blob blob = bean.getAttachment();
			if (blob != null) {
				is = blob.getBinaryStream();
				mimeType = ctx.getMimeType(bean.getAttachmentName());
			}
		}
		if (is == null) {
			is = ctx.getResourceAsStream("/img/NO_IMAGE.png");
			mimeType = ctx.getMimeType("NO_IMAGE.png");
		}
		MediaType mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] b = new byte[81920];
		int len = 0;
		while ((len = is.read(b)) != -1) {
			baos.write(b, 0, len);
		}
		byte[] content = baos.toByteArray();
//re = new ResponseEntity<byte[]>(content, HttpStatus.OK);
		re = new ResponseEntity<byte[]>(content, headers, HttpStatus.OK);
		return re;
	}
	
	//下載圖片
	@GetMapping(value = "/downloadCRimg/{pk}")
	public void downloadPic(@PathVariable Integer pk, HttpServletResponse response) throws Exception {
		InputStream is = null;
		OutputStream os = null;
		String mimeType = null;
		CRBean bean = service.getReportById(pk);
		if (bean != null) {
			Blob blob = bean.getAttachment();
			if (blob != null) {
				is = blob.getBinaryStream();
				mimeType = ctx.getMimeType(bean.getAttachmentName());
			}
		}
		
		MediaType mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		response.setHeader("Content-Disposition", "attachment;fileName="+bean.getAttachmentName());
		try {
		byte[] b = new byte[81920];
		int len = 0;
		os =response.getOutputStream();
		while ((len = is.read(b)) != -1) {
			os.write(b, 0, len);
		}
		os.flush();
		}finally {
			if(os!=null) {
				try {
					os.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	
	//將分數傳入並進行修改
	@PostMapping(value="/scoreNum/{pk}" , consumes = { "application/json" }, produces = { "application/json" })
	public Map<String, String> updateScoreByPk(@RequestBody CRBean cb, @PathVariable Integer pk ){
		Map<String, String> map = new HashMap<>();
		CRBean cb0 = null;
		cb0 = service.getReportById(pk);
		cb0.setCrReScore(cb.getCrReScore());
		try {
			service.updateReport(cb0);
			map.put("success", "評分成功");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("fail", "評分系統出錯，暫時無法處理評分。");
		}
		return map;
		
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
