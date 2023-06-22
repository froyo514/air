package com.test.mapper;

import com.test.domain.MemberVO;

public interface MemberMapper {
	
	public void insert(MemberVO vo);

	public MemberVO selectMemberByUserid(String userid);
}
