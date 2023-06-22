package com.test.mapper;

import java.util.List;

import com.test.domain.QuestionVO;

public interface QuestionMapper {
	public void insertQuestion(QuestionVO vo);
	public List<QuestionVO> getQuestionList(int survey_id);
	public int updateQuestion(QuestionVO vo);
	public int deleteQuestion(int question_id);
//	public void getQuestionList(QuestionVO vo);
	
} 
