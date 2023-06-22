package com.test.service1;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.test.domain.MemberVO;
import com.test.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.test.config.RootConfig.class, com.test.config.SecurityConfig.class})
@Log4j2
public class MemberServiceTests {
	@Setter(onMethod_ =  @Autowired)
	private MemberService service;
	
	@Test
	public void testSignupMember() {
		MemberVO vo = new MemberVO("d","d","d","d","d");
		service.signup(vo);
	}
}