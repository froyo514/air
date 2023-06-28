package com.test.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.test.domain.BoardVO;
import com.test.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Aspect
@Component /// 컴포넌트는 클래스 레벨 @
public class FunctionAdvice {
	
	@Setter(onMethod_= {@Autowired})
	private PasswordEncoder pwencoder;
	
	
	
	//@Before("execution(* com.test.service.*.*(..))") // 패키지서비스의 전체
	//@Before("execution(* com.test.service.BoardService.*(..))") // 패키지. 컴.테스트.보드서비스의. 클래스
	//@Before("execution(* com.test.service.BoardService.get(..))") //겟 함수만
	public void boardBefore() {
		log.info("===========boardBefore===========");
		}
	
	
	//@Before("execution(* com.test.service.MemberService.signup(..))")
	public void memberSignup(JoinPoint jp) {
		try {
			MemberVO vo = (MemberVO) jp.getArgs() [0];
			vo.setUserpw(pwencoder.encode(vo.getUserpw()));
		} catch(Throwable e) {
			e.printStackTrace();
		}
	}
	@Around("execution(* com.test.service.BoardService.modify(..))")
	public Object boardmodfiy(ProceedingJoinPoint pjp) {
		Object result = null;
		try {
			BoardVO vo = (BoardVO) pjp.getArgs() [0];
			vo.setTitle("TT" + vo.getTitle());
			result = pjp.proceed();
		} catch(Throwable e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
