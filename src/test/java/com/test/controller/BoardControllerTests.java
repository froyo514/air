package com.test.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

	@RunWith(SpringJUnit4ClassRunner.class)
	@WebAppConfiguration
	@ContextConfiguration(classes = {com.test.config.RootConfig.class,
			com.test.config.ServletConfig.class,com.test.config.SecurityConfig.class })
	@Log4j2
	public class BoardControllerTests {
		@Setter(onMethod_= {@Autowired})
		private WebApplicationContext Context;
		
	    private MockMvc mockMvc;

	    @Before
	    public void setup() {
	        mockMvc = MockMvcBuilders.webAppContextSetup(Context).build();
	    }
	    @Test
	    public void testregister() throws Exception{
	    	String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
	    			.param("title", "토끼").param("content","거북이")
	    			.param("writer","미상"))
	    			.andReturn()
	    			.getModelAndView()
	    			.getViewName();
	    	log.info(resultPage);
	    }
}
