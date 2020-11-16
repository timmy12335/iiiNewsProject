package iiiNews.AD.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import iiiNews.AD.model.AdBean;

public class AdUploadValidator implements Validator {


	@Override
	public boolean supports(Class<?> clazz) {
		return AdBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		AdBean adBean = (AdBean) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "adTitle", "", "標題不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "width", "", "寬度不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "height", "", "高度不得為空");
		ValidationUtils.rejectIfEmpty(errors, "adDate", "", "日期不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "", "價格不得為空");
		ValidationUtils.rejectIfEmpty(errors, "stock", "", "庫存不得為空");
		
		if(adBean.getWidth() != null && adBean.getWidth() <=0) {
			errors.rejectValue("width", "","寬度欄位有誤，請重新輸入");
		}
		
		
		if(adBean.getHeight() != null && adBean.getHeight() <=0) {
			errors.rejectValue("height", "","高度欄位有誤，請重新輸入");
		}
		
		if(adBean.getStock() != null && adBean.getStock() <=0) {
			errors.rejectValue("stock", "","庫存欄位有誤，請重新輸入");
		}
		
		if(adBean.getPrice() != null && adBean.getPrice() <=0) {
			errors.rejectValue("price", "","價格欄位有誤，請重新輸入");
		}
		
//		if(adBean.getAdTitle() != null && adBean.getAdTitle().contains(" ")) {
//			errors.rejectValue("width", "","庫存欄位有誤，請重新輸入");
//		}
		
		if(adBean.getCategoryNo() != null && adBean.getCategoryNo().equals("-1")) {
			errors.rejectValue("categoryNo", "","請選擇欲販售之欄位");
		}
		
		if(adBean.getAdDate() == null) {
			errors.rejectValue("adDate", "","請選擇欲販售之欄位");
		}
	}

}
