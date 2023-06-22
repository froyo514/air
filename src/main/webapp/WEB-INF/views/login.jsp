<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	$(function() {
		var error = '<c:out value="${param.error}"/>';
		if(error){
			alert("아이디 혹은 비밀번호 입력 오류입니다.");
			history.replaceState(null, null, location.pathname);
		}
	});

	
</script>
<body>
   
<h1> 로그인</h1>
	<form action="/login2" method="post">
	
	 <p>
	 	<label> 아이디 : <input name ="id" /></label>
	</p>
	 <p>
	 	<label> 비밀번호: <input type="password"name ="pwd" /></label>
	</p>
	 
	<input type="submit" value="로그인">
	<input type="submit" value="취소">
	</form>
</body>
</html>