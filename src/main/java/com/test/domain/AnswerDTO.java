package com.test.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class AnswerDTO {
	private List<Integer> question_id;
	private List<String> answer_text;

		
	public List<AnswerVO> getList() {
		List<AnswerVO> list = new ArrayList<AnswerVO> ();
		if (!question_id.isEmpty() && !answer_text.isEmpty()) {
			for(int i=0; i<question_id.size(); i++) {
				AnswerVO vo = new AnswerVO();
				vo.setQuestion_id(question_id.get(i));
				vo.setAnswer_text(answer_text.get(i));
				list.add(vo);
			}
		}
		return list;
	}
	

}
