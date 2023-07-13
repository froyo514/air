<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Survey Response Results</title>
</head>
<body>
    <h1>Survey Response Results</h1>
    
    <c:set var="totalScore" value="0" scope="page" />
    
    <c:forEach var="question" items="${surveyForm.questions}" varStatus="loop">
        <p>Question ${loop.index + 1}: ${question.questionText}</p>
        
        <c:set var="selectedChoice" value="${param['answers[' + loop.index + '].selectedChoice']}" scope="page" />
        <p>Answer: ${selectedChoice}</p>
        
        <c:choose>
            <c:when test="${selectedChoice eq '5'}">
                <c:set var="totalScore" value="${totalScore + 5}" scope="page" />
            </c:when>
            <c:when test="${selectedChoice eq '4'}">
                <c:set var="totalScore" value="${totalScore + 4}" scope="page" />
            </c:when>
            <c:when test="${selectedChoice eq '3'}">
                <c:set var="totalScore" value="${totalScore + 3}" scope="page" />
            </c:when>
            <c:when test="${selectedChoice eq '2'}">
                <c:set var="totalScore" value="${totalScore + 2}" scope="page" />
            </c:when>
            <c:when test="${selectedChoice eq '1'}">
                <c:set var="totalScore" value="${totalScore + 1}" scope="page" />
            </c:when>
        </c:choose>
    </c:forEach>
    
    <p>Total Score: ${totalScore}</p>
</body>
</html>