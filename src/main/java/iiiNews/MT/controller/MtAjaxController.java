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
import iiiNews.MT.service.MtAjaxService;

@Controller
@SessionAttributes({"MBBean"})
public class MtAjaxController {


//	@Autowired
//	MtAddService AddService;
	
//	@Autowired
//	MtCommentService ComService;
	
	@Autowired
	MtAjaxService ajaxService;
	
//	@Autowired
//	ServletContext servletContext;
	
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
	
	//以關鍵字來搜尋 (限制上架)
	@GetMapping("/getAllArtWord.json")
	public @ResponseBody List<MtAddBean> getAllArtWord(
			@RequestParam(value="word")String SearchWord){
		System.out.println("----------搜尋----------");
		List<MtAddBean> list = new ArrayList<MtAddBean>();
		list = ajaxService.getAllArtWord(SearchWord);
		return list;		
	}
	
	
	
	//-------------------------------前端Ajax-------------------------------
	
}
