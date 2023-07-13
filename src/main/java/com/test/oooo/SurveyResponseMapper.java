package com.test.oooo;

import java.util.List;

public interface SurveyResponseMapper {
    SurveyResponse getSurveyResponseById(int id);
    void createSurveyResponse(Answer answer); // 변경된 매개변수 타입
    void updateSurveyResponse(SurveyResponse surveyResponse);
    void deleteSurveyResponse(int id);
    List<SurveyResponse> getSurveyResponses(); // 추가된 메소드
}
