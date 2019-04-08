<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>		

</head>

<script>

var hhId = '${sessionScope.loginId}';

$(function(){

	init();
	
});//JQ틀

function init(){
	
	$.ajax({
		
		url:"selectContactedPerson"
		,data:{hhId:hhId}
		,type:"get"
		,success:function(cpList){
			
			var data="";
			
			data+='<h3>컨택 인재 list</h3>';
			data+='<table border="1">';
			data+='<td>이름</td><td>회사 이름</td><td>직책</td><td></td>';
			
			$.each(cpList,function(index, item){
				
				data+='<tr>';
				data+='<td>'+item.personName+'</td>';				
				data+='<td>'+item.comName+'</td>';
				data+='<td>'+item.jobTitle+'</td>';
				data+='<td><input type="button" class="chat-btn" value="1:1채팅"></td>';
				data+='<tr>';
								
			});	//cpList each
			
			data+='</table>';
			
			$("#statusDiv").html(data);
			
		}//init success	
		
	});//init ajax
	
}//function init



</script>

<body>

현황

<div id="statusDiv"></div>

</body>
</html>