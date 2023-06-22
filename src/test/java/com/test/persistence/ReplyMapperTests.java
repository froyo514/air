package com.test.persistence;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.test.domain.ReplyVO;
import com.test.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.test.config.RootConfig.class, com.test.config.SecurityConfig.class})
@Log4j2
	public class ReplyMapperTests {
		@Setter(onMethod_=@Autowired)
		private ReplyMapper mapper;
		
		@Test
		public void testInsert() {
			long bno =38l;
			for (int i=0; i<10; i++) {
				ReplyVO vo = new ReplyVO();
				vo.setBno(bno);
				vo.setReply("댓글테스트" + i);
				vo.setReplyer("replyer" + i);
				mapper.insert(vo);
		}
	}
		//@Test
		public void testRead() {
			long targetRno = 21;
			ReplyVO vo = mapper.read(targetRno);
			log.info(vo);
		}
		//@Test
		public void testDelete() {
			long targetRno = 31;
			int count = mapper.delete(targetRno);
			log.info("DELETE COUNT: " + count);
		}
		//@Test
		public void testUpdate() {
			long targetRno = 41;
			ReplyVO vo = mapper.read(targetRno);
			vo.setReply("Update Reply ");
			int count = mapper.update(vo);
			log.info("UPDATE COUNT: " + count);
		}
		//@Test
		public void testGetList() {
			long targetBno = 831;
			List<ReplyVO> replies = mapper.getList(targetBno);
			for (ReplyVO vo : replies) {
			log.info(vo);
				}
		}
}


