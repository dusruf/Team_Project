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
	
	<script src="contactform/contactform.js"></script>

</head>

<script>

var personId = '${sessionScope.personId}';

$(function(){

	init();

});//JQ 틀

function init(){
	
	$.ajax({
		
		url:"showMessage"
		,type:"get"
		,success:function(cmList){
			
			var data="";
			
			if (cmList!=null){ //여기 질문하기 응답 후 메세지 없음이 떠야 함 0409
							
				$.each(cmList,function(index,item){
				
	//				if (item.cmStatus==0) {//아직 응답하지 않은 cm만 출력
												
						data+='<tr>'
					
						data+='<th style="width:10%; text-align: center; vertical-align: middle;">'+item.contactTitle+'</th>';			
						data+='<th style="width:5%; text-align: center; vertical-align: middle;">'+item.hhName+'</th>';				
						data+='<th style="width:6%; text-align: center; vertical-align: middle;">'+item.cmIndate+'</th>';				
						data+='<th style="width:5%; text-align: center;"><input type="button" class="cm-btn" cmSeq-value="'+item.cmSeq+'" value="자세히 보기"></th>';
						
						if(item.cmStatus==1){
							
							data+='<th style="width:5%; text-align: center;"><input type="button" class="cm-del" cmDel-value="'+item.cmSeq+'" value="삭제"></th>';
								
						}
						
						data+='</tr>';	
						
	//				}
					
				});//each

		//		data+='</table>';

			} else {				
				data+='<h3>메세지 없음</h3>';				
			}
			
			$("#cmTbody").html(data);
			$(".cm-btn").on("click",cmDetail);
			$(".cm-del").on("click",cmDelete);
			
			function cmDelete(){
			
				var cmSeq=$(this).attr("cmDel-value");
				alert(cmSeq);
				
				$.ajax({
					
					url:"cmDelete"
					,data:{cmSeq:cmSeq}
					,type:"post"
					,success:function(result){
						
						if(result==1){
							
							alert("삭제 성공");
							init();
							
						}else{
							
							alert("삭제 실패");
							init();
						}
						
						
					}//cmDelete ajax
					
					
				});//cmDelete function
				
			}//cmDelete
			
			function cmDetail(){
				
				var cmSeq=$(this).attr("cmSeq-value");
	//			alert(cmSeq);
				
				$.ajax({
					
					url:"cmDetail"
					,data:{
						cmSeq:cmSeq
					}
					,type:"get"
					,success:function(cm){
			
						if(cm!=null){
								
				//			alert(cm.contactMessage);
				//			alert(cm.cmStatus);			
				
				
							var cmDetail="";
							
							cmDetail+='<tr>';
							cmDetail+='<th style="width:66%; text-align: center;">'+cm.contactMessage+'</th>';			

							
							if (cm.cmStatus==1) {
								
								if (cm.cmAnswer==2) {

									cmDetail+='<th style="width:8%; text-align: right; margin-left: 0px">요청</th>';			
									cmDetail+='<th style="width:16%; text-align: left; margin-right: 0px">수락</th>';
									
								//	cmDetail+='<h3>응답 완료(요청 수락)</h3>';									
							
								} else if(cm.cmAnswer==0) {
									
									cmDetail+='<th style="width:8%; text-align: right; margin-left: 0px">요청</th>';			
									cmDetail+='<th style="width:16%; text-align: left; margin-right: 0px">거절</th>';
									
								//	cmDetail+='<h3>응답 완료(요청 거절)</h3>';									
								
								} else{

									cmDetail+='<th style="width:8%; text-align: right; margin-left: 0px">오류가</th>';			
									cmDetail+='<th style="width:16%; text-align: left; margin-right: 0px">났다는 뜻</th>';

								//	cmDetail+='<h3>오류 났음</h3>';																	
							
								}
								
								
							} else {
				
								cmDetail+='<th style="width:8%; text-align: right; margin-left: 0px">';
								cmDetail+='<input type="radio" name="cmAnswer" value="cmYes" /> YES';
								cmDetail+='</th>';			
								
								cmDetail+='<th style="width:16%; text-align: left; margin-right: 0px">';
								cmDetail+='<input type="radio" name="cmAnswer" value="cmNo" checked="checked" /> NO';
								cmDetail+='</th>';		
								
								cmDetail+='<th style="width:8%; text-align: left; margin-right: 0px">'
								cmDetail+='<input type="button" class="cmAnswer-btn" value="SEND">';
								cmDetail+='</th>';
								
							}
							
							$("#cmDetailTbody").html(cmDetail);
							$(".cmAnswer-btn").on("click",changeStatus);
							
							function changeStatus(){
														
								var cmAnswer=$(':radio[name="cmAnswer"]:checked').val();
							//	alert(cmSeq+" / "+cmAnswer+" / "+personId);
							
								$.ajax({
									
									url:"cmAnswer"
									,data:{
										cmSeq:cmSeq
										,cmAnswer:cmAnswer
										,personId:personId
									}
									,type:"post"
									,success:function(finalResult){
										
										if (finalResult==1) {
											var finalData="";
																					
											$("#cmDetailDiv").html(finalData);
											alert("응답을 보냈습니다.");
											init();
											
										}// 두번의 update가 모두 성공하는 if 
										
										else{
											
											alert("응답을 보내지 못했습니다.");
											init();
											
										}
										
									}//changStatus success	
								
								});//changeStatus Ajax
							
 							}//function changeStatus 
 							
						}//cm is not null
						
					}//cmDetail success
					
				});//cmDetail ajax
			
			}// function cmDetail
			
		}// showMessage success	
		
	});	//showMessage ajax
	
}//init

</script>

<body>

<header class="header3" id="header3">
		<!--header-start-->
		<div class="container">
		</div>
	</header>
	
<!-- 진행상황 시작 -->
<div class="contanier">
	<div class="personSinkou col-lg-6">
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width:10%; text-align: center;">메시지 제목</th>				
					<th style="width:5%; text-align: center;">헤드헌터</th>				
					<th style="width:6%; text-align: center;">보낸날짜</th>				
					<th style="width:5%; text-align: center;">자세히보기</th>				
					<th style="width:5%; text-align: center;"></th>				
				
				</tr>
				</thead>
			<tbody id="cmTbody">
					
						
				
					<!-- 진행상황 내용이 들어가는 곳 -->
					<!-- 아래는 예제에요 로직짜면서 지워주심 댑니다~ -->
		
					<!-- 
					<tr>
							<th style="width:10%; text-align: center; vertical-align: middle;">안녕하세요. 이력서보고 연락드립니다.</th>				
							<th style="width:5%; text-align: center; vertical-align: middle;">김빵긋</th>				
							<th style="width:6%; text-align: center; vertical-align: middle;">2019-04-13</th>				
							<th style="width:5%; text-align: center;"><input type="button" class="btn btn-danger" id="cmDetailDiv" value="자세히 보기"></th>
					</tr>
					<tr>
							<th style="width:10%; text-align: center; vertical-align: middle;">adsf. 이력서보고 연락드립니다.</th>				
							<th style="width:5%; text-align: center; vertical-align: middle;">김김ㄱ미</th>				
							<th style="width:6%; text-align: center; vertical-align: middle;">df-04-13</th>				
							<th style="width:5%; text-align: center;"><input type="button" class="btn btn-danger" id="cmDetailDiv" value="자세히 보기"></th>
					</tr>
					 -->
					 
					
				 	
					
					<!-- 예제끝 -->
					
					
			</tbody>
			<tfoot>
			</tfoot>
		</table>
	</div>
<div class="personSinkoukuwasii col-lg-6">
	<table class="table table-hover">
		<thead>
			<tr>
				<th style="width:66%; text-align: center;">메시지 내용</th>			
				<th style="width:8%; text-align: right; margin-left: 0px">요청</th>			
				<th style="width:16%; text-align: left; margin-right: 0px">응답</th>
				<th style="width:8%; text-align: left; margin-right: 0px"></th>
				<th></th>			
			</tr>
			</thead>
			<tbody id="cmDetailTbody">
			
								
				<!-- 
				<tr>
					<th style="width:10%; text-align: center; vertical-align: middle;">안녕하세요. 이력서보고 연락드립니다.</th>				
					<th style="width:5%; text-align: center; vertical-align: middle;">김빵긋</th>				
					<th style="width:6%; text-align: center; vertical-align: middle;">2019-04-13</th>				
					<th style="width:5%; text-align: center;"><input type="button" class="btn btn-danger" id="cmDetailDiv" value="자세히 보기"></th>
				</tr>
				 -->
				
				<!-- 
				<tr>
					<th style="width:66%; text-align: center; vertical-align: middle;" >삼성증권 인재채용관련 입니다.</th>			
					<th style="width:8%; text-align: center; vertical-align: middle;" > <label class="btn btn-info ">
					 	<input type="radio" name="options50" id="option50" value="requestYes" autocomplete="off" style="vertical-align: middle; margin: 0px 0px 0px 0px!important;">YES
					</label></th>			
					<th style="width:16%; text-align: center; vertical-align: middle;" ><label class="btn btn-danger ">
					 	<input type="radio" name="options50" id="option51" value="requestNo" autocomplete="off" style="vertical-align: middle; margin: 0px 0px 0px 0px!important;">NO
					</label></th>
					<th><input type="button" id="requestcom" class="btn btn-primary" value="Send"></th>			
				</tr>
				 -->
			
			</tbody>
	</table>

</div>
	
</div>
<!-- 진행상황 종료 -->

<!-- 기존  -->
<!-- 
<div id="cmDiv"></div>

<div id="cmDetailDiv"></div>
 -->
 <!-- 기존 -->



</body>
</html>