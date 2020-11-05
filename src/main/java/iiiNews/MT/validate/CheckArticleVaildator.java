package iiiNews.MT.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import iiiNews.MT.model.MtAddBean;

public class CheckArticleVaildator implements Validator {

	private static final Integer Integer = null;

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "","標題不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "article", "","內文不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "imgLink", "","請選擇圖片");
	}

}
