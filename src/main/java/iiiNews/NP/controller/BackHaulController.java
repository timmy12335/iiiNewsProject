package iiiNews.NP.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import iiiNews.NP.model.NewsBean;
import iiiNews.NP.service.NewsBackHaulService;
//後臺使用
@Controller
public class BackHaulController {
	
	@Autowired
	NewsBackHaulService backHaulService;
	
	public @ResponseBody List<NewsBean> getNewsTypeForBB(
			@RequestParam(value = "type",required = false) String Type){
		List<NewsBean> list = backHaulService.getNewByTypeForBB(Type);
		return list;
		 
	}

}
