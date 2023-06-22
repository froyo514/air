package com.test.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.domain.SurveyData;
import com.test.service.SurveyService;

@Controller
@RequestMapping("/survey/*")
public class SurveyController {
	private SurveyService surveyService;
	
	@Autowired
	public SurveyController(SurveyService surveyService ) {
		this.surveyService = surveyService;
	}
	
	
	@RequestMapping(value = "/55", method = RequestMethod.GET)
	public String main() {
		return "/survey/main";
	}
	
	 @GetMapping("/part1") 
	public String part1From() {
		
	return "/survey/part1/part1Form";
	}
	 
	 @PostMapping("/part1")
	 public String part1Submit(@ModelAttribute SurveyData data, RedirectAttributes rttr) {
		 rttr.addFlashAttribute("data",data);
		 return "redirect:/";
    }
	 
	 @GetMapping("/part2") 
		public String part2From(Model model) {
		 	model.addAttribute("questions", surveyService.getSurveyQuestions());
			
		return "/survey/part2/part2Form";
		}
	 
	 @PostMapping("/part2")
	 public String part2Submit(@ModelAttribute SurveyData data, RedirectAttributes rttr) {
		 rttr.addFlashAttribute("data",data);
		 return "redirect:/";
    }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
}