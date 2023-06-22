package com.test.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.domain.AnswerVO;
import com.test.mapper.AnswerMapper;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AnswerService {
	@NonNull
	private AnswerMapper mapper;

	public void registerAnswer(AnswerVO vo) {
		mapper.insertAnswer(vo);	
	}
	

	@Transactional
	public void registerAnswerList(List<AnswerVO> list) {
		for (AnswerVO item : list) {
			registerAnswer(item);
		}
	}
}
