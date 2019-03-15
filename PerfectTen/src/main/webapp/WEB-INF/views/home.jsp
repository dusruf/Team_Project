<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>

<div id="loginDiv">

<form action="login" method="post">
<label><input type="radio" name="loginFlag" value="1">헤드헌터 회원</label>
<label><input type="radio" name="loginFlag" value="2">구직 회원</label><br>

로그인
ID : <input type="text" name="loginId"><br>
PW : <input type="password" name="loginPw"><br>
<input type="submit" value="LogIn">
</form>

<form action="goReg" method="get">
<input type="submit" value="SignIn">
</form>
</div>

</body>
</html>
