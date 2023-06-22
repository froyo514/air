package com.test.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.domain.AuthVO;
import com.test.domain.MemberVO;
import com.test.service.MemberService;

import lombok.Setter;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Setter(onMethod_=@Autowired)
	private MemberService memberService;
	
	@GetMapping("/signup")
	public String signupForm() {
		return "/member/signupForm";
	}
	

	@GetMapping("/login")
	public String login() {
		return "/member/loginForm";
	}
	
	  @PostMapping("/login") 
	  public String loginSubmit(MemberVO vo, HttpSession
	  session,RedirectAttributes rttr, Model model) { 
		  try { AuthVO authVO =
	  memberService.authenticate(vo); session.setAttribute("auth", authVO); String
	  userURI = (String) session.getAttribute("userURI"); 
	  if(userURI != null) {
	  session.removeAttribute("userURI"); 
	  return "redirect:"+userURI;
	  
	  } 
	  return "redirect:/"; 
	  }catch (Exception e) { rttr.addFlashAttribute("error",
	  e.getMessage()); rttr.addFlashAttribute("memberVO",vo); 
	  return
	  "redirect:/member/login"; 
	  } 
		  }

  @GetMapping("/logout")
  public String logout( HttpSession session,RedirectAttributes rttr) {
	  session.removeAttribute("auth");
	  rttr.addFlashAttribute("msg", "logout");
	  return "redirect:/member/login";
  }
  
  @PostMapping("/signup")
  public String signupSubmit(MemberVO vo,HttpSession session) {
	  String userpw = vo.getUserpw();
	  memberService.signup(vo);
	  try { 
		  vo.setUserpw(userpw);
		  AuthVO authVO = memberService.authenticate(vo);
		  session.setAttribute("auth", authVO);
	  } catch (Exception e) {
	  }
	  return "redirect:/";
  	}
	
  
 
}