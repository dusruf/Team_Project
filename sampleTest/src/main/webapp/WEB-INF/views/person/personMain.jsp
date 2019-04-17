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
<script>

/* $(function(){

 	$("#regResume").on("click",function(){
			
		$("#resumeRegForm").submit();
 
	});//resumeReg on click

	$("#showResume").on("click",function(){
		
		$("#showResumeForm").submit();

	});//resumeUpdate on click	
	
	$("#qnaBoard").on("click",function(){
		
		$("#qnaBoardForm").submit();

	});//qnaBoard on click	
	
	$("#statusDiv").on("click",function(){
		
		$("#statusForm").submit();

	});//qnaBoard on click	
	
});//JQ 틀 */

//페이징처리 스타트

/*
$(function () {
    window.pagObj = $('#pagination').twbsPagination({
        totalPages: 40, //전체 페이지 갯수
        visiblePages: 10, //표시될 목록 갯수 
        onPageClick: function (event, page) {
            console.info(page + ' (from options)');
        }
    }).on('page', function (event, page) {
        console.info(page + ' (from event listening)');
    });
});
*/

//페이징처리 끝

$(function(){

	init();

});

function init(){
	
	$.ajax({
		
		url:"personQList"
		,type:"get"
		,success:function(qList){
			
			output(qList);
			
		}//init success
		
	});	//init ajax
	
}//init

function output(resp){
	
	var data="";
		
		data+='<table class="table table-hover">';
		data+='<thead>';
		data+='<tr>';
		data+='<th style="width:5%; text-align: center;">번호</th>';				
		data+='<th style="width:55%; text-align: center;">제목</th>';				
		data+='<th style="width:15%; text-align: center;">게시자</th>';				
		data+='<th style="width:15%; text-align: center;">등록일자</th>';				
		data+='</tr>';
		data+='</thead>';
		data+='<tbody>';
	
		$.each(resp, function(index,item){
			
			data+='<tr>';
			data+='<th style="width:5%; text-align: center;">'+item.qBoardSeq+'</th>';		
			data+='<th style="width:55%; text-align: center;">'+item.title+'</th>';				
			data+='<th style="width:15%; text-align: center;">'+item.personId+'</th>';			
			data+='<th style="width:15%; text-align: center;">'+item.indate+'</th>';
			data+='</tr>';
	
		});	
			
		data+='</tbody>';
		data+='<tfoot>';
		data+='</tfoot>';
		data+='</table>';
	
		
		$("#qnaDiv").html(data);
	
}


</script>

<body>

<header class="header3" id="header3">
		<!--header-start-->
		<div class="container">
		</div>
	</header>

<div class="buttons">
	<input type="button" class="btn btn-primary" value="Calendar" onClick="location.href ='diaryPage';">
	 <input type="button" class="btn btn-primary" value="regResume" onClick="location.href ='regResume';">
	 <input type="button" class="btn btn-primary" value="showResumeForm" onClick="location.href ='showResume';">
	 <input type="button" class="btn btn-primary" value="Progress" onClick="location.href ='goStatus';">
	 <button type="button" class="btn5 btn-danger pull-right" id="logout2-btn">Logout</button> 
</div>

<!-- 0415게시판 시작 -->
<div class="contanier">
	<div id="qnaDiv" class="boardPerson col-lg-8"><!-- 게시판div -->
		<!-- 
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width:5%; text-align: center;">번호</th>				
					<th style="width:55%; text-align: center;">제목</th>				
					<th style="width:15%; text-align: center;">게시자</th>				
					<th style="width:15%; text-align: center;">등록일자</th>				
				</tr>
				</thead>
			<tbody>
					게시판 내용이 들어가는 곳
					아래는 예제에요 로직짜면서 지워주심 댑니다~
					<tr>
							<th style="width:5%; text-align: center;">1</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>
					
					<tr>
							<th style="width:5%; text-align: center;">2</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>
					
					<tr>
							<th style="width:5%; text-align: center;">3</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>
					
					<tr>
							<th style="width:5%; text-align: center;">4</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>
					
					<tr>
							<th style="width:5%; text-align: center;">5</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>
					
					<tr>
							<th style="width:5%; text-align: center;">6</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>
					
					<tr>
							<th style="width:5%; text-align: center;">7</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>
					
					<tr>
							<th style="width:5%; text-align: center;">8</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>
					
					<tr>
							<th style="width:5%; text-align: center;">9</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>			

					<tr>
							<th style="width:5%; text-align: center;">10</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>			

					<tr>
							<th style="width:5%; text-align: center;">11</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>			

					<tr>
							<th style="width:5%; text-align: center;">12</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>			
					예제끝
			</tbody>
			<tfoot>


			</tfoot>
		</table>
 -->	
	 </div>
	
	<!-- 0415 1:1채팅창 시작-->
	<div class="contanier">
	<div class="oneChatrom col-lg-4">
		<div class="chatbox" style="margin-top:; margin-left:38.2%;width:61%; height:348px; background-color: #B9E0F7; border-radius: 10px; " >
			<div class="chatfri"style="margin-top:0%; margin-left:-57%;width:56%; height:437px; background-color: white; border: 1px solid!important; border-color:#B9E0F7!important; border-radius: 10px">
				<table>
					<thead>
					<tr>
						<th style="width:5%; text-align: center; padding-top: 4%;">헤드헌터 목록</th>				
					</tr>
						</thead>
							<tbody>
							<!-- 헤드헌터 목록 불러오는곳 -->
							<!-- 임시로 넣었습니다. 추후 로직하실때 로직으로 처리하시면 될듯 합니다. -->
								<tr>
									<th style="width:5%; text-align: center; color: #B9E0F7">기업헤드헌터 김기업</th>		
								</tr>
							</tbody>
							<!-- 헤드헌터 목록 불러오는곳 끝 -->
							
							<tfoot>


							</tfoot>
				</table>
			</div>
			<div class="msg">
			<!-- 채팅글 뜨는곳 -->
			
			</div>
		</div>		
		<textarea class="chattextbox"rows="4" cols="50" style="margin-left: 38.2%; margin-top: 0.5%; border-radius: 10px; border-color:#B9E0F7!important; outline: none!important;" ></textarea>
	</div>
		<input type="button" class="btn btn-primary" id="" value="화상채팅" style="width: 4.7%; height:40px; text-align: center; margin-left:13% ; margin-top: 0.2%;">
		<input type="button" class="btn btn-primary" id="" value="게시글가기" style="width: 4.7%; height:40px; text-align: center; margin-left: ; margin-top: 0.2%;">
		<input type="button" class="btn btn-primary" id="" value="채팅하기" style="width: 4.7%; height:40px; text-align: center; margin-left: ; margin-top: 0.2%;">
		<input type="button" class="btn btn-primary" id="" value="메시지전송" style="width: 4.7%; height:40px; text-align: center; margin-left: ; margin-top: 0.2%;">
		
</div>
	
	<!-- 1:1 채팅창 종료 -->

</div>
<!-- 0415 추가 css 끝 -->
<br><br>

	<div class="writeclass col-lg-8">
		<input type="button" id="writeBoadr" class="btn btn-primary" value="글쓰기" style="float: right; margin-top: -2%;">
	</div>
	<br>
	<br>
<div class="container">
	<nav aria-label="Page navigation">
		<ul class="pagination" id="pagination"  style="text-align: center; margin-left: -6%; margin-top: -2%;">
			
			<li class="page-item frist disabled">
				<a href="#" class="page-link">처음으로</a>	
			</li>
			<li class="page-item first disabled">
				<a href="#" class="page-link">이전페이지</a>
			</li>
			<li class="page-item active">
				<a href="#" class="page-link">1</a>
			</li>
			<li class="page-item active">
				<a href="#" class="page-link">2</a>
			</li>
			<li class="page-item active">
				<a href="#" class="page-link">3</a>
			</li>
			<li class="page-item active">
				<a href="#" class="page-link">4</a>
			</li>
			<li class="page-item active">
				<a href="#" class="page-link">5</a>
			</li>
			<li class="page-item active">
				<a href="#" class="page-link">6</a>
			</li>
			<li class="page-item active">
				<a href="#" class="page-link">7</a>
			</li>
			<li class="page-item active">
				<a href="#" class="page-link">8</a>
			</li>
			<li class="page-item active">
				<a href="#" class="page-link">9</a>
			</li>
			<li class="page-item active">
				<a href="#" class="page-link">10</a>
			</li>
			<li class="page-item next">
				<a href="#" class="page-link">다음페이지</a>
			</li>
			<li class="page-item last">
				<a href="#" class="page-link">마지막 페이지</a>
			</li>
		</ul>
		
	</nav>
</div>
<!-- 게시판 종료 -->












<!-- 기존시작 -->
<!-- 
<h1>person Main</h1>

<form id="resumeRegForm" action="regResume" method="get">
<div id="regResume">
<h1>이력서 등록</h1>
</div>
</form>

<form id="showResumeForm" action="showResume" method="get">
<div id="showResume">
<h1>이력서 보기</h1>
</div>
</form>

<form id="qnaBoardForm" action="qnaBoard" method="get">
<div id="qnaBoard">
<h1>상담 게시판</h1>
</div>
</form>

<form id="statusForm" action="goStatus" method="get">
<div id="statusDiv">
<h1>진행 상황</h1>
</div>
</form>
 -->
 <!-- 기존 끝 -->
 
 
</body>
</html>