<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@include file="../includes/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>설문조사</title>
    <script>
        function addQuestion() {
            var questionContainer = document.getElementById("questionContainer");

            var questionTable = document.createElement("table");
            var questionIndex = document.querySelectorAll('table[id^="questionTable"]').length;
            questionTable.id = "questionTable_" + questionIndex;

            var questionRow = document.createElement("tr");
            var questionNameCell = document.createElement("td");
            var questionNameLabel = document.createElement("label");
            questionNameLabel.textContent = "질문 내용:";
            var questionNameInput = document.createElement("input");
            questionNameInput.type = "text";
            questionNameInput.name = "questionName";
            questionNameCell.appendChild(questionNameLabel);
            questionNameCell.appendChild(questionNameInput);
            questionRow.appendChild(questionNameCell);

            var surveyTypeRow = document.createElement("tr");
            var surveyTypeCell = document.createElement("td");
            var surveyTypeLabel = document.createElement("p");
            surveyTypeLabel.textContent = "답변 타입:";
            var surveyTypeCheckbox1 = document.createElement("input");
            surveyTypeCheckbox1.type = "checkbox";
            surveyTypeCheckbox1.name = "surveyType";
            surveyTypeCheckbox1.value = "multipleChoice";
            surveyTypeCheckbox1.onclick = handleSurveyTypeCheckbox;
            var surveyTypeLabel1 = document.createElement("label");
            surveyTypeLabel1.textContent = "라디오";
            var surveyTypeCheckbox2 = document.createElement("input");
            surveyTypeCheckbox2.type = "checkbox";
            surveyTypeCheckbox2.name = "surveyType";
            surveyTypeCheckbox2.value = "singleChoice";
            surveyTypeCheckbox2.onclick = handleSurveyTypeCheckbox;
            var surveyTypeLabel2 = document.createElement("label");
            surveyTypeLabel2.textContent = "셀렉트바";
            var surveyTypeCheckbox3 = document.createElement("input");
            surveyTypeCheckbox3.type = "checkbox";
            surveyTypeCheckbox3.name = "surveyType";
            surveyTypeCheckbox3.value = "text";
            surveyTypeCheckbox3.onclick = handleSurveyTypeCheckbox;
            var surveyTypeLabel3 = document.createElement("label");
            surveyTypeLabel3.textContent = "응답자 직접 입력";

            surveyTypeCell.appendChild(surveyTypeLabel);
            surveyTypeCell.appendChild(surveyTypeCheckbox1);
            surveyTypeCell.appendChild(surveyTypeLabel1);
            surveyTypeCell.appendChild(surveyTypeCheckbox2);
            surveyTypeCell.appendChild(surveyTypeLabel2);
            surveyTypeCell.appendChild(surveyTypeCheckbox3);
            surveyTypeCell.appendChild(surveyTypeLabel3);
            surveyTypeRow.appendChild(surveyTypeCell);

            var answerCountRow = document.createElement("tr");
            var answerCountCell = document.createElement("td");
            var answerCountLabel = document.createElement("p");
            answerCountLabel.textContent = "답변 개수:";
            var answerCountCheckbox1 = document.createElement("input");
            answerCountCheckbox1.type = "checkbox";
            answerCountCheckbox1.name = "answerCount";
            answerCountCheckbox1.value = "2";
            answerCountCheckbox1.onclick = handleAnswerCountCheckbox;
            var answerCountLabel1 = document.createElement("label");
            answerCountLabel1.textContent = "2개";
            var answerCountCheckbox2 = document.createElement("input");
            answerCountCheckbox2.type = "checkbox";
            answerCountCheckbox2.name = "answerCount";
            answerCountCheckbox2.value = "3";
            answerCountCheckbox2.onclick = handleAnswerCountCheckbox;
            var answerCountLabel2 = document.createElement("label");
            answerCountLabel2.textContent = "3개";
            var answerCountCheckbox3 = document.createElement("input");
            answerCountCheckbox3.type = "checkbox";
            answerCountCheckbox3.name = "answerCount";
            answerCountCheckbox3.value = "4";
            answerCountCheckbox3.onclick = handleAnswerCountCheckbox;
            var answerCountLabel3 = document.createElement("label");
            answerCountLabel3.textContent = "4개";
            var answerCountCheckbox4 = document.createElement("input");
            answerCountCheckbox4.type = "checkbox";
            answerCountCheckbox4.name = "answerCount";
            answerCountCheckbox4.value = "5";
            answerCountCheckbox4.onclick = handleAnswerCountCheckbox;
            var answerCountLabel4 = document.createElement("label");
            answerCountLabel4.textContent = "5개";

            answerCountCell.appendChild(answerCountLabel);
            answerCountCell.appendChild(answerCountCheckbox1);
            answerCountCell.appendChild(answerCountLabel1);
            answerCountCell.appendChild(answerCountCheckbox2);
            answerCountCell.appendChild(answerCountLabel2);
            answerCountCell.appendChild(answerCountCheckbox3);
            answerCountCell.appendChild(answerCountLabel3);
            answerCountCell.appendChild(answerCountCheckbox4);
            answerCountCell.appendChild(answerCountLabel4);
            answerCountRow.appendChild(answerCountCell);

            var answerRow = document.createElement("tr");
            var answerCell = document.createElement("td");
            var answerContainer = document.createElement("div");
            var questionIndex = document.querySelectorAll('table[id^="questionTable"]').length;
            answerContainer.id = "answerContainer_" + questionIndex;
            answerCell.appendChild(answerContainer);
            answerRow.appendChild(answerCell);

            var removeButtonCell = document.createElement("td");
            var removeButton = document.createElement("button");
            removeButton.textContent = "질문 삭제";
            removeButton.onclick = function() {
                removeQuestion(questionTable);
            };
            removeButtonCell.appendChild(removeButton);
            answerRow.appendChild(removeButtonCell);

            questionTable.appendChild(questionRow);
            questionTable.appendChild(surveyTypeRow);
            questionTable.appendChild(answerCountRow);
            questionTable.appendChild(answerRow);

            questionContainer.appendChild(questionTable);
        }

        function removeQuestion(questionTable) {
            var questionContainer = document.getElementById("questionContainer");
            questionContainer.removeChild(questionTable);

            var questionTables = document.querySelectorAll('table[id^="questionTable"]');
            for (var i = 0; i < questionTables.length; i++) {
                questionTables[i].id = "questionTable_" + i;
            }
        }

        function generateAnswerFields(questionIndex) {
            var answerCount = document.querySelector('input[name="answerCount"]:checked').value;
            var answerContainer = document.getElementById("answerContainer_" + questionIndex);
            answerContainer.innerHTML = "";

            for (var i = 0; i < answerCount; i++) {
                var answerInput = document.createElement("input");
                answerInput.type = "text";
                answerInput.name = "answer_" + questionIndex + "_" + i;
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

                for (var i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = false;
                }
            }

            var questionIndex = Array.from(document.querySelectorAll('table[id^="questionTable"]')).indexOf(this.closest('table'));

            generateAnswerFields(questionIndex);
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

                for (var i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = false;
                }
            }
        }

        function submitSurvey() {
            var form = document.getElementById("surveyForm");
            var formData = new FormData(form);

            var questionTables = document.querySelectorAll('table[id^="questionTable"]');

            for (var i = 0; i < questionTables.length; i++) {
                var questionTable = questionTables[i];
                var questionIndex = questionTable.id.split("_")[1];

                var answerCountCheckbox = questionTable.querySelector('input[name="answerCount"]:checked');
                var answerCount = answerCountCheckbox ? answerCountCheckbox.value : "";

                var answerInputs = questionTable.querySelectorAll('input[name^="answer_' + questionIndex + '"]');

                for (var j = 0; j < answerInputs.length; j++) {
                    var answerInput = answerInputs[j];
                    formData.append(answerInput.name, answerInput.value);
                }
            }

            fetch(form.action, {
                method: form.method,
                body: formData
            })
            .then(function(response) {
                // Handle the form submission response
            })
            .catch(function(error) {
                // Handle any errors
            });
        }
    </script>

    <style>
        #text {
            font-size: 70px;
            height: 150px;
            text-align: center;
            text-decoration-line: underline;
            text-underline-position: under;
            color: #333333;
        }

        body {
            font-family: Arial, sans-serif;
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

        input[type="button"],
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4caf50;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="button"]:hover,
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>
    <div id="text">설문조사 만들기</div>
    <button onclick="addQuestion()">추가 질문</button>
    <form id="surveyForm" action="surveySubmit" method="post">
        <label for="surveyName">설문조사 이름:</label>
        <input type="text" name="surveyName" id="surveyName">
        <div id="questionContainer">
            <table id="questionTable_0">
                <tr>
                    <td><label for="questionName">질문 내용:</label></td>
                    <td><input type="text" name="questionName" id="questionName"></td>
                </tr>
                <tr>
                    <td><p>답변 타입:</p></td>
                    <td>
                        <input type="checkbox" name="surveyType" value="multipleChoice" onclick="handleSurveyTypeCheckbox()">라디오<br>
                        <input type="checkbox" name="surveyType" value="singleChoice" onclick="handleSurveyTypeCheckbox()">셀렉트바<br>
                        <input type="checkbox" name="surveyType" value="text" onclick="handleSurveyTypeCheckbox()">응답자 직접 입력<br>
                    </td>
                </tr>
                <tr>
                    <td><p>답변 개수:</p></td>
                    <td>
                       <input type="checkbox" name="answerCount" value="2" onclick="handleAnswerCountCheckbox()">2개<br>
                        <input type="checkbox" name="answerCount" value="3" onclick="handleAnswerCountCheckbox()">3개<br>
                        <input type="checkbox" name="answerCount" value="4" onclick="handleAnswerCountCheckbox()">4개<br>
                        <input type="checkbox" name="answerCount" value="5" onclick="handleAnswerCountCheckbox()">5개<br>
                    </td>
                </tr>
                <tr>
                    <td><p>답변:</p></td>
                    <td><div id="answerContainer_0"></div></td>
                </tr>
            </table>
        </div>
        <br>
        
        <input type="button" value="설문조사 제출" onclick="submitSurvey()">
    </form>
</body>
</html>
