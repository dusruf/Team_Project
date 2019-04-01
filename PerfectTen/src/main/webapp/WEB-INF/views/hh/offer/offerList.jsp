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

//alert(oList[index].COMOPTION);

$(function(){

	init();

});//JQ frame

function init(){
	
	
	var loginId=$("#loginId").val();

	$.ajax({
		
		url:"oList"
		,type:"get"
		,success:function(oList){
			
			var data="";
			
			data+='<table border="1"><tr><td>기업 이름</td><td>직업 이름</td><td>회사 주소</td><td>1순위</td><td>2순위</td><td>3순위</td><td>4순위</td><td>5순위</td></tr>';
						
//			console.log(oList);

			if(oList!=null){
				
				$.each(oList,function(index,item){
					
					if (index==0) { //1항은 비교 대상이 없으니 일단 찍어줌
						
						data+='<tr>';
						data+='<td>'+oList[index].COMNAME+'</td>';
						data+='<td>'+oList[index].JOBTITLE+'</td>';
						data+='<td>'+oList[index].COMADDR+'</td>';	
						

						
						if(oList[index].COMOPTION!=null){						
							data+='<td>'+oList[index].COMOPTION+'</td>';
						}					

					} else { //2순위 이하의 옵션을
						
						if(oList[index-1].COMNAME==oList[index].COMNAME) {
														
							data+='<td>'+oList[index].COMOPTION+'</td>';	
							
						} else { //회사 정보를 찍는 곳
							
							data+='</tr>';
							data+='<td>'+item.COMNAME+'</td>';
							data+='<td>'+item.JOBTITLE+'</td>';
							data+='<td>'+item.COMADDR+'</td>';	
						
							if (item.COMOPTION!=null) {
								data+='<td>'+item.COMOPTION+'</td>';
							}//옵션값이 있으면 찍어줌						
							
						}
						
					}//index==0 or not 	
					
										
				});//oList each
	
			} //if not null		
			data+='</tr>';			
			data+='</table>';
			
			$("#offerDiv").html(data);			
			
		}//success
		
	});//ajax
}//init()


</script>
<body>

<input type="hidden" id="loginId" value="${sessionScope.loginId}">
기업 오퍼 정리 페이지<br>

<form action="regOffer" method="get">
<button>오퍼 등록</button>
</form>

<form action="reHHMain" method="get">
<button>메인으로</button>
</form>

<div id="offerDiv">
</div>

</body>
</html>