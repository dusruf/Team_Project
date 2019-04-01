<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진행 상황</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>		
 
</head>

<script>

var personId = '${sessionScope.loginId}';

$(function(){

	init();

});//JQ 틀 

function init(){
	
	$.ajax({
		
		url:"showMessage"
		,type:"get"
		,success:function(cmList){
			
			var data="";
			
			if (cmList!=null){ //여기 질문하기 메세지 없음이 떠야 함
								
				$.each(cmList,function(index,item){
				
					if (item.cmStatus==0) {//아직 응답하지 않은 cm만 출력
					
						alert("테스트");
						
						data+='<table border="1">';
						data+='<tr><td>메세지 제목</td><td>헤드헌터</td><td>보낸 날짜</td><td></td></tr>';
						data+='<tr>'
						data+='<td>'+item.contactTitle+'</td>';
						data+='<td>'+item.hhName+'</td>';
						data+='<td>'+item.cmIndate+'</td>';
						data+='<td><button class="cm-btn" cmSeq-value="'+item.cmSeq+'">자세히 보기</button></td>';				
						data+='</tr>';	
						data+='</table>';
						
					}
					
				});//each
				
			} else {				
				data+='<h3>메세지 없음</h3>';				
			}
			
			$("#cmDiv").html(data);
			$(".cm-btn").on("click",cmDetail);
			
			function cmDetail(){
				
				var cmSeq=$(this).attr("cmSeq-value");
				
				$.ajax({
					
					url:"cmDetail"
					,data:{
						cmSeq:cmSeq
					}
					,type:"get"
					,success:function(cm){
			
						if(cm!=null){
							
							var cmDetail="";
							cmDetail+='<table border="1">';
							cmDetail+='<tr><td>헤드헌터</td><td>'+cm.hhId+'</td></tr>';
							cmDetail+='<tr><td>메세지 제목</td><td>'+cm.contactTitle+'</td></tr>';
							cmDetail+='<tr><td>발송 시간</td><td>'+cm.cmIndate+'</td></tr>';
							cmDetail+='<tr><td>메세지 내용</td><td>'+cm.contactMessage+'</td></tr>';
							cmDetail+='</table>';
							cmDetail+='<table>';	
							cmDetail+='<tr><td>컨텍 요청에 응하시겠습니까?</td></tr>';
							cmDetail+='<tr><td>'
							cmDetail+='<input type="radio" name="cmAnswer" value="cmYes" /> YES';
							cmDetail+='<input type="radio" name="cmAnswer" value="cmNo" checked="checked" /> NO</td></tr>';
							cmDetail+='<tr><td>';
							cmDetail+='<input type="button" class="cmAnswer-btn" value="SEND">';
							cmDetail+='</td></tr>';
							cmDetail+='</table>';
							
							$("#cmDetailDiv").html(cmDetail);
							$(".cmAnswer-btn").on("click",changeStatus);
							
							function changeStatus(){
														
								var cmAnswer=$(':radio[name="cmAnswer"]:checked').val();
								
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
											alert("응답을 보냈습니다.");
											var finalData="";
											
											$("#cmDetailDiv").html(finalData);

										}// 두번의 update가 모두 성공하는 if 
										
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

진행상황

<div id="cmDiv"></div>

<div id="cmDetailDiv"></div>


</body>
</html>