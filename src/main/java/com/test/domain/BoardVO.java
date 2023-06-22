package com.test.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private Long rn;
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Timestamp regdate;
	private Timestamp updatedate;
	
	
	public BoardVO(String title, String content, String writer) {
		this.title = title;
		this.content = content;
		this.writer = writer;
	}


	public BoardVO() {
	}


	public List<BoardAttachVO> attachList;
	}
	
	
	


