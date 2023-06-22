package com.test.domain;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import lombok.extern.log4j.Log4j2;
@Log4j2
public class SurveyValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		return SurveyVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		log.info("validate.........", errors);
		ValidationUtils.rejectIfEmpty(errors, "survey_name", "required");
	}

}
