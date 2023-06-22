package com.test.mapper;

import java.util.List;

import com.test.domain.BoardVO;
import com.test.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> getListWithPaging(Criteria criteria);
	public int getTotalCount(Criteria criteria);
	public void insert(BoardVO vo);
	public List<BoardVO> getList();
	public BoardVO read(Long bno);
	public int update(BoardVO vo);
	public int delete(Long bno);
}
