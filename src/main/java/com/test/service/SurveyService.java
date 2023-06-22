package com.test.service;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.domain.Question;
import com.test.domain.QuestionVO;
import com.test.domain.SurveyVO;
import com.test.mapper.QuestionMapper;
import com.test.mapper.SurveyMapper;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SurveyService {
	@NonNull
	private SurveyMapper mapper;
	@NonNull
	private QuestionMapper qMapper;
	
	
	
	
	public List<SurveyVO> getSurveyList() {
		return mapper.getSurveyList();
	}
	public int modifySurvey(SurveyVO vo) {
		return mapper.updateSurvey(vo);
	}
	public SurveyVO getSurvey(int survey_id) {
		return mapper.getSurvey(survey_id);
	}
	public void registerSurvey(SurveyVO vo) {
		mapper.insertSurvey(vo);
	}
	@Transactional
	public void registerSurvey(SurveyVO vo, List<QuestionVO> list) {
		mapper.insertSurvey(vo);
		list.replaceAll(item->{item.setSurvey_id(vo.getSurvey_id()); return item;});
		for (QuestionVO item : list  ) {
			qMapper.insertQuestion(item);
		}

	}
	//@Transactional
	public void registerSurveyList(List<SurveyVO> list) {
		for (SurveyVO item : list) {
			registerSurvey(item);
		}
		
	}
	public List<Question> getSurveyQuestions() {
		List<Question> retValue = new ArrayList<Question>();
		Question q = new Question("가장 좋아하는 과일은?",Arrays.asList("포도","사과","메론","체리"));
		retValue.add(q);
		q = new Question("가장 좋아하는 장르는?",Arrays.asList("멜로","호러","액션","코미디"));
		retValue.add(q);
		q = new Question("가장 좋아하는 술은?",Arrays.asList("소주","맥주","위스키","럼"));
		retValue.add(q);
		q = new Question("응답자 위치",Arrays.asList("-선택-","서울","부산","대구","인천","광주"
				,"대전","울산","강원","경기","경남","경북","전남","전북","제주","충남","충북"),true);
		retValue.add(q);
		q = new Question("응답자 나이:" , new ArrayList<>() );
		retValue.add(q);
		return retValue;
		
	}
	
		
		
	
	

}
