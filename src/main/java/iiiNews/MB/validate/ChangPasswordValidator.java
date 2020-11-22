package iiiNews.MB.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import iiiNews.MB.model.MBBean;


public class ChangPasswordValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "","*請輸入舊密碼");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberNewPassword", "","*請輸入新密碼");
		
		MBBean mb  = (MBBean) target;
		
		if (mb.getPassword() != null  && mb.getPassword().contains(" ")) {
			errors.rejectValue("password","" ,"內容不得有空白");
		}
		if (mb.getMemberNewPassword() != null && mb.getMemberNewPassword().contains(" ")) {
			errors.rejectValue("memberNewPassword", "","內容不得有空白");
		}
	

	}
}
