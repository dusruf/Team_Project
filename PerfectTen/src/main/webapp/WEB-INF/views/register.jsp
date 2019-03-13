<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>		
</head>
<style>

	td{

		width:300px;

		height:100px;

		border:1px solid;

	}

	
</style>

<script>

	$(function(){
	
		$("#hhReg").on("click",function(){
			
			var content="";
			
			content+='<h1>헤드헌터 가입</h1>';
			content+='<form action="hhReg" method="post">';
			content+='<input type="submit" value="회원 가입">';
			content+='</form>';
			$("#regFormDiv").html(content);
			
			
		});

		$("#personReg").on("click",function(){
			
			var content="";
			
			content+="<h1>구직자 가입</h1>";
			content+='<form action="personReg" method="post">';
			content+='<input type="submit" value="회원 가입">';
			content+='</form>';
			
			$("#regFormDiv").html(content);

			
		});
		
	}); //JQ 틀

</script>
<body>

<table class="choice" border="1">
<tr>
<td id="hhReg">헤드헌터 회원</td>
<td id="personReg">구직 회원</td>
</tr>
</table>

<div id="regFormDiv">
<form action="registerHH" method="post">
</form>

</div>

</body>
</html>