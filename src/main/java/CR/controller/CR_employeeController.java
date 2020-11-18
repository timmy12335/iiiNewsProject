package CR.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import CR.model.CRemployee;
import CR.service.CR_empService;

@Controller
public class CR_employeeController {

	
	@Autowired
	ServletContext ctx;
	@Autowired
	CR_empService service;
	
	//取得全部客服人員資料
	@GetMapping("/allemployee")
	public String showempolyee(Model model,HttpServletRequest request, HttpServletResponse response) {
		List<CRemployee> cre =service.getemployee();
		model.addAttribute("cremployee", cre);
		return "CR/cremployee2";		
	}
	
	@GetMapping("/addemployee")
	public String addemp(Model model,HttpServletRequest request, HttpServletResponse response) {
		CRemployee cre = new CRemployee();
		model.addAttribute("cremployee",cre);
		return "CR/addemp";
	}
	
	@PostMapping("/addemployee")
	public String processemp(@ModelAttribute("cremployee") CRemployee cre, Model model, BindingResult bindingresult) {
		service.addemployee(cre);
		return "redirect:/allemployee";	
	}
	
	@DeleteMapping(value="/allemployee/{empPk}")
	public @ResponseBody Map<String, String> deleteByempPk(@PathVariable Integer empPk){
		Map<String, String> map = new HashMap<>();
		try {
			service.deleteemployeeByPk(empPk);
			map.put("success","刪除成功");
		}catch(Exception e) {
			map.put("fail","刪除失敗");
			e.printStackTrace();
			System.out.println("GG");
		}
		return map;
	}
	
	@PostMapping(value="/allemployee/{empPk}")
	public @ResponseBody Map<String, String> updateemployee(@RequestBody CRemployee cre){
		Map<String, String> map = new HashMap<>();
		try {
			service.updateemployee(cre);
			map.put("success","修改成功");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("fail","修改失敗");
		}
		return map;
	}
	
	@GetMapping(value="/creemployee")
	public @ResponseBody List<CRemployee> getempByState(@RequestParam(value="isstay",defaultValue="-1") Integer isstay){
		List<CRemployee> list = new ArrayList<CRemployee>();
		if(isstay==1) {
			list = service.getemployeeisstay();
		}else if(isstay==0) {
			list = service.getemployeenotstay();
		}else {
			list = service.getemployee();
		}
		return list;
	}
	
	@GetMapping(value="/getEmpByWord")
	public @ResponseBody List<CRemployee> getempByWord(@RequestParam(value="word",required=false) String empName){
		List<CRemployee> list = new ArrayList<CRemployee>();
		if(empName==null) {
			list = service.getemployee();
		}else {
			list = service.getempByName(empName);
		}
		return list;
	}
	
	@GetMapping(value="/getempByDate")
	public @ResponseBody List<CRemployee> getempByDate(@RequestParam(value="date",defaultValue="2020-01-01", required=false) Date date){
		List<CRemployee> list = new ArrayList<CRemployee>();
		if(date==null) {
			list = service.getemployee();
		}else {
			list = service.getempByDate(date);
		}
		return list;
	}
	
	@GetMapping(value="/returnemp")
	public @ResponseBody Map<String, String> returnempByPk(@RequestParam(value="pk", required=false) Integer emppk){
		Map<String, String> map = new HashMap<>();
		try {
			service.returnemployeeByPk(emppk);
			map.put("success","修改成功");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("fail","修改失敗");
		}
		return map;
		
	}
}
