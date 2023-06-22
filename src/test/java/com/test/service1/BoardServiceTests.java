package com.test.service1;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.test.domain.BoardVO;
import com.test.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.test.config.RootConfig.class, com.test.config.SecurityConfig.class})
@Log4j2
public class BoardServiceTests {
	@Setter(onMethod_ =  @Autowired)
	private BoardService service;
	
	@Test
	public void testInsertBoard() {
		BoardVO vo = new BoardVO("해님","달님","호랑이");
		service.register(vo);
	}
}