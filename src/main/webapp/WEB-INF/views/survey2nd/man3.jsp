<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@include file="../includes/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Survey Response</title>
</head>
<body>
    <h1>Survey Response</h1>
    <p>설문조사가 등록되었습니다<strong>${response.respondentName}</strong></p>
개인정보 수집·이용 동의
수집항목	수집목적	보유기간
○ 이름
○ 닉네임	○ 투표/설문 참여	1년
※ 위의 개인정보 수집·이용에 대한 동의를 거부할 권리가 있습니다.
그러나 동의를 거부할 경우 수집목적에 해당하는 서비스를 제공받으실 수 없습니다.

위와 같이 개인정보를 수집·이용하는데 동의하십니까?
    <a href="/newsurvey/man4">
            	<button>확인하러가보기</button></a>
</body>
</html>
