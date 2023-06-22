package com.test.config;



import java.util.ArrayList;
import java.util.List;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.test.interceptor.AuthCheckInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.test.controller"})
public class ServletConfig implements WebMvcConfigurer{

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");	//경로 시작
		bean.setSuffix(".jsp");				//.jsp로 끝나는
		registry.viewResolver(bean);
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource ms = new ResourceBundleMessageSource();
		ms.setBasenames("msg.label");
		ms.setDefaultEncoding("UTF-8");
		return ms;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		List<String> list = new ArrayList<String>();
		list.add("/board/register");
		registry.addInterceptor(authCheckInterceptor())
			.addPathPatterns(list);
	}
	
	@Bean
	public AuthCheckInterceptor authCheckInterceptor(){
		return new AuthCheckInterceptor();
	}
	
	//게시판에 첨부파일넣기
	@Bean 
	public MultipartResolver multipartResolver() {
		StandardServletMultipartResolver resolver = 
				new StandardServletMultipartResolver();
		return resolver;
	}
//ServletConfig 화면 관련 config
}


