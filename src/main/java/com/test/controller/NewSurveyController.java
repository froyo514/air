package com.test.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping("/newsurvey/*")
@Controller
public class NewSurveyController {

    
	@GetMapping("/")
	public String main(Model model) {
		return "/newsurvey/main";
	}
	
	@GetMapping("/man")
	public String man(Model model) {
		return "/survey2nd/man";
		
	}
    @PostMapping("/surveySumbit")
    public String submitSurvey(HttpServletRequest request) {
        // 설문조사 데이터 처리 로직을 구현합니다.
        String surveyName = request.getParameter("surveyName");
        String surveyContent = request.getParameter("surveyContent");
        String[] surveyTypes = request.getParameterValues("surveyType");
        String[] answers = request.getParameterValues("answer");


        return "redirect:/newsurvey/man";
    }
}
