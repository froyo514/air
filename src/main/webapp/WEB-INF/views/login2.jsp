<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1> Main Page</h1>
	
	<p>이름<c:out value="${param.id}"/> </p>
	<p>비번<c:out value="${param.pwd}"/> </p>
</body>
</html>