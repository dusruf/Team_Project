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
	
	<script src="resources/js/jquery.twbsPagination.js"></script>
	<script src="resources/js/jquery.twbsPagination.min.js"></script>
	<script src="contactform/contactform.js"></script>
	
<!--1 로그인 구글api 구글라이브러리 가져오기 -->
<script src="https://apis.google.com/js/platform.js" async defer></script> 

<!--2 메타태그가져오기 내 id content에입력 -->
<meta name="google-signin-client_id" content="8468277188-blbc1ofh6q6i0ot0t70o52ph8488qekr.apps.googleusercontent.com">
<!-- 51594078902-phag5afrcakorfma2h54i9lib1v0dgav.apps.googleusercontent.com -->


<script>

var id_token; // logout 분기를 주기위한 전역변수

function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
//   console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
//   console.log('Name: ' + profile.getName());
//   console.log('Image URL: ' + profile.getImageUrl());
//   console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
  window.userid=profile.getId();
  
  id_token = googleUser.getAuthResponse().id_token;
  
  var xhr = new XMLHttpRequest();
  xhr.open('POST', 'tokensignin');
  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  xhr.onload = function() {
//     console.log('Signed in as: ' + xhr.responseText);
  };
//   console.log("id_token : " + id_token);
  xhr.send('id_token=' + id_token);   
}
$(document).ready(function(){
	
	function signOut() {  		
   		var auth2 = gapi.auth2.getAuthInstance();
   		auth2.disconnect();
   	 	auth2.signOut().then(function () {
      	console.log('User signed out.');
      	//alert(userid);
      	location.href = "/";
      	})

  	}
	
	 $("#logout2-btn").on("click", function(){
		 
	 	if(id_token != null){
	 		signOut();	
	 	}else{ // 구글로그인이면 아래걸로 실행
	 		location.href="logout";
	 	}	 		
	 });	
	
});	 	
</script>
		
	<!-- 채팅 로직 -->
	<script>
	$(document).ready(function(){
		var roomSeq;
		var chatSeq;
		var repeat; // setInterval끄기
		
		$("#chatStart").on("click", function(){
			if($("#chatStart").val() == "채팅하기"){
				$(".chatbox").css("background-color","#B9E0F7");
				$(".chattextbox").css("background-color", "white");
				$(".chattextbox").attr("disabled", false);
				$.ajax({
					url:"selectChatSequence",
					type:"POST",
					success: function(data){					
						chatSeq = data;					
					}
				});
				interval(); // 주기적으로 함수 실행
				$("#chatStart").val("채팅방나가기");
			}else{
				$(".chatbox").css("background-color","#CDCDCD");
				$(".chattextbox").css("background-color", "#CDCDCD");
				$(".chattextbox").attr("disabled", true);
				$("#chatStart").val("채팅하기");				
				clearInterval(repeat);
				console.log("intervar delete");
				$(".msg").html("");
			}
			
		});
		
		$(".chattextbox").keypress(function(e){			
			if(e.keyCode==13){			
				formSubmit();
			}
		});
		
		function interval(){
			repeat = setInterval(function(){
				console.log("intervar start");
				$.ajax({
					url:"selectChat",
					data: {"roomSeq": roomSeq, "chatSeq": chatSeq},
					type: "get",
					success: function(data){
						var content="";
						for(var i=0; i<data.length; i++){
							content+=data[i].userId+" : "+data[i].message+"<br>";
						}
						$(".msg").html(content);
						$(".msg").scrollTop($(".msg").prop('scrollHeight'));
					}
				});
			},3000)
		}
						
		function formSubmit(){
			var check = $(".chattextbox").val();
			if(check == ""){
				return;
			}
			$.ajax({
				url: "insertChat",
				data: {"message": check, "roomSeq": roomSeq},
				type: "post",
				success:function(){
					$(".chattextbox").focus();
					$(".chattextbox").val("");
					$.ajax({
						url:"selectChat",
						data: {"roomSeq": roomSeq, "chatSeq": chatSeq},
						type: "get",
						success: function(data){
							var content="";
							for(var i=0; i<data.length; i++){
								content+=data[i].userId+" : "+data[i].message+"<br>";
							}
							$(".msg").html(content);
							$(".msg").scrollTop($(".msg").prop('scrollHeight'));
						}
					});
				}
			});			
		}
		
		$("#hyundai").on("click", function(){
			roomSeq = $(this).data("roomseq");			
			$(".msg").html("");
			$(".msg").html("hyundai채팅방"+"<br>");
		});
		
		$("#samsung").on("click", function(){
			roomSeq = $(this).data("roomseq");
			$(".msg").html("");
			$(".msg").html("samsung채팅방"+"<br>");
		});
		
		$("#lg").on("click", function(){
			roomSeq = $(this).data("roomseq");
			$(".msg").html("");
			$(".msg").html("lg채팅방"+"<br>");
		});
		
		// 화상채팅 로직
		$("#camStart").on("click", function(){
			$.ajax({
				url:"CamStart",
				success: function(CamLink){
					var content="";
					content+="<a href=" + CamLink +">링크</a>"
					$(".chattextbox").val(content);
					formSubmit();						
					location.href=CamLink;
				}
			});
		});
	});
</script>

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
//페이징처리 끝
</script>
<style>
	::-webkit-scrollbar {	
		display:none;
	}
</style>
<body>
<!-- googleLogin 필수div 화면상에는 안나오게 처리-->
<div id="test" class="g-signin2" data-onsuccess="onSignIn" style="display:none"></div>
<!-- 0417 게시판 글쓰기 모달 시작(writeQna로 값을 넘김) -->
<div class="modal" id="myModal18" aria-hidden="true" style="background-color: white; width: 40%; height: 50%; margin-left: 10%; margin-top: 14%;"> 
    	<div class="modal-dialog" id="dialog2">
          <div class="modal-content">
		  </div>
		</div>
	  </div>
<!-- 0417 게시판 글쓰기 모달 끝 -->

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

<!-- 게시판 시작 -->
<div class="contanier">
	<div class="boardPerson col-lg-8">
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
					<!-- 게시판 내용이 들어가는 곳 -->
					<!-- 아래는 예제에요 로직짜면서 지워주심 댑니다~ -->
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
					<!-- 예제끝 -->
			</tbody>
			<tfoot>


			</tfoot>
		</table>
	</div>
	
	<!-- 0417 1:1채팅창 시작-->
	<div class="contanier">
	<div class="oneChatrom col-lg-4">
	<div class="chatfri"style="float:left; margin-top:0%; margin-left:22.5%;width:27%; height:348px; background-color: white; border: 1px solid!important; border-color:#B9E0F7!important; border-radius: 10px">
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
								<tr>
									<td id="hyundai" style="width:5%; text-align: center; color: #B9E0F7" data-roomseq="1">현대</td>
								</tr>
								<tr>
									<td id="samsung" style="width:5%; text-align: center; color: #B9E0F7">삼성</td>
								</tr>
								<tr>
									<td id="lg" style="width:5%; text-align: center; color: #B9E0F7">lg</td>
								</tr>
							</tbody>
							<!-- 헤드헌터 목록 불러오는곳 끝 -->
							
							<tfoot>


							</tfoot>
				</table>
			</div>
			<div class="chatbox" style="float:left; margin-top:; margin-left:1.3%;width:48.3%; height:348px; background-color: #CDCDCD; border-radius: 10px; " >
<!-- 			#B9E0F7 -->
								
			<div class="msg" style="overflow:auto; height:348px; -ms-overflow-style:none;">
			<!-- 채팅글 뜨는곳 -->


			</div>
		</div>	 
		<textarea class="chattextbox"rows="4" style="background-color:#CDCDCD;width:467px;margin-left: 22.5%; margin-top: 0.5%; border-radius: 10px; border-color:#B9E0F7!important; outline: none!important;" disabled></textarea>	
		<input type="button" class="btn btn-primary" id="camStart" value="화상채팅" style="width:19%; height:40px; text-align: center; margin-left:22% ; margin-top: 0.2%;">
		<input type="button" class="btn btn-primary" id="" value="게시글가기" style="width:19%; height:40px; text-align: center; margin-left: ; margin-top: 0.2%;">
		<input type="button" class="btn btn-primary" id="chatStart" value="채팅하기" style="width:19%; height:40px; text-align: center; margin-left: ; margin-top: 0.2%;">
		<input type="button" class="btn btn-primary" id="" value="메시지전송" style="width:19%; height:40px; text-align: center; margin-left: ; margin-top: 0.2%;">		
	</div>
		
</div>
	
	<!-- 0417 1:1 채팅창 종료 -->

</div>
<br><br>

	<div class="writeclass col-lg-8">
		<!-- <input type="button" id="writeBoadr" class="btn btn-primary" value="글쓰기" style="float: right; margin-top: 0%;"> -->
		<!-- 0417 게시판 글쓰기 버튼 -->
	<a data-toggle="modal" href="writeQna" data-target="#myModal18" role="button" data-backdrop="static">
 <span class="btn btn-primary" style="float: right; margin-top: 0%;">글쓰기</span>
	</a>
	</div>
	<!-- 0417 게시판 글쓰기 버튼  끝-->
	<br>
	<br>
<div class="container">
	<nav aria-label="Page navigation">
		<ul class="pagination" id="pagination"  style="text-align: center; margin-left: -6%; margin-top: 2%;">
			
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
<!-- <h1>person Main</h1>

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
</form> -->
<!-- 기존끝 -->
 
 
</body>
</html>