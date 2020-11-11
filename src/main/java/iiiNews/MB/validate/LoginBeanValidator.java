package iiiNews.MB.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

//import iiiNews.MB.model.MBBean;

public class LoginBeanValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
//		MBBean member  = (MBBean) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userId", "", "*帳號欄位不能為空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "", "*密碼欄位不能為空白");
	}
}
