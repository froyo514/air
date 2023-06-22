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
public class MemberControllerTests {
	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext Context;
	
    private MockMvc mockMvc;

    @Before
    public void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(Context).build();
    }
@Test
public void testSignup() throws Exception{
	String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/member/signup")
			.param("userid", "coolguy@gamil.com").param("username","모자란3")
			.param("userpw","12345").param("location","대구")
			.param("gender","남성"))
			.andReturn()
			.getModelAndView()
			.getViewName();
	log.info(resultPage);
}

}



/*public class MemberControllerTests {

    private MockMvc mockMvc;

    @Autowired
    private WebApplicationContext webApplicationContext;

    @Before
    public void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }

    @Test
    public void testSignup() throws Exception {
        MemberVO member = new MemberVO();
        member.setUserid("john");
        member.setUserpw("password");
        member.setUsername("John Doe");
        member.setLocation("New York");
        member.setGender("Male");

        mockMvc.perform(MockMvcRequestBuilders.post("/member/signup")
                .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                .param("userid", member.getUserid())
                .param("userpw", member.getUserpw())
                .param("username", member.getUsername())
                .param("location", member.getLocation())
                .param("gender", member.getGender()));
    } */
   