<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>		

</head>

<script>

$(function(){

	$("#regResume").on("click",function(){
			
		$("#resumeRegForm").submit();

	});//resumeReg on click

	$("#showResume").on("click",function(){
		
		$("#showResumeForm").submit();

	});//resumeUpdate on click	
	
	$("#qnaBoard").on("click",function(){
		
		$("#qnaBoardForm").submit();

	});//qnaBoard on click	
	
	$("#statusDiv").on("click",function(){
		
		$("#statusForm").submit();

	});//qnaBoard on click	
	
});//JQ 틀

</script>

<body>

<h1>person Main</h1>

<form id="resumeRegForm" action="regResume" method="get">
<div id="regResume">
<h1>이력서 등록</h1>
</div>
</form>

<form id="showResumeForm" action="showResume" method="get">
<div id="showResume">
<h1>이력서 보기</h1>
</div>
</form>

<form id="qnaBoardForm" action="qnaBoard" method="get">
<div id="qnaBoard">
<h1>상담 게시판</h1>
</div>
</form>

<form id="statusForm" action="goStatus" method="get">
<div id="statusDiv">
<h1>진행 상황</h1>
</div>
</form>

</body>
</html>