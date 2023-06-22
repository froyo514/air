<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
            <nav class="top-nav">
              <ul>
                <li><a href="/">오시는길</a></li>
                <li><a href="/member/signup">회원가입</a></li>
                <li><a href="/member/login">로그인</a></li>
              </ul>
            </nav>
          </div>
          <div id = "header-left">
            <div class="banner-text"><a href="/">한국리서치</a></div>
          </div>
        </div>
        <div class="bottom-header" >
            <nav>
              <ul>
                <li class="hoverable">
                  <a href="#xnb">회사소개</a>
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
                    <li><a href="#public-opinion">공공/여론조사</a></li>
                    <li><a href="#marketing-research">마케팅조사</a></li>
                    <li><a href="#opinion-research">여론조사</a></li>
                    <li><a href="#opinion-research">학술조사</a></li>
                  </ul>
                </li>
                <li class="hoverable">
               		<a href="/">설문만들기</a>
                  <ul class="sub-menu">
                    <li><a href="#public-opinion">서비스소개</a></li>
                    <li><a href="#public-opinion">설문작성</a></li>
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
      </div>

  <div id ="footer">
    <span style="color:rgb(88, 85, 81);" class="wixui-rich-text__text">
      서울특별시 동작구 동작대로99길 99, 99층 
      (주)한국정책리서치&nbsp; |&nbsp; 
      대표이사 : 윤종현&nbsp; |&nbsp; 
      사업자등록증 : 999-999-99999
       대표전화 : 02-999-9999&nbsp; |&nbsp; 
       문의사항 : <a data-auto-recognition="true" href="mailto:support@kprg.re.kr" class="wixui-rich-text__text">support@kprg.re.kr</a>&nbsp; |&nbsp; </span>
      </div>
    </div>
  </body>
</html>
