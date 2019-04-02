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
var comName="";
var jobTitle="";
var requestSeq="";	
var personId="";
var personName="";

$(function(){

$("#showOption").on('click',showOption);
$("#showPerson").on('click',showPerson);

});//first tool

//옵션 보여주기 임시로
function showOption(){
	
	var loginId=$("#loginId").val();
		 
	$.ajax({
		
		url:"oList"
		,data:{loginId:loginId}
		,type:"get"
		,success:function(oList){
			
			if (oList!=null) {
			
				var data="";
				
				data+='<table border="1">';
				data+='<tr>';
				data+='<td>회사 이름</td><td>직업 이름</td><td></td>';
				data+='</tr>';
			
				$.each(oList, function(index,item){			
					
					if (index==0) {
						
						data+='<tr>';
						data+='<td>'+item.COMNAME+'</td><td>'+item.JOBTITLE+'</td>';
						data+='<td class="c_btn"><button class="com_btn" comName-value="'+item.COMNAME+'" jobTitle-value="'+item.JOBTITLE+'" requestSeq-value="'+item.REQUESTSEQ+'">선택</button></td>';
						data+='</tr>';
						
					} else if (oList[index-1].COMNAME!=oList[index].COMNAME) {

						data+='<tr>';
						data+='<td>'+item.COMNAME+'</td><td>'+item.JOBTITLE+'</td>';
						data+='<td class="c_btn"><button class="com_btn" comName-value="'+item.COMNAME+'" jobTitle-value="'+item.JOBTITLE+'" requestSeq-value="'+item.REQUESTSEQ+'">선택</button></td>';
						data+='</tr>';
						
					}
					
				});//each
			
				data+='</table>';
				
				$("#comDiv").html(data);
				$(".com_btn").off("click").on("click",pickPerson);
							
			}// oList not null
			
		}//success
		
	}); //옵션을 불러오는 ajax
	
}//function showOption

function showPerson(){
	
	$.ajax({
		
		url:"personList"
		,type:"get"
		,success:function(pList){

			var data="";
			
			data+='<table border="1"><tr><td>PERSONNAME</td><td>버튼</td></tr>';
			
			$.each(pList,function(index,item){
				
				data+='<tr>';
				data+='<td>'+item.personName+'</td>';
				data+='<td class="btn"><button class="pick_btn" personName-value="'+item.personName+'" personId-value="'+item.personId+'">관심</button></td>';
				data+='</tr>';
				
			});	//each		

			data+='</table>';
			
			$("#personDiv").html(data);
			$(".pick_btn").off("click").on("click",pickPerson);
			
		}//success
		
	});//ajax
	
}//showPerson, 기능 구현을 위해 임시로


function pickPerson(){

	var cm=$(this).attr("comName-value");
	var jv= $(this).attr("jobTitle-value");
	var rv=$(this).attr("requestSeq-value");	
	var pv=$(this).attr("personId-value");
	var nv=$(this).attr("personName-value");
	
	if(typeof cm!="undefined"){
	comName = $(this).attr("comName-value");
	}
	if(typeof jv!="undefined"){
	jobTitle = $(this).attr("jobTitle-value");
	}
	if(typeof rv!="undefined"){
	requestSeq = $(this).attr("requestSeq-value");	
	}
	if(typeof pv!="undefined"){
		personId = $(this).attr("personId-value");
	}
	if(typeof pv!="undefined"){
		personName = $(this).attr("personName-value");
	}
	
	if(comName!=""&&jobTitle!=""&&requestSeq!=""&&personId!=""&&personName){
		console.log(personId);
		$.ajax({
			
			url:"pickPerson"
			,data:{
				comName:comName
				,jobTitle:jobTitle
				,requestSeq:requestSeq
				,personId:personId
				,personName:personName
			}
			,type:"post"
			,success:function(result){
			
				if(result==1){
					
					alert("인재 등록 성공");
					
				} else{
					
					alert("인재 등록 실패");
					
				}
				
			}//success
			
		});//ajax
	}
	
	
  
 //	alert(personSeq);
	
	
}//pickPerson, 기능 구현을 위해 임시로

</script>

<body>

인재 찾기 
<input type="hidden" id="loginId" value="${sessionScope.loginId}">
<button id="showOption">옵션 불러오기</button>
<button id="showPerson">임시로 person 불러오기</button>

<div id="personDiv">
</div>

<div id="comDiv">
</div>

<div id="oListDiv">
</div>

</body>
</html>