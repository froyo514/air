<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<%@include file="../includes/header.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
    
</head>

<style>

#staticMap{
margin:auto;
}

#text{
	font-size:90px;
	height:250px;
	text-align:center;
	text-decoration-line: underline;
    text-underline-position:under;
}
</style>
<body>
<!-- 지도를 표시할 div 입니다 -->
<div id ="text">오시는길</div>
<div id="staticMap" style="width:800px;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=53440126ce55db7e138fdc0ebcc839d0"></script>
<script>
// 이미지 지도에서 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커는 Object 형태입니다
var marker = {
    position: markerPosition
};

var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: marker // 이미지 지도에 표시할 마커 
    };    

// 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
</script>
</body>
</html>
