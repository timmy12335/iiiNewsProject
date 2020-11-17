package iiiNews.NP.validation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import iiiNews.NP.model.NewsBean;

public class NPUploadValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return NewsBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		NewsBean nBean = (NewsBean) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "", "標題不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "location", "", "發生地點不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "outline", "", "大綱不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "article", "", "內文不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "", "金額不得為空");
		ValidationUtils.rejectIfEmpty(errors, "happenDate", "", "發生日期不得為空");
		ValidationUtils.rejectIfEmpty(errors, "happenTime", "", "發生時間不得為空");
		if(nBean.getTitle() != null && nBean.getTitle().length() >=50) {
			errors.rejectValue("title", "","標題字數超出50字，請重新輸入");
		}
		if(nBean.getOutline() != null && nBean.getOutline().length() >=100) {
			errors.rejectValue("outline", "","大綱字數超出100字，請重新輸入");
		}
		if(nBean.getArticle() != null && nBean.getArticle().length() >=300) {
			errors.rejectValue("outline", "","大綱字數超出300字，請重新輸入");
		}
		if(nBean.getPrice() != null && nBean.getPrice() <=0) {
			errors.rejectValue("price", "","價格欄位有誤，請重新輸入");
		}
		if(nBean.getNewsType() != null && nBean.getNewsType().equals("none")) {
			errors.rejectValue("newsType", "","請選擇新聞類型");
		}
		if(nBean.getProductImage().length > 3) {
			errors.rejectValue("productImage", "","照片請勿超過三張");
		}
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		try {
			//使用者輸入的時間毫秒
			Date date = sdf.parse(nBean.getHappenTime());
			//加上時區時間
			long insertTime = date.getTime() +28800000;
			//目前時間的毫秒
			long currentDate = new Date().getTime(); 
			
			//使用者輸入的日期和毫秒和現在時間日期比較
		if(nBean.getHappenDate().getTime() + insertTime > currentDate ) {
			errors.rejectValue("happenTime", "","時間請勿超過目前時間");
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
	}

}
