<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>

$(function(){
//	message();
	init();
});

/*
function message(){
	
	var message=$("#message").val();
	
	alert(message);
	
}
*/

function init(){
	
	$.ajax({
		
		url:"qList",
		type:"get",
		success:function(qList){
			
			output(qList);
			
		}//init success
		
	});//init ajax
	
}//function init()

function output(resp){
	
	var data='<table class="qnaTable">';
	var data='<tr><td>제목</td><td>ID</td><td>조회수</td><td>등록일</td></tr>';
	
	$.each(resp, function(index, item){

		data+='<tr>';		
		data+='<td><a href="qnaDetail?qBoardSeq='+item.qBoardSeq+'">'+item.title+'</a></td>';
		data+='<td>'+item.personId+'</td>';
		data+='<td>'+item.hitcount+'</td>';
		data+='<td>'+item.indate+'</td>';
		data+='</tr>';		
		
	});//each
	
	data+='</table>';
	$("#qnaDiv").html(data);

	
}// function output()



</script>

</head>
<body>
상담 게시판

<div id="qnaDiv">

</div>

<c:if test="${sessionScope.loginFlag==2}">
<form action="writeQna">
<button>글 등록</button>
</form>
</c:if>

<form action="rePersonMain">
<button>메인으로</button>
</form>
<input type="hidden" id="message" value="${message}">

</body>
</html>