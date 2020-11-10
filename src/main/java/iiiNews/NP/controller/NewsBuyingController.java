package iiiNews.NP.controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import iiiNews.NP.model.NewsBean;
import iiiNews.NP.model.NewsOrderBean;
import iiiNews.NP.service.NPOrderService;
import iiiNews.NP.service.NewsProductService;

@Controller
public class NewsBuyingController {
	@Autowired
	NewsProductService productService;
	@Autowired
	NPOrderService npOrderService;
	

	//企業購買後新增一筆訂單
	@GetMapping("/insertToOrderBean/{newsId}")
	public String BuyingNews(@ModelAttribute NewsOrderBean nOrderBean ,
							 @PathVariable String newsId ,Model model) {
		NewsBean nb = productService.getSingleNews(newsId);
		nOrderBean.setNewsId(nb.getNewsId());
		Timestamp soldTime = new Timestamp(System.currentTimeMillis());
		nOrderBean.setSoldTime(soldTime);
		nOrderBean.setOrderPrice(nb.getPrice());
		nOrderBean.setNewsBean(nb);
		nOrderBean.setMemberId(nb.getMemberId());
		nOrderBean.setCompanyId("C0001");
		nOrderBean.setOrderId(npOrderService.getOrderRecord());
		
		npOrderService.updateStatusZero(newsId);
		npOrderService.uploadNewsOrder(nOrderBean);
				
		return "NP/allNewsList";		
	}
	
	//列出企業訂單列表
	

}
