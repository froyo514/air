package com.test.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.test.domain.BoardVO;
import com.test.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.test.config.RootConfig.class, com.test.config.SecurityConfig.class})
@Log4j2
	public class BoardMapperTests {
		@Setter(onMethod_=@Autowired)
		private BoardMapper mapper;
		
		@Test
		public void testInsert() {
				BoardVO vo = new BoardVO();
				vo.setTitle("게시판테스트");
				vo.setContent("게시판테스트글내용....");
				vo.setWriter("12345@naver.com");
				mapper.insert(vo);
		}
	}


