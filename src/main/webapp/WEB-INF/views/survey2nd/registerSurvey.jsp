<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>																															
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>

<script>
$(function() {
	$("#excelFile").change(function(){
		let input = event.target;
		let reader = new FileReader();
		reader.onload = function() {
			let data = reader.result;
			let workBook = XLSX.read(data, {type:'binary'});
			workBook.SheetNames.forEach(function (sheetName){
				console.log('SheetName: ' + sheetName);
				let rows = XLSX.utils.sheet_to_json(workBook.Sheets[sheetName]);
				console.log(rows);
				console.log(JSON.stringify(rows));
				$("#questions").attr("value", JSON.stringify(rows));
			
		})
	};
	reader.readAsBinaryString(input.files[0]);

	
});

</script>
</head>
<body>
	<h1>register Survey</h1>
	<form:form action="/survey2nd/registerSurvey" method="post" modelAttribute="surveyVO">
	
 <div>
	<p>
		<label>설문조사 제목</label>
		<form:input style="width:300px" path="survey_name"/>
		<form:errors path="survey_name"/>
	</p>
	<p>
		<label style="dispaly:inline-block;vertical-align: top;">설문조사 설명</label>
		<form:textarea style="width:300px;height:100px;" path="survey_desc"/>
		<form:errors path="survey_desc"/>
	</p>
	</div>
	<div>
		<p>
			<input type="file" value="불러오기" name="excelFile" id="excelFile"></input>
			<input type="hidden" name="questions" id="questions"></input>
			<form:errors path="questions"/>
		</p>
		<p>
			<input type="submit" value="저장하기" name="save" id="save"></input>
		</p>
		
		
	</div>
</form:form>
</body>
</html>