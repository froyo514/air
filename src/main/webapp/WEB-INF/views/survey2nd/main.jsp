<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Survey main</title>
</head>

<body>
	<h1> Survey2nd main</h1>
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
	<h1>설문조사 등록 : <a href=<c:url value="/survey2nd/registerSurvey"/>>시작</a></h1>
</body>
</html>

