<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>웹사이트 이름</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<script>

function loginAlert(){
	
	var loginFlag = ${loginFlag};
	
	if (loginFlag==1) {
		alert("로그인에 실패 했습니다. 아이디와 비밀번호를 다시 확인해주세요.");
	}
	
	
};

</script>

<body>
<h1>

LOGIN

<form action="login" method="post">
ID : <input type="text" id="loginId"><br>
PW : <input type="text" id="loginId"><br>
<input type="submit" value="LogIn">
</form>
<form action="goReg" method="get">
<input type="submit" value="Register">
</form>

</h1>
</body>
</html>
