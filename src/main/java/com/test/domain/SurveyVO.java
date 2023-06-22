package com.test.domain;

import lombok.Data;

@Data
public class SurveyVO {
	private int survey_id;
	private String survey_name;
	private String survey_desc;
	private String questions;
	
	public SurveyVO() {
		
	}
	
	public SurveyVO(int survey_id, String survey_name, String survey_desc) {
		this.survey_id =survey_id;
		this.survey_name = survey_name;
		this.survey_desc = survey_desc;
	}
	public SurveyVO(String survey_name, String survey_desc) {
		this.survey_name = survey_name;
		this.survey_desc = survey_desc;
	}

	public SurveyVO(int survey_id, String survey_name) {
		this.survey_id = survey_id;
		this.survey_name = survey_name;
	}

	
	
	
}
