package iiiNews.NP.controller;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import iiiNews.NP.model.NewsBean;
import iiiNews.NP.service.NewsProductService;

@Controller
public class NewsProductController {
	
	@Autowired
	NewsProductService service;
	
	@GetMapping("/uploadNews")
	public String goUploadForm(Model model) {
		
		NewsBean nb = new NewsBean();		
		model.addAttribute("newsBean", nb);		
		return "NP/uploadNews";
	}
	//新增一則新聞
	@PostMapping("/uploadNews")
	public String uploadNewsForm(
			@ModelAttribute("newsBean")NewsBean nb		
			,Model model) {
		Timestamp uploadTime = new Timestamp(System.currentTimeMillis());
		nb.setUploadTime(uploadTime);
		System.out.println(uploadTime);
		
		MultipartFile[] productImages = nb.getProductImage();
		System.out.println(productImages);

			if(productImages[0].isEmpty()) {
				System.out.println("無法找到圖片");
			}else {
				nb.setPic_One(productImages[0].getOriginalFilename());
				nb.setPic_Two(productImages[1].getOriginalFilename());
				nb.setPic_Three(productImages[2].getOriginalFilename());
			}
			for(int i = 0;i<productImages.length;i++) {
				if(productImages[i] != null && !productImages[i].isEmpty()) {
					try {
						byte[] b1 = productImages[0].getBytes();
						byte[] b2 = productImages[1].getBytes();
						byte[] b3 = productImages[2].getBytes();
						Blob blob1 = new SerialBlob(b1);
						Blob blob2 = new SerialBlob(b2);
						Blob blob3 = new SerialBlob(b3);
						nb.setImg_I(blob1);
						nb.setImg_II(blob2);
						nb.setImg_III(blob3);						
					}catch(Exception e) {
						e.printStackTrace();
						throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
		
		String md = service.getLastRecord();
		nb.setMemberId("A0002");
		nb.setNewsId(md);
		
		nb.setStatus(1);
		service.uploadNewsForm(nb);
		return "redirect:/getMemNewsList/A0002";
	}
	
	
	
	//查詢所有的新聞
	@GetMapping("/getAllNews")
	public String getAllNewsList(Model model) {
		List<NewsBean> list = service.getAllNews();
		model.addAttribute("newsLists", list);
		return "NP/allNewsList";
	}
	//查詢單一筆新聞
	@GetMapping("/getSingleNews/{newsId}")
	public String getSingleNews(@PathVariable String newsId ,Model model) {
		NewsBean newsBean = service.getSingleNews(newsId);
		model.addAttribute("newsSingle", newsBean);
		return "NP/singleNews";
	}
	//查詢單一會員的新聞列表
	@GetMapping("/getMemNewsList/{memberId}")
	public String  getMemNewaList(@PathVariable String memberId ,Model model) {
		List<NewsBean> list = service.getMemNews(memberId);
		model.addAttribute("memNewsList", list);
		return "NP/memNewsList";
	}
	
}



