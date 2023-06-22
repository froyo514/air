package com.test.domain;

import lombok.Data;

@Data
public class AnswerVO {
	private int answer_id;
	private int question_id;
	private String answer_text;

	public AnswerVO() {
		
	}
	
	public AnswerVO(int answer_id, int question_id, String answer_text) {
		this.answer_id = answer_id;
		this.question_id = question_id;
		this.answer_text = answer_text;
	}

	public AnswerVO(int question_id, String answer_text) {
		super();
		this.question_id = question_id;
		this.answer_text = answer_text;
	}
	
	
	

	
}		
 