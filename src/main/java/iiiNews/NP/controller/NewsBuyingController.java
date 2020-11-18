package iiiNews.NP.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import iiiNews.MB.model.CpMemberBean;
import iiiNews.MB.model.MBBean;
import iiiNews.NP.model.NewsBean;
import iiiNews.NP.model.NewsOrderBean;
import iiiNews.NP.service.NPOrderService;
import iiiNews.NP.service.NewsProductService;

@Controller
@SessionAttributes({"MBBean","CpMemberBean","green"})
public class NewsBuyingController {
	@Autowired
	NewsProductService productService;
	@Autowired
	NPOrderService npOrderService;
	@Autowired
	ServletContext servletContext;

	//企業購買後新增一筆訂單
	@GetMapping("/insertToOrderBean/{newsId}")
	public String BuyingNews(@ModelAttribute NewsOrderBean nOrderBean ,
							 @PathVariable String newsId ,Model model){
		CpMemberBean cpmb = (CpMemberBean) model.getAttribute("CpMemberBean");
		
		if (cpmb == null) {
			return "redirect:/CpLogin";
		}else {
			NewsBean nb = productService.getSingleNews(newsId);
			nOrderBean.setNewsId(nb.getNewsId());
			Timestamp soldTime = new Timestamp(System.currentTimeMillis());
			nOrderBean.setSoldTime(soldTime);
			nOrderBean.setOrderPrice(nb.getPrice());
			nOrderBean.setNewsBean(nb);
			nOrderBean.setMemberId(nb.getMemberId());
			nOrderBean.setCompanyId(cpmb.getCpmemberId());
			String OrderNo = npOrderService.getOrderRecord();
			nOrderBean.setOrderId(OrderNo);
			//改上架狀態
			npOrderService.updateStatusZero(newsId);
			npOrderService.uploadNewsOrder(nOrderBean);
			
			/* 提供金額 訂單編號 時間 商品名稱給綠界
			 * 得到訂單金額並轉成字串
			 * 取得時間並轉成API要的格式*/
			String money = String.valueOf(nb.getPrice());
			
			Timestamp orderDate = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			String tradeDate = sdf.format(orderDate);
			String itemName = "iiiNews News products#";
			itemName += "#"+OrderNo+"#Thank you for purchasing.";
			
			System.out.println("=====進入綠界的結帳=====");
			//(串接綠界的結帳API)
			AllInOne all = new AllInOne("");
			AioCheckOutALL obj = new AioCheckOutALL();
			obj.setMerchantTradeNo(OrderNo);
			obj.setMerchantTradeDate(tradeDate);
			obj.setTotalAmount(money);
			obj.setTradeDesc("test Description");
			obj.setItemName(itemName);
			obj.setReturnURL("http://localhost:8080/iiiNews/");
			obj.setClientBackURL("http://localhost:8080/iiiNews/showOrderList");
			obj.setNeedExtraPaidInfo("Y");
			String greenword = all.aioCheckOut(obj, null);
			model.addAttribute("green", greenword);
			
			return "redirect:/gotogreenpage";
			
//			return "redirect:/showOrderList";				
		}				
	}
	
	@GetMapping("/gotogreenpage")
	public void gotogreenpage(Model model, HttpServletResponse response) throws IOException {
		System.out.println("green");
		PrintWriter out = response.getWriter();
		String greenword = (String) model.getAttribute("green");
		System.out.println(greenword);
		out.print("<div>"+greenword+"</div>");
	}
	
	//列出企業訂單列表
	@GetMapping("/showOrderList")
	public String showOrderList(Model model) {
		CpMemberBean cpmb = (CpMemberBean) model.getAttribute("CpMemberBean");		
		if (cpmb == null) {
			return "redirect:/CpLogin";
		}else {
			return "NP/NewsOrderListAjax";	
		}
		
	}

	@GetMapping("/getOrderByAjax.json")
	public @ResponseBody List<NewsOrderBean> getOrderList(Model model){
		CpMemberBean cpmb = (CpMemberBean) model.getAttribute("CpMemberBean");
		String companyId = cpmb.getCpmemberId();
		return npOrderService.getOrderListByAjax(companyId);
	}
	
	//列出會員被購買訂單列表
	@GetMapping("/getOrderMemNewsList")
	public String showOrderMemNewsList(Model model) {
		MBBean mb = (MBBean) model.getAttribute("MBBean");
		if(mb == null) {			
			return "redirect:/Login";
		}else {
			return "NP/NewsOrderMemListByAjax";	
		}
		
	}	
	@GetMapping("/getOrderMemNewsListByAjax.json")
	public @ResponseBody List<NewsOrderBean> getOrderMemNewsList(Model model){
		MBBean mb = (MBBean) model.getAttribute("MBBean");		
		String 	memberId = mb.getMemberId();
		return npOrderService.getOrderMemListByAjax(memberId);		
	}
	
	@GetMapping("/getOrderedSingleNews/{newsId}")
	public String getOrderedNews(@PathVariable String newsId, Model model) {
		NewsBean nBean = npOrderService.getOrderedSingleNews(newsId);
		System.out.println(newsId);
		model.addAttribute("newsSingle",nBean);
		return "NP/singleNewsTest";
	}
	
	//將圖片顯示給企業看(已購買)
			@GetMapping("/getOrderedNewsPicture/{newsId}")
			public ResponseEntity<byte[]> getUpNewsPicture(@PathVariable String newsId) throws IOException, SQLException {
				ResponseEntity<byte[]> npic = null;

				// 定義一個InputStream來判斷圖片有沒有成功的叫出來 有可能Blob是null或是這筆資料不存在等等
				InputStream is = null;
				String mimeType = null;
				// 跟Service說 把我的bookId傳給你 你把BookBean傳回給我 我再從bean取出blob
				// 把blob變成位元組陣列byte[]
				// 檔名跟mimetype有關 要記得給瀏覽器
				NewsBean nb = npOrderService.getOrderedSingleNews(newsId);
				if (nb != null) {
					Blob blob = nb.getImg_I();
					if (blob != null) {
						is = blob.getBinaryStream();
						mimeType = servletContext.getMimeType(nb.getPic_One());
					}

				}
				if (is == null) {
					is = servletContext.getResourceAsStream("/img/NoImage.jpg");
					mimeType = servletContext.getMimeType("NoImage.jpg");
				}
				// 寫mimeType出去 放在標頭給出去
				// 告訴瀏覽器收到這份資料要怎麼放到快取區 告訴她不要存 每次要用到都要抓最新
				MediaType mediaType = MediaType.valueOf(mimeType);
				HttpHeaders headers = new HttpHeaders();
				headers.setContentType(mediaType);
				headers.setCacheControl(CacheControl.noCache().getHeaderValue());

				// 要來轉成位元組陣列了
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				byte[] b = new byte[81920];
				int len = 0;
				while ((len = is.read(b)) != -1) {
					baos.write(b, 0, len);
				}
				byte[] content = baos.toByteArray();

				// 要傳送請求本體 請求標頭 狀態列
				npic = new ResponseEntity<byte[]>(content, headers, HttpStatus.OK);
				return npic;
			}

}
