package com.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.test.domain.AuthVO;
import com.test.domain.MemberVO;
import com.test.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Service
@Log4j2

public class MemberService {
		@Setter(onMethod_=@Autowired)
		private MemberMapper mapper;
		
		@Setter(onMethod_=@Autowired)
		private PasswordEncoder pwencoder;
		
		public void signup(MemberVO vo) {
			//vo.setUserpw(pwencoder.encode(vo.getUserpw()));
			mapper.insert(vo);
		}
		
		
		
		public AuthVO authenticate(MemberVO vo) throws Exception{
			MemberVO selectVO = mapper.selectMemberByUserid(vo.getUserid());
			if (selectVO == null) {
				throw new Exception("nouser");
			}
			if(!pwencoder.matches(vo.getUserpw(),selectVO.getUserpw())){
				throw new Exception("nomatch");
			}
			AuthVO authVO = new AuthVO();
			authVO.setUserid(selectVO.getUserid());
			authVO.setUsername(selectVO.getUsername());
			return authVO;
			
		
	}
}