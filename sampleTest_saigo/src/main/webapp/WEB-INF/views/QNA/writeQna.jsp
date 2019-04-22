<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, maximum-scale=1">
	
	<!-- 홈페이지명 -->
	<title>Have a Good day</title>
	
	<!-- 구글 웹폰트 -->
	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,800italic,700italic,600italic,400italic,300italic,800,700,600' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Markazi+Text:400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nunito+Sans" rel="stylesheet">
	
	<!-- 부트스트랩 스타일시트 링크 -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<link href="css/font-awesome.css" rel="stylesheet" type="text/css">
	<link href="css/responsive.css" rel="stylesheet" type="text/css">
	<link href="css/magnific-popup.css" rel="stylesheet" type="text/css">
	<link href="css/animate.css" rel="stylesheet" type="text/css">

	<script type="text/javascript" src="js/jquery.1.8.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/jquery-scrolltofixed.js"></script>
	<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="js/jquery.isotope.js"></script>
	<script type="text/javascript" src="js/wow.js"></script>
	<script type="text/javascript" src="js/classie.js"></script>
	<script type="text/javascript" src="js/magnific-popup.js"></script>
	
	<script src="./resources/js/jquery.twbsPagination.js"></script>
	<script src="./resources/js/jquery.twbsPagination.min.js"></script>
	<script src="contactform/contactform.js"></script>
	

</head>
<body>
<!-- 0417 게시판 글쓰기 모달 시작(personMain으로 값이 넘어감) -->
	 
	 <form action="inputQna" method="post">
	 <div class="modal-header" style="height: 40px;">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin: -14px 10px; ">×</button>
              <h4 class="modal-title" style="margin: -12px;">게시글 작성</h4>
            </div><div class="container"></div>
            <div class="modal-body">
			
				<div class="form-group" style="margin-bottom: 23%;">
					    <label class="sr-only" for="mg1"></label> <!-- 메시지제목 -->
					    <input type="text" class="form-control" id="mg1" name="title" placeholder="게시글제목을 입력하세요." style="margin-top:2%; margin-left:2%; max-width:100%; width:96%;">				 
						<br>
						<textarea class="form-control col-sm-5" name="contents" rows="12" style="margin-left:2%; max-width:100%; width:96%;"></textarea>
					</div>  

	            </div>
	        <div class="modal-footer" id="fotter10" style="margin-top: 35%;">
            <a href="#" data-dismiss="modal" class="btn" style="margin-top: -1%;">Close</a>
           	<input type="submit" class="btn btn-primary" style="margin-top: -1%;" value="Write">
     		<!-- 
            <a href="#" class="btn btn-primary" style="margin-top: -1%;">Complete</a>
      		-->
          </div>
          </form>
<!-- 0417 게시판 글쓰기 모달 종료(personMain으로 값이 넘어감) -->

<%-- 
글 쓰기

<h3>${qnaBoard.contents}</h3>

<form action="inputQna" method="post">
제목 : <input type="text" name="title"><br>
내용 : <textarea name="contents" rows="10" cols="23"></textarea><br>

<input type="submit" value="등록">
</form>
 --%>
</body>
</html>