<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
 
  <%@include file="../includes/header.jsp" %>
 
 <style>

</style>


<script>


$(function() {
let error = "${error}";
console.log(error);
if (error === ""){
	return;
}
if(error === "nonuser"){
	$("#userid").focus();
}else {
	$("#userpw").focus();
}
let msg = (error === "nonuser") ? "존재하지 않는 Email입니다." : "비밀번호가 일치하지 않습니다.";
alert(msg);
});

$(function() {
	let msg = "${msg}";
	if (msg === ""){
		return;
	}
	let txt;
	if (msg === "logout"){
		txt = "로그아웃 되었습니다.";
	}
	alert(txt);
});
</script>


<div class="wrapped_login">
  <form action="/member/login" class="login_form" method="post">
    <div class="form_id">
      <label for="username">E-mail</label>
      <input
        type="email"
        class="id_control"
        id="userid"
        name="userid"
        placeholder="E-mail을 입력하세요"
        value="${memberVO.userid}"
      />
      <div class="error" id="error_userid"></div>
    </div>
    <div class="form_pw">
      <label for="password">비밀번호</label>
      <input
        type="password"
        class="pw_control"
        id="userpw"
        name="userpw"
        placeholder="비밀번호을 입력하세요"
      />
      <div class="error" id="error_userpw"></div>
    </div>
    <div class="form_login_button">
      <button class="login_button" type="submit">
        로그인
      </button>
    </div>
  </form>

  <div class="additional_content">
    <p>다른 계정이 있으신가요?</p>
    <a href="/member/register">회원가입</a> |
    <a href="/member/forgot-password">비밀번호 찾기</a>
  </div>

  <div class="social_login">
    <p>소셜 계정으로 로그인</p>
    <div class="social_buttons">
      <button>Facebook</button>
      <button>Google</button>
      <button>Twitter</button>
    </div>
  </div>
</div>
 <%@include file="../includes/footer.jsp" %>