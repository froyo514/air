package com.test.mapper;

import java.util.List;

import com.test.domain.SurveyVO;

public interface SurveyMapper {
	public void insertSurvey(SurveyVO vo);
	public List<SurveyVO> getSurveyList();
	public SurveyVO getSurvey(int survey_id);
	public int updateSurvey(SurveyVO vo);
	public int deleteSurvey(SurveyVO vo);
}
