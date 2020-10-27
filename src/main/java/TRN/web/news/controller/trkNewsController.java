package TRN.web.news.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import TRN.web.news.model.trkNewsBean;
import TRN.web.news.service.trkNewsService;

@Controller
public class trkNewsController {

	trkNewsService service;

	@Autowired
	public void setService(trkNewsService service) {
		this.service = service;
	}

	@GetMapping("/trkNews")
	public String list(Model model) {
		List<trkNewsBean> list = service.getAllProducts();
		model.addAttribute("trkNews", list);
		return "TRN/trkNews";
	}

}
