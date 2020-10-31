package CR.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import CR.model.CRBean;
import CR.service.CR_service;

@Controller
public class CR_Controller {
	@Autowired
	ServletContext ctx;
	@Autowired
	CR_service service;
	
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
	public String processAddNewReportForm(@ModelAttribute("crBean") CRBean cb) { 
		
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
	
	@PatchMapping("/crReport/{pk}")
	public @ResponseBody Map<String, String> updateReportByPk(@RequestBody CRBean report,@PathVariable Integer pk){
		Map<String, String> map = new HashMap<>();	
		CRBean cb0 = null;
		if(pk != null) {
			cb0 = service.getReportById(pk);
			service.evictReport(cb0);
		}
		
		try{
			service.updateReport(report);
			map.put("success","修改完成");
		}catch(Exception e) {
			map.put("fail","修改失敗");
		}
		return map;
		}
	


	
	
}
