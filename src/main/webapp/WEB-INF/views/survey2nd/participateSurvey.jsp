<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>																															
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Participate Survey</title>
</head>
<body>
	<form action="/survey2nd/participateSurvey" method="post">
		<c:if test="${!empty questionList }">
			<c:forEach items="${questionList }" var="item" varStatus="status">
				<label><c:out value="${status.index+1 }.${item.question_text }"/></label><br/>
				<c:choose>
					<c:when test="${item.question_type == 'RADIO' }">
						<c:forEach var = "option" items="${item.listOptions }">
							<label><input type="radio" name="answer_text[${status.index}]"
								value="${option }"/>${option }</label><br/>
						</c:forEach>
					</c:when>
					<c:when test="${item.question_type == 'SELECT' }">
						<select name="answer_text[${status.index }]"> 
						<c:forEach var="option" items="${item.listOptions }">
							<option value="${option }">${option }</option>
						</c:forEach>
						</select><br/>
						</c:when>
						<c:when test="${item.question_type == 'ANSWER' }">
							<input type="text" name="answer_text[${status.index }]"/><br/>
						</c:when>
				</c:choose>
					<input type="hidden" name="question_id[${status.index}]" value="${item.question_id }">
			</c:forEach>
			<br/><input type="submit" value="전송">
		</c:if>
	</form>
</body>
</html>