package TRN.web.news.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import TRN.web.news.dao.Impl.MyHttpclient;

@Controller
public class httpController {

	String e1;
	
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
	@GetMapping("/httpclient1") // 連線查詢所有資料
	public @ResponseBody List<String> httpclient(
		   @RequestParam (value="word")String word1) throws IOException {
		String e1 = ""; //第一次宣告,不能重複宣告
		String word = "";
		List<String> list = new ArrayList<String>();
		System.out.println("傳到controller1"+word1);
		if(word1.indexOf(" ") ==-1) {
			word = word1;
			System.out.println("word裡面沒空格"+word);
		}else {
			
			word = word1.replace(" ", "%20");
			System.out.println("word裡面替換空格"+word);
		}
		MyHttpclient t1 = new MyHttpclient();
		
		Elements d1 =t1.httpclientData(word).getElementsByClass("newsimg-area-text-2");
		
		//System.out.println("AAAAAAAA"+d1);
		for(int i = 0 ; i <=6 ; i++) {
		 e1 = d1.get(i).text();
		// System.out.println("BBBBBBB"+e1);
		
		 list.add(new String(e1)); //將字串加入list
		
		// System.out.println("BBBBBBB"+list);
		}
		
		//String a1 =e1.toString() ;
		//List<String> list = Arrays.asList(a1);
		
//		File writename = new File("C:\\_springMVC\\outwritestream\\input.txtoutput.txt"); // 相對路徑，如果沒有則要建立一個新的output。txt檔案
//		writename.createNewFile(); // 建立新檔案
//		BufferedWriter out = new BufferedWriter(new FileWriter(writename));
//		 for(String l:list){
//		out.write(l); // \r\n即為換行
//		 }
//		out.flush(); // 把快取區內容壓入檔案
//		out.close(); // 最後記得關閉檔案
		
		//String d1 = b1.get(0).text();
//		System.out.println("9999"+d1);
//		String s1= d1.text();
	
		//model.addAttribute("d1", d1);
		return list;
	}
	
	@GetMapping("/httpclient2") // 連線查詢所有資料
	public @ResponseBody List<String> httpclientURL(
		   @RequestParam (value="word")String word1) throws IOException {
		String e1 = ""; //第一次宣告,不能重複宣告
		String word = "";
		List<String> list1 = new ArrayList<String>();
		System.out.println("傳到controller1"+word1);
		if(word1.indexOf(" ") ==-1) {
			word = word1;
			System.out.println("word裡面沒空格"+word);
		}else {
			
			word = word1.replace(" ", "%20");
			System.out.println("word裡面替換空格"+word);
		}
		System.out.println(word);
		
		MyHttpclient t1 = new MyHttpclient();
		Elements d1 =t1.httpclientData(word).select("div.newsimg-area-item-2");
	
		Elements c1 = d1.select("a");
		
		for(int i = 0 ; i <=20 ; i+=2) {
		 e1 = c1.get(i).attr("href");
		
		
		 list1.add(new String(e1)); //將字串加入list
		
		// System.out.println("BBBBBBB"+list);
		}
		System.out.println("CCCCCCC"+ list1);
		//String a1 =e1.toString() ;
		//List<String> list = Arrays.asList(a1);
		
//		File writename = new File("C:\\_springMVC\\outwritestream\\input.txtoutputURL.txt"); // 相對路徑，如果沒有則要建立一個新的output。txt檔案
//		writename.createNewFile(); // 建立新檔案
//		BufferedWriter out = new BufferedWriter(new FileWriter(writename));
//		 for(String l:list1){
//		out.write(l); // \r\n即為換行
//		 }
//		out.flush(); // 把快取區內容壓入檔案
//		out.close(); // 最後記得關閉檔案
		
		//String d1 = b1.get(0).text();
//		System.out.println("9999"+d1);
//		String s1= d1.text();
		System.out.println("1113------------->"+list1);
		//model.addAttribute("d1", d1);
		return list1;
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
