package com.test.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.domain.ImageVO;
import com.test.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ImageSerivce {
	@Setter(onMethod_= @Autowired)
	private BoardMapper mapper;
	
	public List<ImageVO> getList(){
		List<ImageVO> list = new ArrayList<ImageVO>();
		for (int i=0; i<15; i++) {
			 ImageVO vo = new ImageVO("/resources/img/download_" + i + ".jpg", 
					 "이재용" + i , String.valueOf(i));
			 list.add(vo);
		}
		return list;
	}
}
