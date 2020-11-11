package iiiNews.MB.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import iiiNews.MB.model.LoginBean;
import iiiNews.MB.model.MBBean;
import iiiNews.MB.service.MBService;
import iiiNews.MB.validate.LoginBeanValidator;

@Controller
public class MBController {
	@Autowired
	ServletContext ctx;
	@Autowired
	MBService service;

	@RequestMapping(value = "/UserMB", method = RequestMethod.GET)
	public String usermb() {
		return new String("/MB/UserMB");
	}

	@RequestMapping(value = "/Member", method = RequestMethod.GET)
	public ModelAndView student() {
		return new ModelAndView("/MB/Member", "command", new MBBean());
	}

	@RequestMapping(value = "/Member", method = RequestMethod.POST)
	public String adduser(@ModelAttribute("command") MBBean user, ModelMap model) {
		service.addMember(user);
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

		return "/MB/UserList";
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
				return "redirect:/updatee/"+mmm.getMemberId()+"";
			}else if(mmm.getPassword().equals("@8M75K")) {
				return "redirect:/updatepasswd/"+mmm.getMemberId()+"";
			}
			else {
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
}