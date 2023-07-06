<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
   <%@include file="../includes/header.jsp" %>
   
<!DOCTYPE html>
<html>
<head>
    <title>설문조사</title>
    <script>
        function generateAnswerFields() {
            var answerCount = document.querySelector('input[name="answerCount"]:checked').value;
            var answerContainer = document.getElementById("answerContainer");
            answerContainer.innerHTML = ""; // 기존의 빈칸 초기화

            for (var i = 0; i < answerCount; i++) {
                var answerInput = document.createElement("input");
                answerInput.type = "text";
                answerInput.name = "answer" + i; // 유니크한 이름 생성
                answerContainer.appendChild(answerInput);
                answerContainer.appendChild(document.createElement("br"));
            }
        }

        function handleAnswerCountCheckbox() {
            var checkboxes = document.getElementsByName("answerCount");
            var checkedCount = 0;

            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    checkedCount++;
                }
            }

            if (checkedCount > 1) {
                alert("답변 개수는 하나만 선택할 수 있습니다.");

                // 체크를 해제합니다.
                for (var i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = false;
                }
            }

            generateAnswerFields(); // 답변 개수 변경 시, 답변 필드를 동적으로 생성합니다.
        }

        function handleSurveyTypeCheckbox() {
            var checkboxes = document.getElementsByName("surveyType");
            var checkedCount = 0;

            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    checkedCount++;
                }
            }

            if (checkedCount > 1) {
                alert("설문 타입은 한 개만 지정할 수 있습니다.");

                // 체크를 해제합니다.
                for (var i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = false;
                }
            }
        }
    </script>
    
</head>
<style>

#text{
	font-size:70px;
	height:150px;
	text-align:center;
	text-decoration-line: underline;
    text-underline-position:under;
}

        body {
            font-family: Arial, sans-serif;
     
           
        }

        #text {
            font-size: 70px;
            height: 150px;
            text-align: center;
            text-decoration-line: underline;
            text-underline-position: under;
            color: #333333;
        }

       form {
            max-width: 500px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
		
		 table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #dddddd;
        }

        label {
            font-weight: bold;
        }
        
        textarea,
        input[type="surveyName"] {
            width: 40%;
            padding: 5px;
            margin-bottom: 10px;
        }
       

        p {
            font-weight: bold;
            margin-top: 10px;
            margin-bottom: 5px;
        }

        #type input[type="checkbox"],
        #answer input[type="checkbox"] {
            margin-right: 5px;
        }

        #answerContainer {
            margin-top: 10px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4caf50;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
  
</style>
<body>
    <div id="text">설문조사 만들기</div>
    <form action="surveySumbit" method="post">
                <label for="surveyName">설문조사 이름:</label>
                <input type="text" name="surveyName" id="surveyName">
        <table>
            <tr>
                <td><label for="surveyContent">설문 내용:</label></td>
                <td><input type="text" name="questionName" id="questionName"></td>
            </tr>
            <tr>
                <td><p>답변타입:</p></td>
                <td>
                    <input type="checkbox" name="surveyType" value="multipleChoice" onclick="handleSurveyTypeCheckbox()">라디오<br>
                    <input type="checkbox" name="surveyType" value="singleChoice" onclick="handleSurveyTypeCheckbox()">셀렉트바<br>
                    <input type="checkbox" name="surveyType" value="text" onclick="handleSurveyTypeCheckbox()">응답자직접입력<br>
                </td>
            </tr>
            <tr>
                <td><p>답변갯수:</p></td>
                <td>
                    <input type="checkbox" name="answerCount" value="2" onclick="handleAnswerCountCheckbox()">2개<br>
                    <input type="checkbox" name="answerCount" value="3" onclick="handleAnswerCountCheckbox()">3개<br>
                    <input type="checkbox" name="answerCount" value="4" onclick="handleAnswerCountCheckbox()">4개<br>
                    <input type="checkbox" name="answerCount" value="5" onclick="handleAnswerCountCheckbox()">5개<br>
                </td>
            </tr>
            <tr>
                <td><p>답변:</p></td>
                <td><div id="answerContainer"></div></td>
            </tr>
        </table>
        <br>
        <input type="submit" value="설문조사 제출">
    </form>
</body>
</html>
