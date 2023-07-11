package com.test.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.oooo.SurveyForm;



@RequestMapping("/newsurvey/*")
@Controller
public class NewSurveyController {
	private List<SurveyResponse> responses = new ArrayList<>();
	private SurveyForm registeredSurveyForm;

	@GetMapping("/")
	public String main(Model model) {
		return "/newsurvey/main";
	}
	
	@GetMapping("/man")
	public String man(Model model) {
		return "/survey2nd/man";
		
	}
	
	@GetMapping("/man2") //설문조사양식을 등록한다
    public String showSurveyForm(Model model) {
        model.addAttribute("surveyForm", new SurveyForm());
        return "/survey2nd/man2";
    }
    
	
	@PostMapping("/form") 
    public String submitSurveyForm(@ModelAttribute("surveyForm") SurveyForm surveyForm) {
        // 설문조사 양식을 등록하는 로직 작성
        registeredSurveyForm = surveyForm;

        // 등록 완료 메시지를 표시하고 응답 페이지로 이동
        return "/survey2nd/man3";
    }
	
	 @GetMapping("/man4") 
	    public String showSurveyResponse(Model model) {
	        // 등록된 설문조사 양식을 모델에 추가하여 응답 페이지에 표시
	        model.addAttribute("surveyForm", registeredSurveyForm);
	        return "/survey2nd/man4";
	    }
    

    @GetMapping("/survey/thankyou")
    public String showThankYouPage() {
        return "thankYou";
    }
   
}
  
