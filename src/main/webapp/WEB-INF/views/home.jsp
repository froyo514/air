<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
<%@include file="./includes/header.jsp" %>


	
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
  setInterval(fadeSlides, 2500); // 이후 1.5초마다 실행
}, 50);
</script>

<style>

/* 컨텐츠 이미지슬라이드*/

#contents{
  background-color: green;
  width: 100%;
  height: 740px;
}


.con {
  position: relative;
  width: 100%;
  height: 740px;
  overflow: hidden;
}

.slide {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  opacity: 0;
  transition: opacity 1s;
  object-fit: contain;
}


.slide.active {
  opacity: 1;
}
#contents>div{
	text-align:center;
}
#contents>div>span{
	z-index: 1;
    position: relative;
    top: -440px;
    font-size: 70px;
    font-weight: bold;
    color:white;
    background-color: rgb(0 0 0 / 50%);
	
}
	
</style>
    <div id="wrap">
        <div id="contents">
          <div class="con">
  			<img src="/resources/img/main6.jpg" class="slide" />
 			<img src="/resources/img/main4.jpg" class="slide" />
  			<img src="/resources/img/main5.jpg" class="slide" />
       	 </div>
       		<div><span>빠르고 신뢰할수있는 온라인서베이</span></div>
      </div>
    </div>
<%@include file="./includes/footer.jsp" %>