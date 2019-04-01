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
			content+='ID : <input type="text" name="hhId"><br>';
			content+='PW : <input type="password" name="hhPw"><br>';
			content+='사업자 등록 번호 : <input type="text" name="cdn"><br>';
			content+='회사 이름 : <input type="text" name="hhName"><br>';
			content+='담당자 : <input type="text" name="representative"><br>';
			content+='회사 대표 번호 : <input type="text" name="phone"><br>';
			content+='회사 주소 : <input type ="text" name="addr"><br>';
			content+='회사 EMAIL : <input type="text" name="hhEmail"><br>';
			content+='<input type="hidden" name="loginFlag" value="1">';
		//	content+='<button name="hhSubmit">회원 가입</button>';
			content+='<input type="submit" value="회원 가입">';
			content+='</form>';
			
			$("#regFormDiv").html(content);
			
		
		});//hhReg on click

		$("#personReg").on("click",function(){
			
			var content="";
			
			content+='<h1>구직자 가입</h1>';
			content+='<form action="personReg" method="post">';
			content+='ID : <input type="text" name="personId"><br>';
			content+='PW : <input type="password" name="personPw"><br>';
			content+='이름 : <input type="text" name="personName"><br>';
			content+='EMAIL : <input type="text" name="personEmail"><br>';
			content+='<input type="hidden" name="loginFlag" value="2">';
			content+='<input type="submit" value="회원 가입">';
			content+='</form>';
			
			$("#regFormDiv").html(content);

		});//personReg on click

		//회원 가입 유효성 검사 하기		
		
		
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


</div>

</body>
</html>