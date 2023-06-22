package com.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.test.domain.Criteria;
import com.test.domain.ReplyVO;

public interface ReplyMapper{

	public int insert(ReplyVO vo);
	public ReplyVO read(Long bno);
	public int delete(Long rno);
	public int update(ReplyVO reply);
	public List<ReplyVO> getList(Long bno);

	public List<ReplyVO> getListWithPaging(@Param("criteria") Criteria criteria,
			@Param("bno") Long bno);
	public int getTotalCount(Long bno);
	
}
