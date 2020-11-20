package iiiNews.MB.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import iiiNews.MB.SMS.SMSHttp;
import iiiNews.MB.SMS.SMSHttpValidato;
import iiiNews.MB.model.LoginBean;
import iiiNews.MB.model.MBBean;
import iiiNews.MB.service.MBService;
import iiiNews.MB.validate.ChangPasswordValidator;
import iiiNews.MB.validate.LoginBeanValidator;
import iiiNews.MB.validate.UserBeanValidator;

@Controller
@SessionAttributes("MBBean")
public class MBController {
	@Autowired
	ServletContext ctx;
	@Autowired
	MBService service;

	@RequestMapping(value = "/Forget", method = RequestMethod.GET)
	public String forget() {
		return new String("/MB/Forget");
	}

	@RequestMapping(value = "/LoginMB", method = RequestMethod.GET)
	public String login() {
		return new String("/MB/LoginMB");
	}

	@RequestMapping(value = "/UserMB", method = RequestMethod.GET)
	public String usermb() {
		return new String("/MB/UserMB");
	}

	@RequestMapping(value = "/Member", method = RequestMethod.GET)
	public ModelAndView student() {
		return new ModelAndView("/MB/Member", "command", new MBBean());
	}

//	@RequestMapping(value = "/Member", method = RequestMethod.POST)
//	public String adduser(@ModelAttribute("command") MBBean user, Model model) {
//		service.addMember(user); 
//		model.addAttribute("mb", user);
//		return "/MB/UserList";
//	}

	@PostMapping("/Member")
	public String adduser(@ModelAttribute("command") MBBean mb, Model model, BindingResult result) {

		UserBeanValidator validator = new UserBeanValidator();

		validator.validate(mb, result);
		if (service.idExists(mb.getMemberId())) {
			result.rejectValue("memberId", "", "*帳號已存在，請重新輸入");
			return "MB/Member";
		}
			service.addMember(mb);
			model.addAttribute("mb", mb);
			return "MB/UserList";
		}
	
	@GetMapping("/Member_SMS")    //簡訊
	public String sms(@ModelAttribute("SMS") MBBean mb, Model model, BindingResult result ,
			@RequestParam(value="phone")String mobile
			) {

		SMSHttp sms = new SMSHttp();
		String userID = "0976262860"; // 帳號
		String password = "mimi0127"; // 密碼
		String subject = "測試API2.1"; // 簡訊主旨，主旨不會隨著簡訊內容發送出去。用以註記本次發送之用途。可傳入空字串。
		String content = "測試測試"; // 簡訊發送內容
//		String mobile = " "; // 接收人之手機號碼。格式為: +886912345678或09123456789。多筆接收人時，請以半形逗點隔開( ,// )，如0912345678,0922333444。
		String sendTime = " "; // 簡訊預定發送時間。-立即發送：請傳入空字串。-預約發送：請傳入預計發送時間，若傳送時間小於系統接單時間，將不予傳送。格式為YYYYMMDDhhmnss；例如:預約2009/01/31
								// 15:30:00發送，則傳入20090131153000。若傳遞時間已逾現在之時間，將立即發送。	
//		SMSHttpValidato smshttp = new SMSHttpValidato();
		
		if (sms.getCredit(userID, password)) {
			System.out.println(new StringBuffer("取得餘額成功，餘額：").append(String.valueOf(sms.getCreditValue())).toString());
		} else {
			System.out.println(new StringBuffer("取得餘額失敗，失敗原因：").append(sms.getProcessMsg()).toString());
		}
		if (sms.sendSMS(userID, password, subject, content, mobile, sendTime)) {
			System.out.println(new StringBuffer("發送簡訊成功，餘額：").append(String.valueOf(sms.getCreditValue()))
					.append("，簡訊批號：").append(sms.getBatchID()).toString());
		} else {
			System.out.println(new StringBuffer("發送簡訊失敗，失敗原因：").append(sms.getProcessMsg()).toString());
		}
		return "";
	}

	@GetMapping("/Login")
	public String LoginContext(HttpServletRequest request, Model model,
			@CookieValue(value = "user", required = false) String user,
			@CookieValue(value = "password", required = false) String password,
			@CookieValue(value = "rm", required = false) Boolean rm) {
		if (user == null)
			user = "";
		if (password == null) {
			password = "";
		}
		if (rm != null) {
			rm = Boolean.valueOf(rm);
		} else {
			rm = false;
		}
		LoginBean lb = new LoginBean(user, password, rm);
		model.addAttribute("LoginBean", lb);

		return "MB/Login";
	}

	@PostMapping("/Login")
	public String LoginContextCheck(@ModelAttribute("LoginBean") LoginBean lb, Model model, BindingResult result,
			HttpServletRequest request, HttpServletResponse response) {

		MBBean mmm = service.login(lb.getUserId(), lb.getPassword());

		LoginBeanValidator validator = new LoginBeanValidator();
		validator.validate(lb, result);
		if (result.hasErrors()) {

			return "MB/Login";
		} else if (mmm == null) {
			result.rejectValue("invalidCredentials", "", "*該帳號不存在或密碼錯誤");
			return "MB/Login";
		} else {
			model.addAttribute("MBBean", mmm);
			mmm = (MBBean) model.getAttribute("MBBean");
			if (mmm.getPassword().equals("1234")) {
				processCookies(lb, request, response);
				return "redirect:/updatee/" + mmm.getMemberId() + "";
			} else if (mmm.getPassword().equals("@8M75K")) {
				return "redirect:/updatepasswd/" + mmm.getMemberId() + "";
			} else {
				processCookies(lb, request, response);
				return "redirect:/";
			}
		}
	}

	private void processCookies(LoginBean bean, HttpServletRequest request, HttpServletResponse response) {
		Cookie cookieUser = null;
		Cookie cookiePassword = null;
		Cookie cookieRememberMe = null;
		String userId = bean.getUserId();
		String password = bean.getPassword();
		Boolean rm = bean.isRememberMe();

		// rm存放瀏覽器送來之RememberMe的選項，如果使用者對RememberMe打勾，rm就不會是null
		if (rm) {
			cookieUser = new Cookie("user", userId);
			cookieUser.setMaxAge(7 * 24 * 60 * 60); // Cookie的存活期: 七天
			cookieUser.setPath(request.getContextPath());

			cookiePassword = new Cookie("password", password);
			cookiePassword.setMaxAge(7 * 24 * 60 * 60);
			cookiePassword.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(7 * 24 * 60 * 60);
			cookieRememberMe.setPath(request.getContextPath());
		} else { // 使用者沒有對 RememberMe 打勾
			cookieUser = new Cookie("user", userId);
			cookieUser.setMaxAge(0); // MaxAge==0 表示要請瀏覽器刪除此Cookie
			cookieUser.setPath(request.getContextPath());

			cookiePassword = new Cookie("password", password);
			cookiePassword.setMaxAge(0);
			cookiePassword.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(0);
			cookieRememberMe.setPath(request.getContextPath());
		}
		response.addCookie(cookieUser);
		response.addCookie(cookiePassword);
		response.addCookie(cookieRememberMe);
	}

	@RequestMapping("Loginout")
	public String getLogOut(SessionStatus status) {
		System.out.println("執行session,setComplete();");
		System.out.println("已登出");
		status.setComplete();
		return "redirect:/";
	}

//	public void Gmailsend(String email) {
//		System.out.println("email");
//		System.out.println(email);
//		String host = "smtp.gmail.com";
//		int port = 587;
//		String username = "lintest546@gmail.com";
//		String password = "0928103546";// your password
//		Properties props = new Properties();
//		props.put("mail.smtp.host", host);
//		props.put("mail.smtp.auth", "true");
//		props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.smtp.port", port);
//		Session session = Session.getInstance(props, new Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(username, password);
//			}
//		});
//		String div = "忘記密碼， 您的密碼已預設成，"+"<h2 style='color:red'>"+"@8M75K"+"</h2>"+"，請登入後修改密碼";
//		try {
//			Message message = new MimeMessage(session);
//			message.setFrom(new InternetAddress("lintest546@gmail.com"));
//			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
//			message.setSubject("忘記密碼.");
//			message.setContent(div,"text/html;charset=UTF-8");
//
//			Transport transport = session.getTransport("smtp");
//			transport.connect(host, port, username, password);
//			Transport.send(message);
//			System.out.println("HIHIHI");
//		} catch (MessagingException e) {
//			e.printStackTrace();
//			throw new RuntimeException(e);
//		}
//	}
//	
//	@GetMapping("/forgetpwd")
//	public String forgetpwd(Model model, HttpServletRequest request) {
//		ForgetBean mb1 = new ForgetBean();
//		model.addAttribute("forgot", mb1);
//		return "MB/forget";
//	}
//
//	@PostMapping("/forgetpwd")
//	public String forgotpwds(@ModelAttribute("forgot") ForgetBean mb, Model model, BindingResult result,
//			HttpServletRequest request, HttpServletResponse response) {
//		List<String> list = service.seachMemberaccount();
//		ForgetPassword validator = new ForgetPassword();
//		validator.validate(mb, result);
//
//		if (list.contains(mb.getMemberEmail())) {
//			System.out.println("有");
//			try {
//				Gmailsend(mb.getMemberEmail());
//			} catch (Exception e) {
//				e.printStackTrace();
//				return "MB/error";
//			}
//			
//			service.updatePassword(mb.getMemberEmail());
//			return "redirect:/Login";
//		} else {
//			result.rejectValue("invalidCredentials", "", "該帳號不存在");
//			return "MB/forget";
//		}
//	}
	
//	@ModelAttribute
//	public void getMember(@PathVariable(value = "id", required = false) Integer id, Model model,HttpServletRequest request, HttpServletResponse response) {
////		System.out.println("@model.getMemeber");
//		MBBean memberbean = (MBBean) model.getAttribute("MBBean");
//		if (id != null) {
//			MBBean member = service.getProductById(id);
//			model.addAttribute("member", member);
//		}
//	}
	
//	@RequestMapping(value = "/ChangePassword", method = RequestMethod.GET)
//	public String change() {
//		return new String("/MB/ChangePassword");
//	}
	
	@GetMapping("/updatepasswd/{id}")
	public String ChangePassword(@PathVariable("id") Integer id,Model model,HttpServletRequest request, HttpServletResponse response) {
		System.out.println("=============");
		System.out.println(id);
//		MBBean memberbean = (MBBean) model.getAttribute("MBBean"); 
		MBBean mb = new MBBean();
		model.addAttribute("changepwd",mb);
		return "MB/ChangePassword" ;
	}
	
	@PostMapping("/updatepasswd/{id}")
	public String ChangePasswdShow(@ModelAttribute("changepwd") MBBean mb, Model model,BindingResult result, Integer id) {
//		System.out.println(id);
		ChangPasswordValidator validator = new ChangPasswordValidator();
		validator.validate(mb, result);
		if (result.hasErrors()) {
			return "MB/ChangePassword";
		}
		boolean check;
		check = service.CheckPassword(mb.getPassword(),mb.getMemberNewPassword(), id);
		if (check == true) {
			return "redirect:/";
		}
		else {
			result.rejectValue("Password", "", "*該舊密碼不存在或密碼錯誤");
			return "MB/ChangePassword";
		}
	}
}