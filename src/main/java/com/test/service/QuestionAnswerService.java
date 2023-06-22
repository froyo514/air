package com.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.test.domain.QuestionAnswerVO;
import com.test.mapper.QuestionAnswerMapper;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QuestionAnswerService {
	@NonNull
	private QuestionAnswerMapper mapper;
	
	public List<QuestionAnswerVO> getQuestionAnswerList(int survey_id) {
		return mapper.getQuestionAnswerList(survey_id);
	
	}
}
