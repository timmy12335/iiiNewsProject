package iiiNews.MB.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import iiiNews.MB.model.CpLoginBean;
import iiiNews.MB.model.CpMemberBean;
import iiiNews.MB.service.CPMBService;
import iiiNews.MB.validate.LoginBeanValidator;
import iiiNews.MB.validate.UserCpBeanValidator;

@Controller
@SessionAttributes("CpMemberBean")
public class CPMBController {
	@Autowired
	ServletContext ctx;
	@Autowired
	CPMBService service;

	@RequestMapping(value = "/CpLoginMB", method = RequestMethod.GET)
	public String cplogin() {
		return new String("/MB/CpLoginMB");
	}

	@RequestMapping(value = "/UserCPMB", method = RequestMethod.GET)
	public String usercpmb() {
		return new String("/MB/UserCPMB");
	}

	@RequestMapping(value = "/CpMember", method = RequestMethod.GET)
	public ModelAndView cpstudent() {
		return new ModelAndView("/MB/CpMember", "command_CP", new CpMemberBean());
	}

//	@RequestMapping(value = "/CpMember", method = RequestMethod.POST)
//	public String addcpuser(@ModelAttribute("command_CP") CpMemberBean cpuser, Model model) {
//		service.addCpMember(cpuser);
//       System.out.println(user.getSex());
//       System.out.println(user.getName());
//      model.addAttribute("memberId", user.getMemberId());
//      model.addAttribute("phone", user.getPhone());
//      model.addAttribute("email", user.getEmail());
//      model.addAttribute("password", user.getPassword());
//      model.addAttribute("name", user.getName());
//      model.addAttribute("repassword", user.getOkPassword());
//      model.addAttribute("sex", user.getSex());
//      model.addAttribute("identityId", user.getIdentityId());
//      model.addAttribute("birthday", user.getBirthday());
//      model.addAttribute("mbpoints", user.getMbpoints());
//      
//		model.addAttribute("cpmb", cpuser);
//		return "/MB/UserListCP";
//	}

	@PostMapping("/CpMember")
	public String addcpuser(@ModelAttribute("command_CP") CpMemberBean cpmb, Model model, BindingResult result) {

		UserCpBeanValidator validator = new UserCpBeanValidator();

		validator.validate(cpmb, result);
		if (service.idcpExists(cpmb.getCpmemberId())) {
			result.rejectValue("cpmemberId", "", "*帳號已存在，請重新輸入");
			return "MB/CpMember";
		}
		service.addCpMember(cpmb);
		model.addAttribute("cpmb", cpmb);
		return "MB/UserListCP";
	}

	@GetMapping("/CpLogin")
	public String CpLoginContext(HttpServletRequest request, Model model,
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
		CpLoginBean lb = new CpLoginBean(user, password, rm);
		model.addAttribute("CpLoginBean", lb);

		return "MB/CpLogin";
	}

	@PostMapping("/CpLogin")
	public String CpLoginContextCheck(@ModelAttribute("CpLoginBean") CpLoginBean lb, Model model, BindingResult result,
			HttpServletRequest request, HttpServletResponse response) {

		CpMemberBean mmm = service.cplogin(lb.getUserId(), lb.getPassword());

		LoginBeanValidator validator = new LoginBeanValidator();
		validator.validate(lb, result);
		if (result.hasErrors()) {

			return "MB/CpLogin";
		} else if (mmm == null) {
			result.rejectValue("invalidCredentials", "", "*該帳號不存在或密碼錯誤");
			return "MB/CpLogin";
		} else {
			model.addAttribute("CpMemberBean", mmm);
			mmm = (CpMemberBean) model.getAttribute("CpMemberBean");
			if (mmm.getPassword2().equals("1234")) {
				processCookies(lb, request, response);
				return "redirect:/updatee/" + mmm.getCpmemberId() + "";
			} else if (mmm.getPassword2().equals("@8M75K")) {
				return "redirect:/updatepasswd/" + mmm.getCpmemberId() + "";
			} else {
				processCookies(lb, request, response);
				return "redirect:/";
			}
		}
	}

	private void processCookies(CpLoginBean bean, HttpServletRequest request, HttpServletResponse response) {
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

	@GetMapping("/Cplogout")
	// @ModelAttribute("LoginOK") MemberBean memberBean,
	public String logout(HttpSession session, Model model, SessionStatus status, HttpServletRequest req) {
		String name = "";
		CpMemberBean mbbean = (CpMemberBean) session.getAttribute("LoginOK");
		if (mbbean != null) {
			name = mbbean.getCpname();
		}
		model.addAttribute("memberName", name);
		status.setComplete();
		session.invalidate();
		return "redirect: " + req.getContextPath();
	}
	
	@GetMapping("/showCpAllMembers")
	public String list(Model model) {
		model.addAttribute("cpmembers", service.getAllMembers());
		return "MB/CpAllmember";
	}
}