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

var loginId = '${sessionScope.loginId}';

$(function(){

	init();
	button();
	
}); //JQ 틀

function init(){
	
	$.ajax({
		
		url:"checkResume"
		,data:{
			loginId:loginId
		}
		,type:"get"
		,success:function(resumeSeq){
			
			if(resumeSeq>0){
								
				$.ajax({
					
					url:"selectBasicInfo"
					,data:{
						resumeSeq:resumeSeq
					}
					,type:"get"
					,success:function(bi){
						  							
						var data="";
						
						data+='<h3>기본 정보</h3>';
						data+='<table border="1"><tr>';
						data+='<td>이름</td><td>'+bi.personName+'</td>';
						data+='</tr><tr>';
						data+='<td>생년월일</td><td>'+bi.birthDate+'</td>';
						data+='</tr><tr>';
						data+='<td>성별</td><td>'+bi.gender+'</td>';
						data+='</tr><tr>';
						data+='<td>이메일</td><td>'+bi.personEmail+'</td>';
						data+='</tr><tr>';
						data+='<td>주소</td><td>'+bi.personAddr+'</td>';
						data+='</tr>';
						data+='</table>';
						data+='<hr>';	
						
						$("#basicInfoDiv").html(data);		
							
						$.ajax({
							
							url:"selectCareer"
							,data:{								
								resumeSeq:resumeSeq
							}
							,type:"get"
							,success:function(careerList){
								
								if(careerList!=null){
									
									var cData="";
									
									cData+='<h3>경력사항</h3>';
									
									
									$.each(careerList,function(index,item){
										
										cData+='<table border="1">';								
										cData+='<tr>';
										cData+='<td>회사 이름</td><td>'+item.companyName+'</td>';
										cData+='</tr><tr>';
										cData+='<td>분야</td><td>'+item.careerCategory+'</td>';
										cData+='</tr><tr>';
										cData+='<td>시작일</td><td>'+item.careerStartDate+'</td>';
										cData+='</tr><tr>';
										cData+='<td>종료일</td><td>'+item.careerEndDate+'</td>';
										cData+='</tr><tr>';
										cData+='<td>부서</td><td>'+item.careerDepartment+'</td>';
										cData+='</tr><tr>';
										cData+='<td>직책</td><td>'+item.careerPosition+'</td>';
										cData+='</tr><tr>';
										cData+='<td>근무 지역</td><td>'+item.careerRegion+'</td>';
										cData+='</tr><tr>';
										cData+='<td>연봉</td><td>'+item.careerSalary+'</td>';
										cData+='</tr><tr>';
										cData+='<td>담당 업무</td><td>'+item.careerTask+'</td>';
										cData+='</tr><tr>';
										cData+='<td>상세 설명</td><td>'+item.careerDetails+'</td>';
										cData+='</tr>';
										cData+='</table>';
										cData+='<br>';	
								
									});//careerList each
									
									cData+='<hr>';
									$("#careerDiv").html(cData);
									
								} //careerList가 있으면
							
								$.ajax({
									
									url:"selectCerti"
									,data:{
										resumeSeq:resumeSeq
									}
									,type:"get"
									,success:function(certiList){
										
										if (certiList!=null) {
											
											var cerData="";
											
											cerData+='<h3>자격증</h3>';
											
											$.each(certiList,function(index,item){
												
												cerData+='<table border="1">';
												cerData+='<tr>';
												cerData+='<td>자격증</td><td>'+item.certiTitle+'</td>';
												cerData+='</tr><tr>';
												cerData+='<td>발행 기관</td><td>'+item.certiOrg+'</td>';
												cerData+='</tr><tr>';
												cerData+='<td>취득 날짜</td><td>'+item.certiDate+'</td>';
												cerData+='</tr></table><br>';											
												
											});//certiList each											
											
											cerData+='<hr>';
											$("#certiDiv").html(cerData);
											
										}// certiList is not null
										
										$.ajax({
											
											url:"selectLanguageScore"
											,data:{resumeSeq:resumeSeq}
											,type:"get"
											,success:function(languageScoreList){
												
												var langData="";
												
												if(languageScoreList!=null){ //여기 조건 수정하기
													
													langData+='<h3>언어 점수</h3>';
													
													$.each(languageScoreList, function(index,item){												
														
														langData+='<table><tr>';
														langData+='<td>언어</td><td>'+item.languageType+'</td>';
														langData+='</tr><tr>';
														langData+='<td>시험</td><td>'+item.languageTitle+'</td>';
														langData+='</tr><tr>';
														langData+='<td>점수</td><td>'+item.languageScore+'</td>';
														langData+='</tr><tr>';
														langData+='<td>발행 기관</td><td>'+item.languageOrg+'</td>';
														langData+='</tr><tr>';
														langData+='<td>발행 날짜</td><td>'+item.languageDate+'</td>';
														langData+='</tr></table>';
														
													});//languageScoreList each
													
													langData+='<hr>';
													
													$("#languageScoreDiv").html(langData);
																										
													
												}//selectLanguageScore is not null
				
												$.ajax({
													
													url:"selectAbility"
													,data:{resumeSeq:resumeSeq}
													,type:"get"
													,success:function(abilityList){
														
														if (abilityList!=null) {
															
															var abData="";
															
															abData+='<h3>기술</h3>';
															
															$.each(abilityList,function(index, item){
																
																abData+='<table border="1"><tr>';
																abData+='<td>기술</td><td>'+item.abilityTitle+'</td>';
																abData+='</tr><tr>';
																abData+='<td>기술 정도</td><td>'+item.abilityStatus+'</td>';
																abData+='</tr><tr>';
																abData+='<td>기술 상세</td><td>'+item.abilityDetails+'</td>';
																abData+='</tr></table><br>';															
																
															});//selectAbility each
															
															abData+='<hr>';
															
															$("#abilityDiv").html(abData);															
											
														}//abilityList is not null
					
														$.ajax({
															
															url:"selectActivity"
															,data:{resumeSeq:resumeSeq}
															,type:"get"
															,success:function(activityList){
																
																if(activityList!=null){
																	
																	var acData="";
																	
																	acData+='<h3>대외활동</h3>';
																	
																	$.each(activityList,function(index,item){
																		
																		acData+='<table border="1"><tr>';
																		acData+='<td>대외활동</td><td>'+item.activityTitle+'</td>';
																		acData+='</tr><tr>';
																		acData+='<td>대외활동 기관</td><td>'+item.activityOrg+'</td>';
																		acData+='</tr><tr>';
																		acData+='<td>상세</td><td>'+item.activityDetails+'</td>';
																		acData+='</tr></table><br>';																
																		
																	});																	
																	
																	acData+='<hr>';
																	$("#activityDiv").html(acData);
																	
																}//activityList is not null
																															
															}//selectActivity success
																														
														});//selectActivity ajax
														
													}//selectAbility success
													
												});//selectAbility ajax												
												
											}//selectLanguageScore success										
											
										});//selectLanguageScore ajax
										
									}//selectCerti success
																						
								});//selectCerti ajax
								
							}//selectCareer success function
							
						});	//selectCareer ajax
						
					}//selectBasicInfo success		
					
				});	//selectBasicInfo ajax
				
			} else{
			
				var data="";
				data+='<h3>등록된 이력서가 없습니다.</h3>';
				data+='<form action="regResume" method="get">';
				data+='<input type="submit" value="이력서 등록하기">';
				data+='</form>';
				
				$("#resumeDiv").html(data);
				
			}// resumeSeq if else
			
		}//checkResume success		
		
	});// init ajax
	
}//function init

function button(){
		
	var btnData="";
	btnData+='<form action="updateResume" method="get">';
	btnData+='<input type="button" value="이력서 수정">';
	btnData+='</form>';
	
	$("#buttonDiv").html(btnData);
	
}

</script>

<body>

<div id="resumeDiv">

<div id="basicInfoDiv"></div>
<div id="careerDiv"></div>
<div id="certiDiv"></div>
<div id="languageScoreDiv"></div>
<div id="abilityDiv"></div>
<div id="activityDiv"></div>

</div>

<div id="buttonDiv"></div>

</body>
</html>