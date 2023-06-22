<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
  <link rel="stylesheet" href="/resources/css/login.css">
 <%@include file="../includes/header.jsp" %>
 <style>
/* 로그인 폼 스타일 */
.wrapped_login {
  background-color: #f8f8f8;
  padding: 20px;
  border-radius: 8px;
  width: 300px;
  margin: 0 auto;
}

.login_form {
  display: flex;
  flex-direction: column;
}

.login_form label {
  margin-bottom: 10px;
  font-weight: bold;
}

.id_control,
.pw_control {
  padding: 10px;
  border-radius: 4px;
  border: 1px solid #ccc;
  margin-bottom: 10px;
}

.error {
  color: #ff0000;
  margin-top: 5px;
}

.login_button {
  background-color: #333;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.login_button:hover {
  background-color: #555;
}

.additional_content {
  margin-top: 20px;
  text-align: center;
}

.additional_content p {
  font-size: 14px;
  margin-bottom: 10px;
}

.additional_content a {
  color: #333;
  text-decoration: none;
  margin: 0 5px;
}

.social_login {
  margin-top: 20px;
  text-align: center;
}

.social_login p {
  font-size: 14px;
  margin-bottom: 10px;
}

.social_login .social_buttons {
  display: flex;
  justify-content: center;
}

.social_login .social_buttons button {
  margin: 0 5px;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
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