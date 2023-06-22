package com.test.domain;

import java.util.List;

import lombok.Data;

@Data
public class SurveyData {
	private String fruits;
	private String movie_genre;
	private String alcohol_type;
	private String area;
	private String age;
	
	private List<String> titles;
	private List<String> responses;
	
}
