package iiiNews.AD.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import iiiNews.AD.model.AdOrderBean;
import iiiNews.AD.model.AdOrderItemBean;
import iiiNews.AD.service.AdItemService;
import iiiNews.AD.service.AdOrderService;
import iiiNews.MB.model.CpMemberBean;
import iiiNews.MB.model.MBBean;

@Controller
@SessionAttributes({"shoppingCart","MBBean","CpMemberBean"})
public class AdOrderController {
	
	@Autowired
	AdOrderService adOrderService;
	
	@Autowired
	AdItemService itemService;
	
	@Autowired
	ServletContext servletContext;
	
	public AdOrderController() {
	}
	
	
	//$$$$ 此方法打算是用普通會員Id來查訂單
	@GetMapping("/getOrderListByMemberId")
	public String MemberAdOrderList(Model model) {
		
		//$$$$ MBBean未來要寫得到memberId 目前暫時寫從Attribute取 尚未驗證過!!!
		MBBean mb = (MBBean) model.getAttribute("MBBean");
		String memberId ="";
		if(mb == null) {
			System.out.println("查訂單 但尚未登入");
			return "redirect:/Login";
		}else {
			System.out.println("查訂單 登入完成");
			memberId = mb.getMemberId();
			System.out.println(memberId);
			model.addAttribute("showmemberId", memberId);
		}
		
//		String memberId = "john";
		List<AdOrderBean> orderlist = adOrderService.getMemberOrderList(memberId);
		model.addAttribute("memberOrderList", orderlist);
		return "AD/normalMem/memberAllOrderList";
	}
	
	
	//$$$$ 此方法打算是用企業會員Id來查訂單
		@GetMapping("/getSoldOrderByCpMemberId")
		public String CpMemberSoldList(Model model) {
			
			//$$$$ 未來要寫得到memberId 目前暫時寫從Attribute取 尚未驗證過!!!
			//先確定他有登入 且是企業會員
			CpMemberBean cpbean = (CpMemberBean) model.getAttribute("CpMemberBean");
			String cpmemberId ="";
			if(cpbean == null) {
				System.out.println("企業會員查賣出ALL 但尚未登入 彈回到企業登入");
				return "redirect:/CpLogin";
			}else {
				System.out.println("企業會員查賣出ALL 登入完成");
				cpmemberId = cpbean.getCpmemberId();
				System.out.println("登入的帳號是"+cpmemberId);
			}
			
			List<AdOrderItemBean> orderlist = itemService.getCpMemberSoldList(cpmemberId);
			model.addAttribute("CpSoldList", orderlist);
			return "AD/entMem/AllSoldList";
		}
		
	@GetMapping("/getCpMemeberSoldListByAjax.json")
		public @ResponseBody List<AdOrderItemBean> getCpMemeberSoldByAjax(
				@RequestParam(value="memberId",defaultValue = "ALL" )String cpmemberId) {
			List<AdOrderItemBean> orderlist = itemService.getCpMemberSoldList(cpmemberId);
			return orderlist;		
		}
	
	
	/*傳入訂單pk編號 得到該訂單的所有內容品項清單*/
	@GetMapping("/getItemByOrderPk/{adOrderPk}")
	public String GetAdOrderByOrderPk(Model model,
									@PathVariable int adOrderPk) {
		AdOrderBean order = adOrderService.getOneOrder(adOrderPk);
		model.addAttribute("orderInfo", order);
		List<AdOrderItemBean> itemBeans = itemService.getItemsInOneOrder(adOrderPk);
		model.addAttribute("AdOrderItems", itemBeans);
		return "AD/normalMem/memberItemsList";
	}
	
	
	/*傳入單一品項pk編號 得到該訂單的內指定品項的內容 get方法用來呈現*/
	@GetMapping("/getOneItem/{itemPk}")
	public String GetOneOrder(Model model,
							@PathVariable int itemPk) {
		AdOrderItemBean oneItemBean = itemService.getOneItems(itemPk);
		model.addAttribute("oneItem", oneItemBean);
		return "AD/normalMem/showOneItem";
	}
	
	/*傳入單一品項pk編號 得到該訂單的內指定品項的內容 post方法去寫入由一般會員所上傳圖片*/
	@PostMapping("/getOneItem/{itemPk}")
	public String UploadItemPic(Model model,
							@ModelAttribute("oneItem") AdOrderItemBean oneItemBean,
							@PathVariable int itemPk,RedirectAttributes redirectAtt) {
		MultipartFile productImage = oneItemBean.getProductImage();
		System.out.println("productImage:-->" +productImage);
		//拿它原來的檔名取出來放到我們一個叫做FileName欄位
		String originalFilename = productImage.getOriginalFilename();
		
		AdOrderItemBean originBean = itemService.getOneItems(itemPk);
		originBean.setAdImageName(originalFilename);
		
		/* 建立Blob物件，交由 Hibernate 寫入資料庫 要有圖片欄位 且圖片位元組(不為空)
		 * 得到byte[] 建一個Blob物件要用實作介面的類別SerialBlob
		 * 呼叫他的建構子SerialBlob(byte[] b)傳入陣列
		 * 完成之後再放入Blob欄位(adImage)	*/
		
		if (productImage != null && !productImage.isEmpty() ) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				originBean.setAdImage(blob);
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		//print 確認
		System.out.println("originBean after:-->" +originBean.toString());
		
		int n = itemService.updateItemPic(originBean);
		System.out.println(n+"更改成功");
//		model.addAttribute("oneItem", oneItemBean);
//		return "AD/orders/showOneItem";
		redirectAtt.addFlashAttribute("FlashMSG_uploadPictureSuccess", "成功上傳照片，編號："+originBean.getAdNo());
		int adOrderPk = originBean.getAdOrderBean().getAdOrderPk();
		return "redirect:/getItemByOrderPk/"+adOrderPk;
	}
	
	//從資料庫取得該圖片 來顯示在畫面上
	@GetMapping("/getPicture/{itemPk}")
	public ResponseEntity<byte[]> getPicture(
			@PathVariable Integer itemPk) throws IOException, SQLException {
		
		ResponseEntity<byte[]> re = null;
		
		//定義一個InputStream來判斷圖片有沒有成功的叫出來 有可能Blob是null或是這筆資料不存在等等
		InputStream is = null;
		String mimeType = null;
		
		
		//跟Service說 把我的itemPk傳給你 你把AdOrderItemBean傳回給我 我再從bean取出blob
		//把blob變成位元組陣列byte[]
		//檔名跟mimetype有關 要記得給瀏覽器
		AdOrderItemBean originBean = itemService.getOneItems(itemPk);
		
		if(originBean != null) {
			Blob blob = originBean.getAdImage();
			if(blob != null) {
				is = blob.getBinaryStream();
				mimeType = servletContext.getMimeType(originBean.getAdImageName());
			}
		}
		
		
		//程式如果到這裡is還是null 那就給他一個預設圖片吧
		//這裡要用到ServletContext servletContext 要先去前面定義這個Bean並且@Autowired
		if (is == null) {
			System.out.println("is is null");
			is = servletContext.getResourceAsStream("/img/notupload_default.jpg");
			mimeType = servletContext.getMimeType("notupload_default.jpg");
		}
		
		
		//寫mimeType出去 放在標頭給出去
		//告訴瀏覽器收到這份資料要怎麼放到快取區 告訴她不要存 每次要用到都要抓最新
		MediaType mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		
		
		//要來轉成位元組陣列了
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] b = new byte[81920];
		int len = 0;
		while((len = is.read(b)) != -1) {
			baos.write(b, 0, len);
		}
		byte[] content = baos.toByteArray();
		
		//要傳送請求本體 請求標頭 狀態列
		re = new ResponseEntity<byte[]>(content, headers, HttpStatus.OK);
		
		return re;
	}
	
	
	//點選下載圖片時的方法 
	@GetMapping("/downloadPicture/{itemPk}")
	public void downloadPicture(HttpServletResponse response,
								@PathVariable Integer itemPk) throws SQLException, IOException {
//		response.setContentType("application/jar");
		InputStream is = null;
		OutputStream os = null;
		String mimeType = null;
		
		AdOrderItemBean originBean = itemService.getOneItems(itemPk);
		if(originBean != null) {
			Blob blob = originBean.getAdImage();
			if(blob != null) {
				is = blob.getBinaryStream();
				mimeType = servletContext.getMimeType(originBean.getAdImageName());
			}
		}
		
		//寫mimeType出去 放在標頭給出去
		//告訴瀏覽器收到這份資料要怎麼放到快取區 告訴她不要存 每次要用到都要抓最新
		MediaType mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		
		response.setHeader("Content-Disposition",
                "attachment;fileName=" + originBean.getAdNo() +"_"+ originBean.getAdImageName());

		try {
			byte[] bytes = new byte[81920];
			int len = 0;
			os = response.getOutputStream();
			while ((len = is.read(bytes)) != -1) {
				os.write(bytes, 0, len);
			}
			os.flush();
		} finally {
			if (os != null) {
				try {
					os.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	
		
	}
	
	
	
	
	
}
