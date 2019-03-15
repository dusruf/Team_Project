<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hh Main</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>		
</head>

<script>

$(function(){

	$("#offerList").on("click",function(){
			
		$("#offerListForm").submit();

	});//offerList on click

	$("#searchPerson").on("click",function(){
		
		$("#searchPersonForm").submit();

	});//searchPerson on click	
	
	$("#statusCheck").on("click",function(){
		
		$("#statusCheckForm").submit();
		
	});//statusCheck on click	

	$("#personList").on("click",function(){
		
		$("#personListForm").submit();

	});//personList on click	
	
	$("#qnaBoard").on("click",function(){
		
		$("#qnaBoardForm").submit();
		
	});//qnaBoard on click		
	
});//JQ 틀

</script>

<body>

<h1>hh Main</h1>

<form id="offerListForm" action="offerList" method="get">
<div id="offerList"><h1>기업 오퍼 정리</h1></div>
</form>

<form id="searchPersonForm" action="searchPerson" method="get">
<div id="searchPerson"><h1>인재 찾기</h1></div>
</form>

<form id="statusCheckForm" action="statusCheck" method="get">
<div id="statusCheck"><h1>진행 상황</h1></div>
</form>

<form id="personListForm" action="personList" method="get">
<div id="personList"><h1>관심 인재 list</h1></div>
</form>

<form id="qnaBoardForm" action="qnaBoard" method="get">
<div id="qnaBoard"><h1>상담 게시판</h1></div>
</form>


</body>
</html>