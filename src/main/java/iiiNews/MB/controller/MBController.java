package iiiNews.MB.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import iiiNews.MB.model.MBBean;
import iiiNews.MB.service.MBService;

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
}