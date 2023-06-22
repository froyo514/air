package com.test.domain;

import java.util.List;

public class Question {
	private String title;
	private List<String> options;
	private boolean select;
	
	
	public Question(String title, List<String> options) {
		this.title = title;
		this.options = options;
	}
	public Question(String title, List<String> options, boolean select) {
		this.title = title;
		this.options = options;
		this.select = select;
	}
	
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<String> getOptions() {
		return options;
	}
	public void setOptions(List<String> options) {
		this.options = options;
	}
	public boolean isChoice() {
		return options != null && !options.isEmpty();
	}
	public boolean isSelect() {
		return select;
	}
	
}
