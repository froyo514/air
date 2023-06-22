<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사</title>
</head>
<body>
	<h1>설문조사</h1>
   <form method="post">
   
   <c:if test="${!empty questions}">
   <c:forEach var = "item" items="${questions}" varStatus="status">
   	<p> 
   		<label><c:out value="${status.index+1}.${item.title}"/></label><br/>
   		 <c:choose>
   		 <c:when test="${item.choice}">
   			<c:if test="${!item.select}">
   				<c:forEach var="option" items="${item.options}">
   					<label><input type="radio" name="responses[${status.index}]"
   						value="${option}"/>${option}</label><br/>
   				</c:forEach>
   				
   			</c:if>
   			<c:if test="${item.select}">
   				<select name="responses[${status.index}]">
   				<c:forEach var="option" items="${item.options }">
   					<option value="${option}">${option}</option>
   				</c:forEach>
   				</select>
   			</c:if>
   		</c:when> 
		
   		<c:otherwise>
   			<input type="text" name="responses[${status.index}]" value="${option }">${option}
   		</c:otherwise>
   		</c:choose> 
   		</p>
   		<input type = "hidden" name="titles[${status.index }]" value="${item.title }"/>
   		</c:forEach>
   		</c:if>
   		<input type="submit" value="전송">
   		
   		

   
      <%-- <p><label>1. ${questions[0].title}<br>
      	<p></p>
      	<c:forEach var="options" items="${questions[0].options}">
      		<input type='radio' name='fruit' value="${options}"/>${options}
      	</c:forEach>
  		</label></p>
  	<p><label>2. ${questions[1].title}<br>
      	<p></p>
      	<c:forEach var="options" items="${questions[1].options}">
      		<input type='radio' name='movie_genre' value="${options}"/>${options}
      	</c:forEach>
  		</label></p>
  	<p><label>3. ${questions[2].title}<br>
      	<p></p>
      	<c:forEach var="options" items="${questions[2].options}">
      		<input type='radio' name='alcohol_type' value="${options}"/>${options}
      	</c:forEach>
  		</label></p>
  	<p><label>4. ${questions[3].title}<br>
      	<p></p>	<select name="area" >
      	<c:forEach var="options" items="${questions[3].options}">
      		<option value="${options}"/>${options}
      	</c:forEach></select>
  		</label></p>
  		<p><label>5. ${questions[4].title}<br>
  	<p>
	<input  type="text" name ="age" /> <br>
	
	</label>
	</p>
	<input type="submit" value="전송">  --%>
	</form>
  		
</body>
</html>

