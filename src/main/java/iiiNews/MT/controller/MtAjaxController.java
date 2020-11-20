package iiiNews.MT.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import iiiNews.MT.model.MtAddBean;
import iiiNews.MT.service.MtAddService;
import iiiNews.MT.service.MtAjaxService;

@Controller
@SessionAttributes({"MBBean"})
public class MtAjaxController {

	@Autowired
	MtAddService addService;
	
	@Autowired
	MtAjaxService ajaxService;
	
	//-------------------------------前端Ajax-------------------------------
	@GetMapping("/AllArticleComment")			//前端瀏覽所有文章ajax
	public String showAllArticleComment() {	
			return"MT/AllArticleCommentAjax";
	}
	
	@GetMapping("/allArtCom.json")
	public @ResponseBody List<MtAddBean> getAllArticleComment(
			@RequestParam(value="pageNoCom",defaultValue = "1" )Integer pageNoCom) {	
		
		List<MtAddBean> list =  ajaxService.getPageComment(pageNoCom);
		return list;
	}
	
	@GetMapping("/allArtComNo")
	public @ResponseBody Map<String, Integer> getPage(
			@RequestParam(value="pageNoCom",defaultValue = "1" )Integer pageNoCom,
			@RequestParam(value="totalPageCom", defaultValue = "1") Integer totalPageCom) {	
		
		totalPageCom = ajaxService.getTotalPages();
		
		Map<String, Integer>  map = new HashMap<>();
        map.put("totalPageCom", totalPageCom);
        map.put("currPage", pageNoCom);
		return map;
	
	}
	
	//--------------------以關鍵字來搜尋 --------------------
	@GetMapping("/getAllArtWord.json")
	public @ResponseBody List<MtAddBean> getAllArtWord(
			@RequestParam(value="word")String SearchWord,
			@RequestParam(value="keyWordPage",defaultValue = "1" )Integer keyWordPage){
		System.out.println("----------搜尋----------");
		List<MtAddBean> list = new ArrayList<MtAddBean>();
		list = ajaxService.getAllArtWord(SearchWord, keyWordPage);
		return list;		
	}
	
	@GetMapping("/allArtWordNo")
	public @ResponseBody Map<String, Integer> getKeyWordPage(
			@RequestParam(value="word") String searchWord,
			@RequestParam(value="keyWordPage",defaultValue = "1" )Integer keyWordPage,
			@RequestParam(value="keyWordTotalPage", defaultValue = "1") Integer keyWordTotalPage) {	
		
		keyWordTotalPage = ajaxService.getKeyWordPages(searchWord);
		
		Map<String, Integer>  map = new HashMap<>();
        map.put("keyWordTotalPage", keyWordTotalPage);
        map.put("currPage", keyWordPage);
		return map;
	
	}
	
	//-------------------------------後端Ajax-------------------------------
	
//	@GetMapping("/AllMtAdd")
//	public String getajax2() {
//		service.changeStatus();
//		return "MT/getAllMtAdd";
//	}
	
	@GetMapping("/getAllMtAdd")			//查詢所有的文章***後台部分
	public String getAllMtList(){	
		return "MT/getAllMtAdd";
	}
	
	//以類別來搜尋 (限制上架)
	@GetMapping("/getArtStatusAjax.json")
	public @ResponseBody List<MtAddBean> getArtStatusAjax(
			@RequestParam(value="statusNo",defaultValue = "-1" )Integer statusNo,
			@RequestParam(value="set",defaultValue = "onsale" )String set) {
		System.out.println(statusNo);
		List<MtAddBean> list = new ArrayList<MtAddBean>();
		if(statusNo.equals(-1) && set.equals("ALL")) {
			list = ajaxService.getAllMtByAjax(set);
		}else if(statusNo.equals(-1)){
			list = ajaxService.getAllMtByAjax("");
		}else {
			list = ajaxService.getMtByCateNoAjax(statusNo,set);
		}
		return list;
	}
	
}
