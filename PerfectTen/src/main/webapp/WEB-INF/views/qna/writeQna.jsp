<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

글 쓰기

<form action="inputQna" method="post">
제목 : <input type="text" name="title"><br>
내용 : <textarea name="contents" rows="10" cols="23"></textarea><br>
<input type="submit" value="등록">
</form>

</body>
</html>