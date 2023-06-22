<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="/resources/css/headfoot.css">
<link rel="stylesheet" href="/resources/css/signup.css">
<link rel="stylesheet" href="/resources/css/.css">
<link rel="stylesheet" href="/resources/css/logout.css"> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" type="text/css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Spring project</title>
<style>
header {
  background-color: #000000;;
  color: #fff;
  padding: 20px;
  text-align: center;
}
</style>
<script>

</script>
</head>
<body>
<header>
	<div class = "container">
		<div class = "wrapper">
			<div class= "wrapper_head">
				<div class = "wrapper_title">
					<span>Spring project</span>
				</div>
				<div class="wrapper_sub">
					<c:if test="${!empty auth }">
						<span><c:out value="${auth.username }"></c:out>님 접속중입니다.</span>
					</c:if>
				</div>
				<nav class="wrapper_menu">
					<a href="/">홈화면</a>
					<a href="/board/list"><span class = "menu-item">게시판</span></a>
					<a href="/member/signup"><span class = "menu-item">회원가입</span></a>
					<c:choose>
					<c:when test="${not empty auth}">
						<a href="/member/logout"><span class="menu-item">로그아웃</span></a>
					</c:when>
					<c:otherwise>
						<a href="/member/login"><span class="menu-item">로그인</span></a>
					</c:otherwise>
					</c:choose>
				</nav>
			</div>
		</div>
	</div>
</header>
</body>
</html>