package com.test.oooo;

import java.util.List;

import lombok.Data;

@Data
public class SurveyForm {
	private String title;
    private List<Question> questions;

    // Getters and setters
}

