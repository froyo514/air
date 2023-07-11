<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Survey Form</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            var questionCounter = 0;

            // 문항 추가 버튼 클릭 시 새로운 문항을 추가합니다.
            $("#addQuestion").click(function() {
                questionCounter++;
                var questionHtml = '<div id="question' + questionCounter + '">' +
                    '<label for="questionText' + questionCounter + '">Question ' + questionCounter + ':</label>' +
                    '<input type="text" id="questionText' + questionCounter + '" name="questions[' + (questionCounter-1) + '].questionText" required><br><br>' +
                    '<button type="button" onclick="removeQuestion(' + questionCounter + ')">Remove</button><br><br>' +
                    '</div>';
                $("#questionsContainer").append(questionHtml);
            });

            // 문항 삭제 함수
            window.removeQuestion = function(questionId) {
                $("#question" + questionId).remove();
            };

            // 폼 제출 시 확인 창을 표시하여 제출 여부를 확인합니다.
            $("form").submit(function() {
                var confirmed = confirm("제출하면 수정이 불가능합니다. 제출하시겠습니까?");
                return confirmed;
            });
        });
    </script>
</head>
<body>
    <h1>Survey Form</h1>

    <form method="post" action="/newsurvey/form">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required><br><br>

        <div id="questionsContainer">
            <!-- 기본 문항 -->
            <div id="question0">
                <label for="questionText0">Question 1:</label>
                <input type="text" id="questionText0" name="questions[0].questionText" required><br><br>
                <button type="button" onclick="removeQuestion(0)">Remove</button><br><br>
            </div>
        </div>

        <button type="button" id="addQuestion">Add Question</button><br><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
