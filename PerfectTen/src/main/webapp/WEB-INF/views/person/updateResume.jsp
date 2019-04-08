<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이력서 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>		

</head>

<script>

$(function(){

	init();
	
});


function init(){

	
	$.ajax({
		
		//이력서 페이지에 넣을 값을 가져와서 넣음
		url:"putResume"
		,type:"get"
		,success:function(totalResume){
			
			if (totalResume!=null) {
				
				var data="";

				data+='이름 : ${sessionScope.personName}<br>';
				data+='생년월일 : <input type="date" id="birthDate" id="birthDate"><br>';
				data+='성별 : <input type="text" id="gender" id="gender"><br>';
				data+='이메일 : ${sessionScope.personEmail}<br>';
				data+='전화번호 : <input type="text" id="personPhone" id="personPhone"><br>';
				data+='주소 : <input type="text" id="personAddr" id="personAddr"><br>';								
				data+='<hr>';
				
				$("#biDiv").html(data);
			
				$("#birthDate").val(totalResume.birthDate);
				$("#gender").val(totalResume.gender);
				$("#personPhone").val(totalResume.personPhone);
				$("#personAddr").val(totalResume.personAddr);
		
			}//init if totalResume is not null
			
		}//init success
		
	}); //init ajax

}//function init

</script>

<body>

<div id="statusDiv">

<div id="biDiv"></div>

</div>

</body>
</html>