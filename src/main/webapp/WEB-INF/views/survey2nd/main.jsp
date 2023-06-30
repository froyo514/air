<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
   <%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Survey main</title>
</head>
<style>
.con {
		display: flex;
		flex-wrap: wrap;
	}

	.box {
		width: 400px;
		margin: 10px;
	}

	.survey {
		position: relative;
	}

	.survey img {
		width: 100%;
		height:100%;
		transition: transform 0.3s ease;
	}

	.survey:hover img {
	}

	.survey figcaption {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.7);
		color: #fff;
		padding: 10px;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		opacity: 0;
		transition: opacity 0.3s ease;
	}

	.survey:hover figcaption {
		opacity: 1;
	}

	.survey figcaption button {
		background-color: #fff;
		color: #000;
		padding: 5px 10px;
		border: none;
		cursor: pointer;
	}

	.survey figcaption a {
		margin-top: 10px;
		color: #fff;
		text-decoration: underline;
	}
</style>

<body>
	<h1> 설문참여하기 </h1>
	<c:if test="${!empty surveyList }">
		<c:forEach items="${surveyList }" var="item" varStatus="status">
			<p>
				<label><c:out value="${status.index+1 }.${item.survey_name }"/>:</label>
				<label><c:out value="${item.survey_desc }"/></label>
				<a href="/survey2nd/participateSurvey?survey_id=<c:out value="${item.survey_id }"/>">참여</a>
				&nbsp;&nbsp;&nbsp;
				<a href="/survey2nd/getSurveyResult?survey_id=<c:out value="${item.survey_id }"/>">결과</a><br/>
			</p>
				
		</c:forEach>
	</c:if>
	<!-- <h1>설문조사 등록 : <a href=<c:url value="/survey2nd/registerSurvey"/>>시작</a></h1> -->
	<c:out value="${status.index}.${item.survey_name }"/>
<div class="con">
	<div class="box">
	<h1>정부정책조사</h1>
		<div class="survey">
			<img src="/resources/img/survey2.jpg">
			<figcaption>
				텍스트 내용
				<button>버튼</button>
			</figcaption>
		</div>
	</div>

	<div class="box">
	<h1>기업만족도조사</h1>
		<div class="survey">
			<img src="/resources/img/survey3.jpg">
			<figcaption>
				텍스트 내용
				<button>버튼</button>
			</figcaption>
		</div>
	</div>

	<div class="box">
	<h1>브랜드마케팅조사</h1>
		<div class="survey">
			<img src="/resources/img/survey4.jpg">
			<figcaption>
				텍스트 내용
				<button>버튼</button>
			</figcaption>
		</div>
	</div>
</div>
</body>
</html>

