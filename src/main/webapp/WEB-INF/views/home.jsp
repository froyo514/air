<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/home.css">
<html>
<head>
	

<script type="text/javascript">
var currentIndex = 0;

function fadeSlides() {
  var slides = document.getElementsByClassName("slide");
  for (var i = 0; i < slides.length; i++) {
    slides[i].classList.remove("active");
  }

  slides[currentIndex].classList.add("active");
  currentIndex = (currentIndex + 1) % slides.length;
}

setTimeout(function() {
  fadeSlides(); // 처음 1회 실행
  setInterval(fadeSlides, 1500); // 이후 1.5초마다 실행
}, 50);
</script>

<style>

</style>

</head>
  <body>
    <div id="wrap">
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
            <div id="banner-text"><a href="/"><img src="/resources/img/banner.jpg" style="height: 90px;"></a></div>
          </div>
        </div>
        <div class="bottom-header" >
            <nav>
              <ul>
                <li class="hoverable">
                  <a href="/board/sogae">회사소개</a>
                  <ul class="sub-menu">
                    <li><a href="#greeting">인사말</a></li>
                    <li><a href="#greeting">회사연혁</a></li>
                    <li><a href="#business-areas">사업분야</a></li>
                    <li><a href="#key-achievements">주요실적</a></li>
                  </ul>
                </li>
                <li class="hoverable">
                	<a href="#xnb">설문참여하기</a>
                  <ul class="sub-menu">
                    <li><a href="/survey2nd/">공공/여론조사</a></li>
                    <li><a href="#marketing-research">마케팅조사</a></li>
                    <li><a href="#opinion-research">여론조사</a></li>
                    <li><a href="#opinion-research">학술조사</a></li>
                  </ul>
                </li>
                <li class="hoverable">
               		<a href="/">설문만들기</a>
                  <ul class="sub-menu">
                    <li><a href="#public-opinion">서비스소개</a></li>
                    <li><a href="/survey2nd/registerSurvey">설문작성</a></li>
                    <li><a href="#marketing-research">설문의뢰</a></li>
                    <li><a href="#opinion-research">견적사례/문의</a></li>
                  </ul>
                 </li>
                 <li class="hoverable">
               		<a href="/board/list">인재채용</a>
                    <ul class="sub-menu">
                  	  <li><a href="#public-opinion">조직소개</a></li>
                  	  <li><a href="#marketing-research">채용안내</a></li>
                   	 <li><a href="#opinion-research">채용공고</a></li>
                  </ul>
                 </li>
                 <li class="hoverable">
               		<a href="/board/list">고객지원(게시판)</a>
                  <ul class="sub-menu">
                    <li><a href="#public-opinion">공지사항</a></li>
                    <li><a href="#marketing-research">문의게시판</a></li>
                    <li><a href="#opinion-research">진행중인이벤트</a></li>
                  </ul>
                 </li>
              </ul>
            </nav>
        </div>
      </div>
        <div id="contents">
        
          <div class="slider">
  			<img src="/resources/img/main6.jpg" class="slide" />
 			<img src="/resources/img/main4.jpg" class="slide" />
  			<img src="/resources/img/main5.jpg" class="slide" />
       	 </div>
       	 <div>
       	 	<span>정확하고 신뢰할수있는 온라인 리서치</span>
       	 </div>
      </div>
<%@include file="./includes/footer.jsp" %>