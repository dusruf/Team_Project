<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심 인재 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>		

</head>
<script>

var hhId = '${sessionScope.loginId}';
var hhName = '${sessionScope.hhName}';

$(function(){
	
init();
	
});//JQ frame

function init(){


	$.ajax({
		
		url:"pickList"
		,data:{
			hhId:hhId
		}
		,type:"get"
		,success:function(pickList){
			
			var data='';
			
			data+='<table border="1">';
			data+='<tr><td>회사 이름</td><td>직업 이름</td><td>구직자 이름</td><td></td><td></td></tr>';
			
			$.each(pickList,function(index, item){
				
				data+='<tr>';
				data+='<td>'+item.comName+'</td>';
				data+='<td>'+item.jobTitle+'</td>';
				data+='<td>'+item.personName+'</td>';
				data+='<td><button class="detail-btn" pick-value="'+item.personId+'">이력서 보기</button></td>';
				data+='<td><button class="contact-btn" name-value="'+item.personName+'" contact-value="'+item.personId+'">컨택하기</button></td>';				
				data+='</tr>';
				
			});// each
				
			data+='</table>';
			
			$("#listDiv").html(data);
			$(".detail-btn").on("click", personDetail);
			$(".contact-btn").on("click", contactPerson);
			
			
			
		}//success
		
	});//init ajax
	
}//function init

function contactPerson(){
	
	var personId=$(this).attr("contact-value");	
	var personName=$(this).attr("name-value");	
		
	var data="";
	
	data+='메세지 제목 : <input type="text" name="contactTitle" id="contactTitle"><br>';
	data+='메세지 내용 : <textarea name="contactMessage" id="contactMessage"></textarea><br>';
	data+='<input type="hidden" id="personId" value="'+personId+'">'
	data+='<input type="hidden" id="personId" value="'+personName+'">'
	data+='<button id="send-btn">메세지 보내기</button>';
	

	$("#contactDiv").html(data);
	$("#send-btn").on("click",sendMessage);
	
	//sendMessage
	
	function sendMessage(){
		
		var contactTitle = $("#contactTitle").val();
		var contactMessage = $("#contactMessage").val();
		
		$.ajax({
			
			url:"sendMessage"
			,data:{
				contactTitle:contactTitle
				,contactMessage:contactMessage
				,personId:personId
				,personName:personName
				,hhId:hhId
				,hhName:hhName
			}
			,type:"post"
			,success:function(result){
				
				if (result==1) {
					alert("메세지를 성공적으로 보냈습니다.");	
					
					var success ="";
					
					$("#contactDiv").html(success);				
					
				} else {
					
					alert("메세지 전송 오류");
					
				}
				
			}//success
			
		});//ajax
		
		
	}//sendMessage

	
}//function contactPerson
/* 
function sendMessage(){
	
	var contactTitle = $("#contactTitle").val();
	var contactMessage = $("#contactMessage").val();
	var personId=$("#personId").val();
	
	$.ajax({
		
		url:"sendMessage"
		,data:{
			contactTitle:contactTitle
			,contactMessage:contactMessage
			,personId:personId
			,hhId:hhId
		}
		,type:"post"
		,success:function(result){
			
			if (result==1) {
				alert("메세지를 성공적으로 보냈습니다.");	
				
				var success ="";
				
				$("#contactDiv").html(success);				
				
			}
			
		}//success
		
	});//ajax
	
	
}//sendMessage
 */
function personDetail(){
	
	var personId=$(this).attr("pick-value");
	
	
}

</script>

<body>

관심 인재 리스트

<div id="listDiv"></div>
<div id="contactDiv"></div>

</body>
</html>