package TRN.web.news.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.transaction.Transactional.TxType;

import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.xml.fastinfoset.algorithm.BuiltInEncodingAlgorithm.WordListener;

import TRN.web.news.dao.Impl.MyHttpclient;

@Controller
public class httpController {

	
	
//	@GetMapping("/httpclient") //跳轉頁面
//	public String showEditMemberForm(Model model) {
//		//model.addAttribute("NewsId", NewsId);
//		//System.out.println("1106AA"+model.addAttribute("NewsId", NewsId));
//		return "TRN/httpclient";
//	}


//	@GetMapping("/httpclient1/{word}") // 查詢所有資料
//	public String httpclient(@PathVariable String word,Model model) {
//		System.out.println(word);
//		MyHttpclient t1 = new MyHttpclient();
//		Elements d1 =t1.httpclientData(word);
//		//String d1 = b1.get(0).text();
////		System.out.println("9999"+d1);
//		
//		System.out.println("1113------------->"+d1);
//		model.addAttribute("d1", d1);
//		return "TRN/httpclient";
//	}
//	@GetMapping("/httpclient1/{word}") // 查詢所有資料
//	public List<String> httpclient(@PathVariable String word,Model model) {
//		System.out.println(word);
//		MyHttpclient t1 = new MyHttpclient();
//		Elements d1 =t1.httpclientData(word);
//		String a1 =d1.toString() ;
//		List<String> list = Arrays.asList(a1);
//		//String d1 = b1.get(0).text();
////		System.out.println("9999"+d1);
////		String s1= d1.text();
//		System.out.println("1113------------->"+a1);
//		//model.addAttribute("d1", d1);
//		return list;
//	}
	@GetMapping("/httpclient1") // 查詢所有資料
	public @ResponseBody List<String> httpclient(
		   @RequestParam (value="word")String word) {
		System.out.println(word);
		MyHttpclient t1 = new MyHttpclient();
		Elements d1 =t1.httpclientData(word);
		String a1 =d1.toString() ;
		List<String> list = Arrays.asList(a1);
		//String d1 = b1.get(0).text();
//		System.out.println("9999"+d1);
//		String s1= d1.text();
		System.out.println("1113------------->"+list);
		//model.addAttribute("d1", d1);
		return list;
	}
	//@GetMapping("/httpclient2")
//	public @ResponseBody String httpclient3 (
//			@RequestParam(value="word")String SearchWord,Model model){
//	MyHttpclient b1 = new MyHttpclient();
//	Elements c1 = b1.httpclientData(SearchWord);
	
//	f1 = b1.httpclientData(SearchWord);
			/*@RequestParam(value="set",defaultValue = "onsale" )String set)*/ {
		
//		List<WordListener> list = new ArrayList<AdBean>();
//		list = ajaxService.getAdByWordAjax(SearchWord,set);
		//System.out.println("1115AAAAA"+c1);
		//model.addAttribute("tc1", c1);
		//System.out.println("1115BBBBB------------"+model.addAttribute("tc1", c1));
//		return null;		
//	}
	
	}
	
}
