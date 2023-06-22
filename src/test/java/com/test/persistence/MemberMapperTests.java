package com.test.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.test.domain.MemberVO;
import com.test.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.test.config.RootConfig.class, com.test.config.SecurityConfig.class})
@Log4j2
public class MemberMapperTests {
	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	//@Test
	public void testInsert() {
			MemberVO vo = new MemberVO();
			vo.setUserid("niceguy2@ganmail.net");
			vo.setUsername("김말똥");
			vo.setUserpw("12345");
			vo.setLocation("서울");
			vo.setGender("남성");
			mapper.insert(vo);
	}
}
