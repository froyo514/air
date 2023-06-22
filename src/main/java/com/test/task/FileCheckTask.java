package com.test.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.test.mapper.BoardAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Component
public class FileCheckTask {
	@Setter(onMethod_=@Autowired)
	private BoardAttachMapper attachMapper;
}
