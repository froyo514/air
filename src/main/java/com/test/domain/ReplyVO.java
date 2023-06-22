package com.test.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReplyVO {
	private Long rno;
	private Long bno;
	private String reply;
	private String replyer;
	private Timestamp regdate;
	private Timestamp updatedate;
	
	public ReplyVO(String reply, String replyer) {
		this.reply = reply;
		this.replyer = replyer;
		
	
	}
	public ReplyVO() {
		
	}
}
