package com.test.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import lombok.Data;


@Data
public class QuestionVO {
	private int question_id;
	private int survey_id;
	private int question_no;
	private String question_text;
	private String question_options;
	private QuestionType question_type;
	
	public QuestionVO() {
		
	}

	public QuestionVO(int survey_id, int question_no, String question_text,
			String question_options, QuestionType question_type) {
		this.survey_id = survey_id;
		this.question_no = question_no;
		this.question_text = question_text;
		this.question_options = question_options;
		this.question_type = question_type;
	}

	public QuestionVO(String question_text) {
		this.question_text = question_text;
		
	}
	public List<String> getListOptions(){
		return new ArrayList<String>(Arrays.asList(question_options.split(",")));
	}
	
	
	
	
}
