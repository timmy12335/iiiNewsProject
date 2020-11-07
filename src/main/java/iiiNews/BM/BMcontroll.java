package iiiNews.BM;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BMcontroll {
	@Autowired
	ServletContext ctx;
	
	@GetMapping("/BMindex")
	public String getlogin(Model model) {
		
		return "BM/BMindex";
	}
	
	@GetMapping("/dashboard")
	public String getdashboard(Model model) {
		
		return "BM/dashboard";
	}
	
	@GetMapping("/forms")
	public String getforms(Model model) {
		
		return "BM/forms";
	}
	
	@GetMapping("/tables")
	public String gettables(Model model) {
		
		return "BM/tables";
	}
	
	@GetMapping("/iiiNewsIndex")
	public String getindex(Model model) {
		
		return "index";
	}
	
	
}
