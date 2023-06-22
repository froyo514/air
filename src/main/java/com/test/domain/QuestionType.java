package com.test.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum QuestionType {
	RADIO("RADIO"),
	SELECT("SELECT"),
	ANSWER("ANSWER");
	
	private final String key;
}
