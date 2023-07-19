<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>																															
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>

<script>
/* $(function() {
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

	
}); */
var questionCount = 1; // 초기 질문 개수

function addQuestion() {
    if (questionCount < 5) { // 최대 5개의 질문을 추가할 수 있도록 제한
        var questionContainer = document.getElementById('question-container');

        var newQuestionDiv = document.createElement('div');
        newQuestionDiv.classList.add('question');

        var questionLabel = document.createElement('label');
        questionLabel.htmlFor = 'question_text_' + questionCount;
        questionLabel.textContent = '질문:';
        newQuestionDiv.appendChild(questionLabel);

        var questionText = document.createElement('input');
        questionText.type = 'text';
        questionText.name = 'question_text_' + questionCount;
        questionText.id = 'question_text_' + questionCount;
        questionText.required = true;
        newQuestionDiv.appendChild(questionText);

        newQuestionDiv.appendChild(document.createElement('br'));

        var optionsLabel = document.createElement('label');
        optionsLabel.htmlFor = 'question_options_' + questionCount;
        optionsLabel.textContent = '선택지:';
        newQuestionDiv.appendChild(optionsLabel);

        var questionOptions = document.createElement('input');
        questionOptions.type = 'text';
        questionOptions.name = 'question_options_' + questionCount;
        questionOptions.id = 'question_options_' + questionCount;
        questionOptions.required = true;
        newQuestionDiv.appendChild(questionOptions);

        newQuestionDiv.appendChild(document.createElement('br'));

        var typeLabel = document.createElement('label');
        typeLabel.htmlFor = 'question_type_' + questionCount;
        typeLabel.textContent = '질문 유형:';
        newQuestionDiv.appendChild(typeLabel);

        var questionType = document.createElement('select');
        questionType.name = 'question_type_' + questionCount;
        questionType.id = 'question_type_' + questionCount;
        questionType.required = true;

        var textOption = document.createElement('option');
        textOption.value = 'text';
        textOption.text = '텍스트';
        questionType.appendChild(textOption);

        var radioOption = document.createElement('option');
        radioOption.value = 'radio';
        radioOption.text = '라디오 버튼';
        questionType.appendChild(radioOption);

        var checkboxOption = document.createElement('option');
        checkboxOption.value = 'checkbox';
        checkboxOption.text = '체크 박스';
        questionType.appendChild(checkboxOption);

        newQuestionDiv.appendChild(questionType);

        questionContainer.appendChild(newQuestionDiv);

        questionCount++;
    } else {
        alert('최대 5개의 질문을 추가할 수 있습니다.');
    }
}
</script>
<style>
body {
			font-family: Arial, sans-serif;
		}

		h1 {
			text-align: center;
		}

		form {
			width: 500px;
			margin: 0 auto;
		}

		label {
			display: inline-block;
			width: 120px;
			font-weight: bold;
			margin-bottom: 10px;
		}

		input[type="text"], textarea {
			width: 300px;
			padding: 5px;
			border: 1px solid #ccc;
		}

		textarea {
			height: 100px;
		}

		input[type="file"] {
			margin-bottom: 10px;
		}

		input[type="submit"] {
			padding: 10px 20px;
			background-color: #4CAF50;
			color: #fff;
			border: none;
			cursor: pointer;
		}

		.error-message {
			color: red;
		}
		#text{
	font-size:70px;
	height:130px;
	text-align:center;
	text-decoration-line: underline;
    text-underline-position:under;
}
</style>
</head>


<body>
<div id ="text"></div>
    <form action="/survey2nd/test1" method="post" modelAttribute="surveyVO">
        <div>
            <p>
                <label for="survey_name">설문조사 제목</label>
                <input type="text" style="width: 300px;" name="survey_name" id="survey_name" required>
            </p>
            <p>
                <label for="survey_desc" style="display: inline-block; vertical-align: top;">설문조사 설명</label>
                <textarea style="width: 300px; height: 100px;" name="survey_desc" id="survey_desc" required></textarea>
            </p>
        </div>

        <div id="question-container" class="question">
    <label for="questionVO.question_text">질문:</label>
    <input type="text" name="question_text" id="questionVO.question_text" required><br><br>

    <label for="questionVO.question_options">선택지:</label>
    <input type="text" name="question_options" id="questionVO.question_options" required><br><br>

    <label for="questionVO.question_type">질문 유형:</label>
    <select name="question_type" id="questionVO.question_type" required>
        <option value="ANSWER">답변</option>
        <option value="RADIO">라디오 버튼</option>
        <option value="SELECT">셀렉트바</option>
    </select><br><br>
    
    
</div>


        <button type="button" onclick="addQuestion()">질문 추가</button><br><br>
        <input type="submit" value="제출">
    </form>
</body>
</html>













	
	<%-- <form:form action="/survey2nd/registerSurvey" method="post" modelAttribute="surveyVO">
	
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
	
</form:form> --%> 