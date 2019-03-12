<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REGISTER</title>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


</head>

<body>

 
<label><input type="radio" name="user" value="hh">헤드헌터 회원</label>
<label><input type="radio" name="user" value="person">구직 회원</label>

<div id="regDiv">



</div>

<form action="insertUser" method="POST">
<input type="submit" value="Register">
</form>

</body>
</html>