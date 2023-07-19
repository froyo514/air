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
<title>title</title>
<style>
   * {
        margin: 0 auto;
        padding: 0;
        font-family: "Noto Sans KR", sans-serif;
        text-decoration: none; /* 링크의 밑줄 제거 */
  		color: inherit; /* 링크의 색상 제거 */
      }

      #header {
        height:200px;
        width: 100%;
      }
      
      #banner-text{
      
      }

      #top-header {
        height: 120px;
        background-color:white;
        padding: 10px 0;
        box-sizing: border-box;
      }
      #header-right{
        float:right;
        width: 300px;
      }
      #header-left{
        float:left;
        width: 300px;
      }

		.bottom-header {
        float: left;
        height: 80px;
        width: 100%;
        background-color: rgb(162, 211, 255);
      }
        /* 로그인회원가입오시는길 호버 */
      .top-nav ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
      }

      .top-nav li {
        float: right;
      }

      .top-nav li a {
        display: block;
        color: #fff;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
      }

      .top-nav li a:hover {
        background-color: #555;
      }

        /* 홈으로회사소개설문참여 호버*/
       .bottom-header {
    display: flex;
    justify-content: center;
    
    margin: 0 auto; /* 중앙 정렬을 위해 왼쪽과 오른쪽 여백을 자동으로 설정합니다. */
  }
       
        
      .bottom-header ul {
        font-size: 35px;
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        float: right;
      }

      .bottom-header li {
        float: left;
      }

      .bottom-header li a {
        display: block;
        color: #333;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        
      }

      .bottom-header ul a:hover {
        background-color: #ddd;
      }
      
      

      .hoverable:hover .sub-menu {
        display: block;
      }

      .sub-menu {
        display: none;
        position: absolute;
        background-color: #ddd;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
      }

      .sub-menu li {
        float: none;
      }

      .sub-menu li a {
        padding: 12px 16px;
        color: #333;
        text-decoration: none;
        display: block;
        text-align: left;
      }

      .sub-menu li a:hover {
        background-color: #ccc;
      }
		 
</style>
<script>

</script>
</head>
<body>
<div id="header">
        <div id ="top-header">
          <div id = "header-right">
            <div class = "container">
		<div class = "wrapper">
			<div class= "wrapper_head">
				<div class = "wrapper_title">
				
				</div>
				<div class="wrapper_sub">
					<c:if test="${!empty auth }">
						<span><c:out value="${auth.username }"></c:out>님 접속중입니다.</span>
					</c:if>
				</div>
				<nav class="wrapper_menu">
					<a href="/board/map"><span class = "menu-item">오시는길</span></a>
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
          </div>
          <div id = "header-left">
             <div class="banner-text"><a href="/"><img src="/resources/img/banner.jpg" style="height: 95px;"></a></div>
          </div>
        </div>
        <div class="bottom-header" >
             <nav>
              <ul>
                <li class="hoverable">
                  <a href="/board/sogae">회사소개</a>
                  <ul class="sub-menu">
                    <li><a href="#greeting">회사연혁</a></li>
                    <li><a href="#business-areas">사업분야</a></li>
                    <li><a href="#key-achievements">주요실적</a></li>
                  </ul>
                </li>
                
                <li class="hoverable">
               		<a href="/survey2nd/registerSurvey">설문만들기</a>
                  <ul class="sub-menu">
                    <li><a href="/newsurvey/man2">서비스소개</a></li>
                    <li><a href="#marketing-research">설문의뢰</a></li>
                    <li><a href="#opinion-research">견적사례/문의</a></li>
                  </ul>
                 </li>
                 <li class="hoverable">
                	<a href="/survey2nd/">설문참여하기</a>
                  <ul class="sub-menu">
                	  <li><a href="#public-opinion">서비스소개</a></li>
                  </ul>
                </li>
                 <li class="hoverable">
               		<a href="/board/list">문의게시판</a>
                  <ul class="sub-menu">
                    <li><a href="#public-opinion">공지사항</a></li>
                    <li><a href="#marketing-research">이벤트</a></li>
                  </ul>
                 </li>
                 
              </ul>
            </nav>
        </div>
      </div>
</body>
</html>


<%-- <nav class="wrapper_menu">
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
				</nav> --%>