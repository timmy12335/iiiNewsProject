package iiiNews.MB.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import iiiNews.MB.model.MBBean;

public class UserBeanValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberId", "","*請輸入帳號");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "Password", "","*請輸入密碼");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberSalary", "","*請輸入薪資");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberDepartment", "","*請輸入部門");
		MBBean mb  = (MBBean) target;
		
		if (mb.getMemberId() != null  && mb.getMemberId().contains(" ")) {
			errors.rejectValue("MemberId","" ,"帳號內容不得有空白");
		}
		if (mb.getPassword() != null && mb.getPassword().contains(" ")) {
			errors.rejectValue("Password", "","密碼內容不得有空白");
		}
	}
}
