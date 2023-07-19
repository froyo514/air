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
        }

        .box {
            position: relative;
            margin: 10px;
             margin: 0 auto;
        }

        h1 {
            text-align: center;
        }

        .survey {
            position: relative;
            display: inline-block;
        }

       .survey>img {
            width: 400px;
            height: 300px;
            object-fit: cover;
        }

        .survey:hover img {
            opacity: 0.7;
        }

        .hover-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            text-align: center;
            opacity: 0;
            transition: opacity 0.3s;
            pointer-events: none;
        }

        .survey:hover .hover-text {
            opacity: 1;
            pointer-events: auto;
        }

        button {
            display: block;
            margin: 10px auto;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            opacity: 0;
            transition: opacity 0.3s;
        }

        .survey:hover button {
            opacity: 1;
        }
        #text{
	font-size:70px;
	height:130px;
	text-align:center;
	text-decoration-line: underline;
    text-underline-position:under;
}
</style>

<body>
 <%-- <div id = "text"></div>
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
	</c:if>--%>
<div class="con">

 <%-- <div id = "text"></div>
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
	</c:if>--%>
    <div class="box">
        <h1>정부정책조사</h1>
        <div class="survey">
            <img src="/resources/img/survey2.jpg">
            <div class="hover-text">
            <a href="/board/sogae">
            <button>참가</button></a>
           	 <button>결과</button>
            </div>
        </div>
    </div>

    <div class="box">
        <h1>인성검사</h1>
        <div class="survey">
            <img src="/resources/img/survey3.jpg">
            <div class="hover-text">
           	 <button>참가</button> 
           	 <button>결과</button>
            </div>
        </div>
    </div>

    <div class="box">
        <h1>마케팅조사</h1>
        <div class="survey">
            <img src="/resources/img/survey4.jpg">
            <div class="hover-text" >
         	   <button>참가</button> 
         	   <button>결과</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>

