<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 
 
<style>
table {
    width: 100%;
    height: 100%;
    border-collapse: collapse;
  }

  .center {
    text-align: center;
    vertical-align: middle;
  }

  .wrapped_login {
    max-width: 600px;
    margin: 0 auto;
   	padding: 30px;
    padding-left: 10px;
    background-color: #f5f5f5;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  .wrapped_login label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
  }

  .wrapped_login input[type="email"],
  .wrapped_login input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  .wrapped_login .error {
    color: red;
    margin-bottom: 10px;
  }

  .wrapped_login .login_button {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  .wrapped_login .login_button:hover {
    background-color: #0056b3;
  }

  .wrapped_login .additional_content {
    margin-top: 20px;
    text-align: center;
  }

  .wrapped_login .additional_content p {
    margin-bottom: 10px;
  }

  .wrapped_login .additional_content a {
    color: #007bff;
  }

  .wrapped_login .additional_content a:hover {
    text-decoration: underline;
  }

  .wrapped_login .social_buttons {
    display: flex;
    justify-content: center;
    margin-top: 20px;
  }

  .wrapped_login .social_buttons button {
    padding: 10px 20px;
    margin-right: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  .wrapped_login .social_buttons button:last-child {
    margin-right: 0;
  }

  .wrapped_login .social_buttons button:hover {
    background-color: #0056b3;
  }
  #wrap{
  height:930px;
  }
  
</style>
<script>
  $(function() {
    let error = "${error}";
    console.log(error);
    if (error === "") {
      return;
    }
    if (error === "nonuser") {
      $("#userid").focus();
    } else {
      $("#userpw").focus();
    }
    let msg = (error === "nonuser") ? "존재하지 않는 Email입니다." : "비밀번호가 일치하지 않습니다.";
    alert(msg);
  });

  $(function() {
    let msg = "${msg}";
    if (msg === "") {
      return;
    }
    let txt;
    if (msg === "logout") {
      txt = "로그아웃 되었습니다.";
    }
    alert(txt);
  });

  $(function() {
    $(".login_form").submit(function(e) {
      let email = $("#userid").val();
      let password = $("#userpw").val();
      let hasError = false;

      if (email === "") {
        e.preventDefault();
        $("#error_userid").text("Email을 입력하세요.");
        hasError = true;
      } else {
        $("#error_userid").text(""); // Clear the error message
      }

      if (password === "") {
        e.preventDefault();
        $("#error_userpw").text("비밀번호를 입력하세요.");
        hasError = true;
      } else {
        $("#error_userpw").text(""); // Clear the error message
      }

      if (hasError) {
        return;
      }
    });
  });
</script>
<div id = "wrap">
<table>
  <tr>
    <td colspan="2" class="center">
      <div class="wrapped_login">
      	<a href="/"><img src="/resources/img/banner.jpg" style="height: 95px;"></a>
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
            <button class="login_button" type="submit">로그인</button>
          </div>
        </form>

        <div class="additional_content">
          <a href="/member/signup">회원가입</a> |
          <a href="/member/forgot-password">비밀번호 찾기</a>
        </div>
      </div>
    </td>
  </tr>
</table>
 </div>

 <%@include file="../includes/footer.jsp" %>