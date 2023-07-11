<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Survey Response</title>
</head>
<body>
    <h1>Survey Response</h1>
    <h2>Registered Survey Form:</h2>
    <p>Title: ${surveyForm.title}</p>
    
    <h3>Questions:</h3>
    <form method="post" action="/survey/response/submit">
        <c:forEach var="question" items="${surveyForm.questions}">
            <p>${question.text}</p>
            <c:if test="${question.answerType == 'text'}">
                <input type="text" name="answers[${questionIndex}].answerText" required><br>
            </c:if>
            
            <c:if test="${question.answerType == 'likertScale'}">
                <input type="radio" name="answers[${questionIndex}].selectedChoice" value="5" required> 매우 그렇다<br>
                <input type="radio" name="answers[${questionIndex}].selectedChoice" value="4" required> 그렇다<br>
                <input type="radio" name="answers[${questionIndex}].selectedChoice" value="3" required> 보통이다<br>
                <input type="radio" name="answers[${questionIndex}].selectedChoice" value="2" required> 그렇지 않다<br>
                <input type="radio" name="answers[${questionIndex}].selectedChoice" value="1" required> 전혀 그렇지 않다<br>
            </c:if>
            <input type="hidden" name="answers[${questionIndex}].questionText" value="${question.text}">
            <input type="hidden" name="answers[${questionIndex}].answerType" value="${question.answerType}">
        </c:forEach>
        <br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
