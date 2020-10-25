package CR.controller;

import java.io.File;
import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

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
	
	
}
