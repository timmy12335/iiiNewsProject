package CR.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import CR.model.CRBean;
import CR.service.CR_service;

@Controller
public class CR_Searchcontroller {
	@Autowired
	ServletContext ctx;
	@Autowired
	CR_service service;
	
	//依會員編號取得客服單
//	@GetMapping("/crReportforMB/{memberId}")
//	public String getCrReportByMB(@PathVariable Integer memberId ,Model model, HttpServletRequest request, HttpServletResponse response) {
//		List<CRBean> cb = service.getRecordByMemberId(memberId);
//		model.addAttribute("CrReport", cb);
//		
//		return "CR/CrReportforMB";
//
//	}
}
