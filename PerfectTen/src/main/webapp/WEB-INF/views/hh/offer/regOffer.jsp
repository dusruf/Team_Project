<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>

오퍼 등록 페이지<br>

<form action="inputOffer" method="post">

기업 이름 <input type="text" name="comName"><br>
기업 주소 <input type="text" name="comAddr"><br>
직업명 <input type="text" name="jobTitle"><br>
1순위 <input type="text" name="firstOption"><br>
2순위 <input type="text" name="secondOption"><br>
3순위 <input type="text" name="thirdOption"><br>
4순위 <input type="text" name="fourthOption"><br>
5순위 <input type="text" name="fifthOption"><br>
부가 설명 <textarea name="explanation" rows="5" cols="23"></textarea><br>

<button>오퍼 등록</button>
</form>
<form action="offerList">
<button>취소</button>
</form>

</body>
</html>