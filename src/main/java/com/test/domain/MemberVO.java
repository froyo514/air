package com.test.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	public MemberVO(String string, String string2, String string3, String string4, String string5) {
		// TODO Auto-generated constructor stub
	}
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}
	private String userid;
	private String userpw;
	private String username;
	private String location;
	private String gender;
	private Timestamp regdate;
	private Timestamp updatedate;

	}
	

