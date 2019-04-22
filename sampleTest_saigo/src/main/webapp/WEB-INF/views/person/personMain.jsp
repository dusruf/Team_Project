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
	

</head>
<script>


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

$(function(){

	init();
	
	//표시
//	$("#updateBoard").on("click", updateBoard);
	$("#closeUpdate").on("click", function(){$("#myModal21").modal("hide");});
	
	
//	updateBoard();
	
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

		$.each(resp, function(index,item){
			
			data+='<tr>';
			data+='<th style="width:5%; text-align: center;">'+index+'</th>';		
			data+='<th style="width:55%; text-align: center;"><a data-toggle="modal" href="#myModal20" class="readBoard" show-val="'+item.qBoardSeq+'">'+item.title+'	['+item.commentNum+']'+'</a></th>';				
			data+='<th style="width:15%; text-align: center;">'+item.personId+'</th>';			
			data+='<th style="width:15%; text-align: center;">'+item.indate+'</th>';
			data+='</tr>';
	
		});	
			
		$("#qnaTbody").html(data);
		$(".readBoard").on("click",readBoard);
	
	
}

function readBoard(){
	
	var qBoardSeq = $(this).attr("show-val");

//	alert(qBoardSeq);
	
	$.ajax({
		
		url:"readBoard"
		,data:{qBoardSeq:qBoardSeq}
		,type:"get"
		,success:function(qna){
			
			var bData="";
			
			bData+='<table class="table table-boadered">';
			bData+='<tr><td style="padding-right:2%; width:2%;">title</td><td>'+qna[0].TITLE+'</td></tr>';
			bData+='<tr><td>name</td><td>'+qna[0].PERSONID+'</td></tr>';
			bData+='<tr><td>date</td><td>'+qna[0].INDATE+'</td></tr>';
			bData+='<tr><td colspan="2">'+qna[0].CONTENTS+'</td></tr>';
			
			$("#boardDiv").html(bData);
			
			var btnData="";
			btnData+='<a href="#" data-dismiss="modal" class="btn" style="margin-top: -1%;">Close</a>';
			btnData+='<a href="#" class="btn btn-primary" udt-val="'+qna[0].QBOARDSEQ+'" id="updateBoard" style="margin-top: -1%;">Update</a>';
			btnData+='<input type="button" style="margin-top:-1%;" id="del-btn" class="btn btn-danger" del-val="'+qna[0].QBOARDSEQ+'" value="Delete">'; 
			
			$("#fotter10").html(btnData);		
			$('#updateBoard').on('click', updateBoard);
			$("#del-btn").on('click', deleteBoard);
			
			var comment="";
			
			if(qna[0].COMMENTSEQ!=null){
								
				comment+='<table>';
				
				$.each(qna, function(index, item){
					
					comment+='<tr>';			
					comment+='<td>'+item.HHNAME+'</td>';
					comment+='<td>'+item.COMMENTS+'</td>';
					comment+='<td>'+item.COMDATE+'</td>';
					comment+='</tr>';
					
				});//each
				
				comment+='</table>';
				
				$("#commentDiv").html(comment);
					
			}//댓글 유무 if
			
			else{
				
				comment+='<h3>댓글 없음</h3>';
				
				$("#commentDiv").html(comment);
				
			}
			
		}//readBoard success		
		
	});//ajax readBoard
	
}//readBoard

function deleteBoard(){
	
	var qBoardSeq = $(this).attr("del-val");
//	alert(qBoardSeq);
	
	
	$.ajax({
		
		url:"deleteBoard"
			,data:{qBoardSeq:qBoardSeq}
			,type:"post"
			,success:function(result){
				
				if (result==1) {					
					alert("삭제 성공");
					$("#myModal20").modal("hide");
					init();					
				} else {
					alert("삭제 실패");
					$("#myModal20").modal("hide");
					init();				
				}

			}//deleteBoard success
		
	});//deleteBoard ajax
		
}//function deleteBoard

function updateBoard(){
	
	var qBoardSeq = $(this).attr("udt-val");
//	console.log(qBoardSeq)
//	alert(qBoardSeq);
	
	$("#myModal20").modal("hide");
	$("#myModal21").modal("show");

	getBoard(qBoardSeq);
	
}//updateBoard

function getBoard(qBoardSeq){
	
//	alert("getBoard : "+qBoardSeq);
	
	var data="";
	$.ajax({
		
		url:"iwannagetBoard"
		,data:{qBoardSeq:qBoardSeq}
		,type:"get"
		,success:function(qnaBoard){


			data+='<h3 style="margin:2% 0% 0% 2%;"> 제목 </h3> <input type="text" class="form-control" style="margin:-3.2% 0% 0% 10%;" id="title" value="'+qnaBoard.title+'"><br>';
			data+='<h3 style="margin:2% 0% 0% 2%;">글 내용 </h3> <input type="text" class="form-control" style="margin:-3.2% 0% 0% 10%;;" id="contents" value="'+qnaBoard.contents+'">';
			data+='<input type="hidden" id="commentNum" name="commentNum" value="'+qnaBoard.commentNum+'">';
			data+='<input type="hidden" id="qBoardSeq" name="qBoardSeq" value="'+qnaBoard.qBoardSeq+'">';	
			$("#tempDiv").html(data);
	
			$("#myModal21").modal("show");
			
		}//success
		
	});//ajax

	$("#tempDiv").html(data);
	
	var btnData="";
	
	btnData+='<a href="#" data-dismiss="modal" id="udt-btn" class="btn" style="margin-top: -1%;">수정</a>';
	btnData+='<a href="#" data-dismiss="modal" id="closeUpdate" class="btn" style="margin-top: -1%;">Close</a>';

	$("#fotter11").html(btnData);
	$("#udt-btn").on("click",putUpdate);
	
}

function putUpdate(){

	var title=$("#title").val();
	var contents=$("#contents").val();
	var commentNum=$("#commentNum").val();
	var qBoardSeq=$("#qBoardSeq").val();
	
//	alert(title+" / "+contents);
//	alert(qBoardSeq);
	
	$.ajax({
		
		url:"inputUpdate"
		,data:{
			qBoardSeq:qBoardSeq
			,title:title
			,contents:contents
			,commentNum:commentNum
		}
		,type:"post"
		,success:function(result){
			
			if (result==1) {
				
				alert("수정 성공");
				init();
				
			} else {
				alert("수정 실패");
			}
			
		}//inputUpdate success
		
	});//inputUpdate ajax
	
}//inputUpdate function


</script>
<style>
	::-webkit-scrollbar {	
		display:none;
	}
</style>
<body>

<!-- 0420 게시글보기 모달창 시작. -->
   <div class="modal" id="myModal20" aria-hidden="true" style="display: none; z-index: 1050;  overflow: auto;"  >
       <div class="modal-dialog" style="width: 40%; height: 50%; margin-left: 10%; margin-top: 14%;">
          <div class="modal-content modalone">
            <div class="modal-header" style="height: 40px;">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin: -14px 10px; ">×</button>
              <h4 class="modal-title" style="margin: -12px;">BOARD</h4>
            </div><div class="container"></div>
            <div class="modal-body" style="padding: 0 0 0 0;">
         
            <div class="form-group" style="margin-bottom: 23%;">
                 
                 <div id="boardDiv"></div>
                 
                 <hr>
                 
                 <div id="commentDiv" style="padding-left: 2%;"></div>
                 
               </div>  
               
               </div>
           <div class="modal-footer" id="fotter10" style="margin-top: 0%;">
         
          </div>
        </div>
      </div>
    </div>
   
      <!-- 0420 게시글보기 모달창 끝. -->
   <!-- 모달 띄우는 명령어(이건 상황에 맞게 변형하시면 될듯 합니다 ~ -->
   <a data-toggle="modal" id="showBoard" href="#myModal20"></a>
   
<!-- 0420 연우모달 시작 게시글 수정 -->
   
   <div class="modal" id="myModal21" aria-hidden="true" style="display: none; z-index: 1050;  overflow: auto;"  >
       <div class="modal-dialog" style="width: 40%; height: 50%; margin-left: 10%; margin-top: 14%;">
          <div class="modal-content modalone">
            <div class="modal-header" style="height: 40px;">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin: -14px 10px; ">×</button>
              <h4 class="modal-title" style="margin: -12px;">BOARD</h4>
            </div><div class="container"></div>
            <div class="modal-body">
         
            <div class="form-group" style="margin-bottom: 23%;">
        		
				<div id="tempDiv"></div>
                 
                 
                 
               </div>  
               
               </div>
           <div class="modal-footer" id="fotter11" style="margin-top: 35%;">
         
          </div>
        </div>
      </div>
    </div>
   
      <!-- 0420 게시글보기 모달창 끝. -->
   <!-- 모달 띄우는 명령어(이건 상황에 맞게 변형하시면 될듯 합니다 ~ -->
   <a data-toggle="modal" id="showBoard" href="#myModal20"></a>
    
   
   
<!-- 0420 연우모달 끝 -->

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
	 <input type="button" class="btn btn-primary" value="showResume" onClick="location.href ='showResume';">
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
			<tbody id="qnaTbody">
					<!-- 게시판 내용이 들어가는 곳 -->
	
			</tbody>
			<tfoot>


			</tfoot>
		</table>
	</div>
	
	<!-- 화상채팅 -->
	<script>
		$(document).ready(function(){
			$("#camStart").on("click", function(){
				$.ajax({
					url:"CamStart",
					success: function(CamLink){												
						location.href=CamLink;
					}
				});
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
				interval();
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
			$(".msg").html("");
			$(".msg").html("samsung채팅방"+"<br>");
		});
		
		$("#lg").on("click", function(){
			$(".msg").html("");
			$(".msg").html("lg채팅방"+"<br>");
		});
	});
</script>
	
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
		<!-- <input type="button" class="btn btn-primary" id="" value="게시글가기" style="width:19%; height:40px; text-align: center; margin-left: ; margin-top: 0.2%;"> -->
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

 
 
</body>
</html>