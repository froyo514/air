package com.test.controller;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.domain.AnswerDTO;
import com.test.domain.QuestionType;
import com.test.domain.QuestionVO;
import com.test.domain.SurveyVO;
import com.test.domain.SurveyValidator;
import com.test.service.AnswerService;
import com.test.service.QuestionAnswerService;
import com.test.service.QuestionService;
import com.test.service.SurveyService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/survey2nd/*")
@AllArgsConstructor
public class Survey2ndController {
	private SurveyService surveyService; 
	private QuestionService questionService;
	private AnswerService answerService;
	private QuestionAnswerService questionAnswerService;
	
	@GetMapping("/")
	public String main(Model model) {
		model.addAttribute("surveyList", surveyService.getSurveyList());
		return "/survey2nd/main";
	}
	@GetMapping("/registerSurvey")
	public String registerSurveyForm(Model model) {
		model.addAttribute("surveyVO", new SurveyVO());
		return "/survey2nd/registerSurvey";
		
	}
	@GetMapping("/participateSurvey")
	public String participateSurveyForm(@RequestParam("survey_id") int survey_id,
			Model model) {
		model.addAttribute("questionList",questionService.getQuestionList(survey_id));
		return "/survey2nd/participateSurvey";
	
		}
	@PostMapping("/participateSurvey")
	public String participateSurveySubmit(AnswerDTO dto, Model model) {
		answerService.registerAnswerList(dto.getList());
		return "redirect:/survey2nd/";
	}
	
	@GetMapping("/getSurveyResult")
	public String getSurveyResult(@RequestParam("survey_id") int survey_id,
			Model model) {
		model.addAttribute("survey",surveyService.getSurvey(survey_id));
		model.addAttribute("questionAnswerList",
				questionAnswerService.getQuestionAnswerList(survey_id));
		return "/survey2nd/getSurveyResult";
			
		
	}
	

	
	
	@PostMapping("/registerSurvey")
	public String registerSurveySubmit(SurveyVO vo, @RequestParam("questions")String questions,
			Errors errors) {
		vo.setQuestions(questions);
		new SurveyValidator(). validate(vo, errors);
		if(errors.hasErrors()) {
			return "/survey2nd/registerSurvey";
		}
		List<QuestionVO> list = new ArrayList<QuestionVO>();
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(questions);
			for(int i=0; i<jsonArray.size(); i++) {
				JSONObject jObj = (JSONObject)jsonArray.get(i);
				QuestionVO qVo = new QuestionVO();
				qVo.setQuestion_no(((Long)jObj.get("question_no")).intValue());
				qVo.setQuestion_text((String)jObj.get("question_text"));
				qVo.setQuestion_type(QuestionType.valueOf((String)jObj.get("question_type")));
				qVo.setQuestion_options((String)jObj.get("question_options"));
				Object options = jObj.get("question_options");
				qVo.setQuestion_options(options == null ? "" :(String)jObj.get("question_options"));
				list.add(qVo);
			}
		}catch (Exception e) {
			
		}
		surveyService.registerSurvey(vo, list);
		return "redirect:/survey2nd/";
	}
	
	@PostMapping("/test1")
    public String registerSurveySubmit(@ModelAttribute("surveyVO") SurveyVO surveyVO,
                                       @ModelAttribute("questionVO") QuestionVO questionVO) {
		
		
		System.out.println("SurveyVO: " + surveyVO);
	    System.out.println("QuestionVO: " + questionVO);
	    
        // 설문조사 등록
        surveyService.registerSurvey(surveyVO);

        // 질문 등록
        questionVO.setSurvey_id(surveyVO.getSurvey_id());
        questionService.registerQuestion(questionVO);

        return "redirect:/survey2nd/registerSurvey";
    }
	
}
