package iiiNews.MB.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import iiiNews.MB.model.CpMemberBean;
import iiiNews.MB.service.CPMBService;

@Controller
public class CPMBController {
	@Autowired
	ServletContext ctx;
	@Autowired
	CPMBService service;

	@RequestMapping(value = "/UserCPMB", method = RequestMethod.GET)
	public String usercpmb() {
		return new String("/MB/UserCPMB");
	}

	@RequestMapping(value = "/CpMember", method = RequestMethod.GET)
	public ModelAndView cpstudent() {
		return new ModelAndView("/MB/CpMember", "command_CP", new CpMemberBean());
//		CpMemberBean command_Cp = new CpMemberBean();
//		model.addAttribute("command_Cp", command_Cp);
//		return "/MB/CpMember";
	}

	@RequestMapping(value = "/CpMember", method = RequestMethod.POST)
	public String addcpuser(@ModelAttribute("command_CP") CpMemberBean cpuser, ModelMap model) {
		service.addCpMember(cpuser);
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

		return "/MB/UserListCP";
	}
}