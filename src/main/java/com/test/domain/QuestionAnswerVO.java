package com.test.domain;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.google.gson.JsonObject;

import lombok.Data;
@Data
public class QuestionAnswerVO {
	private int question_id;
	private int survey_id;
	private int	question_no;
	private String question_text;
	private	String question_options;
	private QuestionType question_type;
	private JsonObject question_answer;
	
	public QuestionAnswerVO() {
		
	}
	public List<String> getKeys(){
		List<String> retValue = new ArrayList<String>();
		Iterator<String> it = question_answer.keySet().iterator();
		while(it.hasNext()) {
			retValue.add(it.next());
			}
		return retValue;
		}
	public List<Integer> getValues(){
		List<Integer> retValue = new ArrayList<Integer>();
		Iterator<String> it = question_answer.keySet().iterator();
		while(it.hasNext()) {
			String key = it.next();
			retValue.add(question_answer.get(key).getAsBigInteger().intValueExact());
			}
		return retValue;
	}
	
	
}

