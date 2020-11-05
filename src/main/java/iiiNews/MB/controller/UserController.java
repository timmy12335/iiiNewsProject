package iiiNews.MB.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import iiiNews.MB.model.MBBean;

@Controller
public class UserController {

   @RequestMapping(value = "/password", method = RequestMethod.GET)
   public ModelAndView student() {
      return new ModelAndView("/MB/password", "command", new MBBean());
   }

   @RequestMapping(value = "/addUser", method = RequestMethod.POST)
   public String addUser(@ModelAttribute("SpringWeb")MBBean user, 
   ModelMap model) {
       System.out.println(user.getSex());
       System.out.println(user.getName());
      model.addAttribute("memberId", user.getMemberId());
      model.addAttribute("phone", user.getPhone());
      model.addAttribute("email", user.getEmail());
      model.addAttribute("password", user.getPassword());
      model.addAttribute("name", user.getName());
      model.addAttribute("repassword", user.getOkPassword());
      model.addAttribute("sex", user.getSex());
      model.addAttribute("identityId", user.getIdentityId());
      model.addAttribute("birthday", user.getBirthday());
      model.addAttribute("mbpoints", user.getMbpoints());
      

      return "UserList";
   }
}