package com.test.mapper;

import java.util.List;

import com.test.domain.AnswerVO;
import com.test.domain.QuestionVO;

public interface AnswerMapper {
	public void insertAnswer(AnswerVO vo);
	public List<AnswerVO> AnswerList(int answer_id);
	public int deleteAnswer(int answer_id);
	public int updateAnswer(AnswerVO vo);
}
