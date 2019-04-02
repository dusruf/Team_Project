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

	init();
	
	$("#insert-btn").on("click",insertComment);

	
});


function init(){
	
	var qBoardSeq=$("#qBoardSeq").val();

	$.ajax({

		url:"selectQna"
		,data:{qBoardSeq:qBoardSeq}
		,type:"get"
		,success:function(qna){
//			console.log(JSON.stringify(qna));

			output(qna);
		
		}//success	
	});//init ajax 
	
}//function init()

function output(qna){
		
	
	var info="";
	
	info+='<table id="boardTable">';
	info+='<tr><td>제목 : </td><td>'+qna[0].TITLE+'</td></tr>';
	info+='<tr><td>게시일 : </td><td>'+qna[0].INDATE+'</td></tr>';
	info+='</table>';	
	info+='<hr>';
	
	$("#contentDiv").html(info);
	
	if(qna[0].COMMENTSEQ!=null){
				
		var comment="";
		
		comment="";
		
		comment+='<table>';
		
		$.each(qna, function(index, item){
			
			comment+='<tr>';			
			comment+='<td>'+item.HHNAME+'</td>';
			comment+='<td>'+item.COMMENTS+'</td>';
			comment+='<td>'+item.COMDATE+'</td>';
			comment+='</tr>';
			
		});//each
		
		comment+='</table>';
		
		$("#showCommentDiv").html(comment);
			
	}//댓글 유무 if

}//output

function insertComment(){

	var comments=$("#comments").val();
	var qBoardSeq=$("#qBoardSeq").val();
	var hhId=$("#hhId").val();
	var hhName=$("#hhName").val();
		
 	$.ajax({
		
		url:"insertComment"
		,data:{
			comments:comments
			,qBoardSeq:qBoardSeq
			,hhId:hhId
			,hhName:hhName
			}
		,type:"post"
		,success:function(result){
			
			$("#comments").val("");
			init();
			
		}//success
	
	}); //ajax

}//inputComment


</script>
</head>
<body>

<div>
<h1>test1</h1>
</div>

<!-- 게시글 출력하는  div -->
<div id="contentDiv">

</div>

<input type="hidden" id="qBoardSeq" value="${qBoardSeq}">
<input type="hidden" id="hhId" value="${hhId}">
<input type="hidden" id="hhName" value="${hhName}">


<!-- HH만 댓글 등록 가능 -->
<c:if test="${sessionScope.loginFlag==1}">

<div id="insertCommentDiv">
<!-- 
<form action="insertComment" method="post">
 -->
<input type="text" id="comments">
<button id="insert-btn">댓글 등록</button>
<!-- 
</form>
 -->
</div>
</c:if>


<div id="showCommentDiv">

</div>


</body>
</html>