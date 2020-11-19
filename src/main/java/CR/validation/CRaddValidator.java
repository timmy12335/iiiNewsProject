package CR.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import CR.model.CRBean;

public class CRaddValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return CRBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		CRBean crBean =(CRBean) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "crTitle", "", "標題不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "crContent", "", "內容不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "crClass", "", "類別不得為空");

		if(crBean.getCrTitle() != null && crBean.getCrTitle().length() >20) {
			errors.rejectValue("crTitle", "","標題字數超出20字，請重新輸入");
		}
		if(crBean.getCrTitle() != null && crBean.getCrTitle().length() <2) {
			errors.rejectValue("crTitle", "","標題字數需大於2個字，請重新輸入");
		}
		
		if(crBean.getCrContent() != null && crBean.getCrContent().length() >200) {
			errors.rejectValue("crContent", "","內容字數超出200字，請重新輸入，若有需要請使用檔案上傳功能");
		}
		if(crBean.getCrContent() != null && crBean.getCrContent().length() <=10) {
			errors.rejectValue("crContent", "","內容字數少於10字，請重新輸入至少10個字");
		}
	}

}
