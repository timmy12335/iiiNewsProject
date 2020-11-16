package iiiNews.MB.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import iiiNews.MB.model.CpMemberBean;

public class UserCpBeanValidator implements Validator{


	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cpmemberId", "","*請輸入帳號");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "Password2", "","*請輸入密碼");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberSalary", "","*請輸入薪資");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberDepartment", "","*請輸入部門");
		CpMemberBean cpmb  = (CpMemberBean) target;
		
		if (cpmb.getCpmemberId() != null  && cpmb.getCpmemberId().contains(" ")) {
			errors.rejectValue("CpmemberId","" ,"帳號內容不得有空白");
		}
		if (cpmb.getPassword2() != null && cpmb.getPassword2().contains(" ")) {
			errors.rejectValue("Password2", "","密碼內容不得有空白");
		}
	}
}
