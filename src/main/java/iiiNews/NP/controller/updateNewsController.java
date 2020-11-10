package iiiNews.NP.controller;

import java.sql.Blob;

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
import iiiNews.NP.service.NewsUpdateService;

@Controller
public class updateNewsController {
	
	@Autowired
	NewsProductService produstservice;
	@Autowired
	NewsUpdateService updateService;
	
		//查詢單一筆新聞，顯示在修改的頁面
		@GetMapping("/getUpdateSingleNews/{newsId}")
		public String getSingleNews(@PathVariable String newsId ,Model model) {
			NewsBean newsBean = produstservice.getSingleNewsForUpdate(newsId);
			
			model.addAttribute("newsSingle", newsBean);
			return "NP/UpdateSingleNews";
		}
		
		//一般會員修改單一則新聞
		@PostMapping("/getUpdateSingleNews/{newsId}")
		public String UpdateSingleNews(@ModelAttribute("newsSingle") NewsBean nb		
				,@PathVariable String newsId,Model model) {	
			NewsBean newsBean = produstservice.getSingleNewsForUpdate(newsId);
			MultipartFile[] productImages = nb.getProductImage();
			System.out.println(productImages);

			
			if (productImages[0].getSize()==0) {
							
				nb.setImg_I(newsBean.getImg_I());
				nb.setImg_II(newsBean.getImg_II());
				nb.setImg_III(newsBean.getImg_III());
				
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
			
			updateService.updateNewsProduct(nb);
			return "redirect:/getSingleNewsForUpdate/{newsId}";
		}
		
		
	
	
	

}
