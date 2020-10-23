package franktest.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import franktest.model.MemberBean;
import franktest.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	ProductService service;
	
	@GetMapping({"/products","/test1023"})
	public String list(Model model) {
//		CompanyBean cb = new CompanyBean(1,"學貫行銷股份有限公司",
//				"台北市林森南路四號六樓","http://www.xbook.com.tw/");
//		
//		BookBean bb = new BookBean(1002, "PHP&MySQL程式設計實例講座",
//				"陳惠貞",	580.0, 0.6, "bookxb002.jpg", "P832", null, 25,	"Web", cb);
//		model.addAttribute("product", bb);
		
		List<MemberBean> list = service.getRecord();
		model.addAttribute("member", list);
		return "_test/1023test";
	}
	
	
}
