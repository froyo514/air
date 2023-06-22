package com.test.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.domain.QuestionVO;
import com.test.mapper.QuestionMapper;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QuestionService {
	@NonNull
	private QuestionMapper mapper;

	public void registerQuestion(QuestionVO vo) {
		mapper.insertQuestion(vo);	
	}
	
	public List<QuestionVO> getQuestionList(int survey_id) {
		return mapper.getQuestionList(survey_id);
	}
	
	@Transactional
	public void registerQuestionList(List<QuestionVO> list) {
		for (QuestionVO item : list) {
			registerQuestion(item);
		}
	}
}
