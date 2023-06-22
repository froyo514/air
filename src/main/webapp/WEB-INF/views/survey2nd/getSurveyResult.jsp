<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <title>Survey Results</title>
    <head>
    <style>
    div.minimalistBlack {
  border: 3px solid #000000;
  width: 100%;
  text-align: left;
  border-collapse: collapse;
}
.divTable.minimalistBlack .divTableCell, .divTable.minimalistBlack .divTableHead {
  border: 1px solid #000000;
  padding: 5px 4px;
}
.divTable.minimalistBlack .divTableBody .divTableCell {
  font-size: 13px;
}
.divTable.minimalistBlack .divTableHeading {
  background: #CFCFCF;
  background: -moz-linear-gradient(top, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
  background: -webkit-linear-gradient(top, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
  background: linear-gradient(to bottom, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
  border-bottom: 3px solid #000000;
}
.divTable.minimalistBlack .divTableHeading .divTableHead {
  font-size: 15px;
  font-weight: bold;
  color: #000000;
  text-align: left;
}
.minimalistBlack .tableFootStyle {
  font-size: 14px;
  font-weight: bold;
  color: #000000;
  border-top: 3px solid #000000;
}
.minimalistBlack .tableFootStyle {
  font-size: 14px;
}
/* DivTable.com */
.divTable{ display: table; }
.divTableRow { display: table-row; }
.divTableHeading { display: table-header-group;}
.divTableCell, .divTableHead { display: table-cell;}
.divTableHeading { display: table-header-group;}
.divTableFoot { display: table-footer-group;}
.divTableBody { display: table-row-group;}
    </style>
</head>
<body>
  <p><c:out value="${survey.survey_name }"/>&nbsp;[<c:out value="${survey.survey_desc}"/>]<p>
  <c:if test="${!empty questionAnswerList }">
  	<c:forEach items="${questionAnswerList }" var = "item" varStatus="itemStatus">
  	<div class="divTable minimalistBlack">
  		<div class="divTableHeading">
  			<div class="divTableRow">
  				<div class="divTableHead">
  					<label><c:out value="${itemStatus.index+1 }.${item.question_text }"/></label>
  				</div>
  			</div>
  		</div>
	<div class="divTableBody">
		<div style="padding:8px;">
		<c:forEach items="${item.keys }" var="option" varStatus="optionStatus">
		<c:if test="${item.question_type eq QuestionType.SELECT && optionStatus.index eq 0}">
			<c:set var="pass" value="true"/>
		</c:if>
		<c:if test="${!pass}">
			<label><c:out value="${item.keys[optionStatus.index] }"/>:</label>
			<label><c:out value="${item.values[optionStatus.index] }"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		</c:if>
		<c:set var="pass" value="false"/>
		</c:forEach>
		</div>
		</div>
	</div>  	
  	</c:forEach>
  </c:if>
</body>
</html>
