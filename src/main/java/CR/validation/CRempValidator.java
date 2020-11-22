package CR.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import CR.model.CRemployee;

public class CRempValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
	
		return CRemployee.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		CRemployee empbean = (CRemployee)target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "empName", "", "員工姓名不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "empId", "", "員工帳號不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "empemail", "", "員工信箱不得為空");

		if(empbean.getEmpName() != null && empbean.getEmpName() .length() <=0) {
			errors.rejectValue("empName", "","輸入有誤，請重新輸入");
		}
		if(empbean.getEmpId() != null && empbean.getEmpId().length() <=0) {
			errors.rejectValue("empId", "","輸入有誤，請重新輸入");
		}
		String format = "\\p{Alpha}\\w{2,15}[@][a-z0-9]{3,}[.]\\p{Lower}{2,}";
		if(empbean.getEmpemail() != null && empbean.getEmpemail().length() <=0) {
			errors.rejectValue("empemail", "","輸入有誤，請重新輸入");
		}
		if(empbean.getEmpemail() != null && empbean.getEmpemail().matches(format)) {
			errors.rejectValue("empemail", "","email格式錯誤，請重新輸入");
		}
	}

}
