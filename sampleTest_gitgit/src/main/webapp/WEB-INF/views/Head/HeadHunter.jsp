<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, maximum-scale=1">
	
	<!-- 홈페이지명 -->
	<title>Have a Good day</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
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

var hhId ='${sessionScope.hhId}';

var listSeq="";
var personName="";
var personId="";

$(function(){

	$('#inputOffer').on('click', inputOffer);
	
	board();
	personList();
	offerList();
	selectContactedPerson();
	
	
	//시작부분에 넣어봄 20190412 2140 박희재
	$("#contact-btn").on("click",messageModal);
	$("#send-btn").on("click",sendMessage);
	$("#smodal-btn10").on("click",deletePersonList);
	
	$("#deleteOffer").on("click",deleteOption);
	$("#resumeCheck-btn").on("click",contactResume);
	$("#readResume-btn").on("click",favResume);
	
	$("#utd-mat-btn").on("click",updateMatching);
	
	
});//JQ frame

function updateMatching(){
	
	var personId=$(':radio[name="contactedPerson"]:checked').val();
	var status=$(':radio[name="matching"]:checked').val();
	
	alert(personId+" / "+status);
	
	$.ajax({
		
		url:"updateMatchingStatus"
		,data:{
			personId:personId
			,status:status
		}
		,type:"post"
		,success:function(result){
			
			if (result==1) {
				
				alert("상태 변경 완료");
				selectContactedPerson();
				
			} else {

				alert("상태 변경 실패");
				selectContactedPerson();
				
			}
			
			
		}// updateMatching success
				
	});//ajax updateMatching
		
}//function updateMatching

function favResume(){
	
	personId=$("input:checked")[0].getAttribute("aaa");
	
	$.ajax({
		
		url:"readResume"
		,data:{personId:personId}
		,type:"get"
		,success:function(resumeSeq){
			if(resumeSeq>0){
				
				$.ajax({
					
					url:"selectBasicInfo"
					,data:{resumeSeq:resumeSeq}
					,type:"get"
					,success:function(bi){
						  							
						var data="";
						
						data+='<h3 class="crres" style="margin-left:0.5%;">기본 정보</h3><br><br>';
						data+='<table border="0" class="table table-boarded"><tr>';
						data+='<td style="width:15%;margin-left:2%;">이름</td><td>'+bi.personName+'</td>';
						data+='</tr><tr>';
						data+='<td style="width:15%;margin-left:2%;">생년월일</td><td>'+bi.birthDate+'</td>';
						data+='</tr><tr>';
						data+='<td style="width:15%;margin-left:2%;">성별</td><td>'+bi.gender+'</td>';
						data+='</tr><tr>';
						data+='<td style="width:15%;margin-left:2%;">이메일</td><td>'+bi.personEmail+'</td>';
						data+='</tr><tr>';
						data+='<td style="width:15%;margin-left:2%;">주소</td><td>'+bi.personAddr+'</td>';
						data+='</tr>';
						data+='</table>';
						data+='<hr><br><br>';	
						
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
									
									cData+='<h3 class="crres" style="margin-left:0.5%;">경력사항</h3><br><br>';
									
									
									$.each(careerList,function(index,item){
										
										cData+='<table border="0" class="table table-boarded">';								
										cData+='<tr>';
										cData+='<td style="width:15%; margin-left:2%;">회사 이름</td><td>'+item.companyName+'</td>';
										cData+='</tr><tr>';
										cData+='<td style="width:15%; margin-left:2%;">분야</td><td>'+item.careerCategory+'</td>';
										cData+='</tr><tr>';
										cData+='<td style="width:15%; margin-left:2%;">시작일</td><td>'+item.careerStartDate+'</td>';
										cData+='</tr><tr>';
										cData+='<td style="width:15%; margin-left:2%;">종료일</td><td>'+item.careerEndDate+'</td>';
										cData+='</tr><tr>';
										cData+='<td style="width:15%; margin-left:2%;">부서</td><td>'+item.careerDepartment+'</td>';
										cData+='</tr><tr>';
										cData+='<td style="width:15%; margin-left:2%;">직책</td><td>'+item.careerPosition+'</td>';
										cData+='</tr><tr>';
										cData+='<td style="width:15%; margin-left:2%;">근무 지역</td><td>'+item.careerRegion+'</td>';
										cData+='</tr><tr>';
										cData+='<td style="width:15%; margin-left:2%;">연봉</td><td>'+item.careerSalary+'</td>';
										cData+='</tr><tr>';
										cData+='<td style="width:15%; margin-left:2%;">담당 업무</td><td>'+item.careerTask+'</td>';
										cData+='</tr><tr>';
										cData+='<td style="width:15%; margin-left:2%;">상세 설명</td><td>'+item.careerDetails+'</td>';
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
											
											cerData+='<h3 class="crres" style="margin-left:0.5%;">자격증</h3><br><br>';
											
											$.each(certiList,function(index,item){
												
												cerData+='<table border="0" class="table table-boarded">';
												cerData+='<tr>';
												cerData+='<td style="width:15%; margin-left:2%;">자격증</td><td>'+item.certiTitle+'</td>';
												cerData+='</tr><tr>';
												cerData+='<td style="width:15%; margin-left:2%;">발행 기관</td><td>'+item.certiOrg+'</td>';
												cerData+='</tr><tr>';
												cerData+='<td style="width:15%; margin-left:2%;">취득 날짜</td><td>'+item.certiDate+'</td>';
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
													
													langData+='<h3 class="crres" style="margin-left:0.5%;">언어 점수</h3><br><br>';
													
													$.each(languageScoreList, function(index,item){												
														
														langData+='<table border="0" class="table table-boarded"><tr>';
														langData+='<td style="width:15%; margin-left:2%;">언어</td><td>'+item.languageType+'</td>';
														langData+='</tr><tr>';
														langData+='<td style="width:15%; margin-left:2%;">시험</td><td>'+item.languageTitle+'</td>';
														langData+='</tr><tr>';
														langData+='<td style="width:15%; margin-left:2%;">점수</td><td>'+item.languageScore+'</td>';
														langData+='</tr><tr>';
														langData+='<td style="width:15%; margin-left:2%;">발행 기관</td><td>'+item.languageOrg+'</td>';
														langData+='</tr><tr>';
														langData+='<td style="width:15%; margin-left:2%;">발행 날짜</td><td>'+item.languageDate+'</td>';
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
															
															abData+='<h3 class="crres" style="margin-left:0.5%;">기술</h3><br><br>';
															
															$.each(abilityList,function(index, item){
																
																abData+='<table border="0" class="table table-boarded"><tr>';
																abData+='<td style="width:15%; margin-left:2%;">기술</td><td>'+item.abilityTitle+'</td>';
																abData+='</tr><tr>';
																abData+='<td style="width:15%; margin-left:2%;">기술 정도</td><td>'+item.abilityStatus+'</td>';
																abData+='</tr><tr>';
																abData+='<td style="width:15%; margin-left:2%;">기술 상세</td><td>'+item.abilityDetails+'</td>';
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
																	
																	acData+='<h3 class="crres" style="margin-left:0.5%;">대외활동</h3><br><br>';
																	
																	$.each(activityList,function(index,item){
																		
																		acData+='<table border="0" class="table table-boarded"><tr>';
																		acData+='<td style="width:15%; margin-left:2%;">대외활동</td><td>'+item.activityTitle+'</td>';
																		acData+='</tr><tr>';
																		acData+='<td style="width:15%; margin-left:2%;">대외활동 기관</td><td>'+item.activityOrg+'</td>';
																		acData+='</tr><tr>';
																		acData+='<td style="width:15%; margin-left:2%;">상세</td><td>'+item.activityDetails+'</td>';
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
				data+='<h3 class="crres" style="margin-left:0%;">등록된 이력서가 없습니다.</h3>';
				
				$("#resumeDiv").html(data);
				
			}// resumeSeq if else
				
		}//favResume success
				
	});//favResume ajax
	
}//favResume

function board(){
	
	$.ajax({
		
		url:"hhQList"
		,type:"get"
		,success:function(qList){
			
			output(qList);
			
		}//board success
		
	});	//board ajax
	
}//board

function output(resp){
	
	var qList=resp.qList;
	var pn=resp.pn;
	
	var data="";
		
		data+='<table class="table table-hover">';
		data+='<thead>';
		data+='<tr>';
		data+='<th style="width:5%; text-align: center;">번호</th>';				
		data+='<th style="width:55%; text-align: center;">제목</th>';				
		data+='<th style="width:15%; text-align: center;">게시자</th>';				
		data+='<th style="width:15%; text-align: center;">등록일자</th>';				
		data+='</tr>';
		data+='</thead>';
		data+='<tbody>';
	
		$.each(qList, function(index,item){
			
			data+='<tr>';
			data+='<th style="width:5%; text-align: center;">'+item.qBoardSeq+'</th>';		
			data+='<th style="width:55%; text-align: center;"><a data-toggle="modal" href="#myModal20" class="readBoard" show-val="'+item.qBoardSeq+'">'+item.title+'	['+item.commentNum+']'+'</a></th>';				
			data+='<th style="width:15%; text-align: center;">'+item.personId+'</th>';			
			data+='<th style="width:15%; text-align: center;">'+item.indate+'</th>';
			data+='</tr>';
	
		});	
			
		data+='</tbody>';
		data+='<tfoot>';
		data+='</tfoot>';
		data+='</table>';
	
		var pData="";
		
		if(pn.currentPage>1){
			
			pData+='<a href="#" onclick="pageInit('+(pn.currentPage-1)+')">pre</a>';
			
		}
		
		var pageNum=pn.startPageGroup;
		
		for(var i=pageNum; i<=pn.endPageGroup; i++){
						
			if(i==pn.currentPage){
				
				pData+='<b><a href="#" onclick="pageInit('+i+')">'+i+'</a></b>';
				
			}else {
				
				pData+='<a href="#" onclick="pageInit('+i+')">'+i+'</a>';
				
			}
			
			
		}
		
		console.log(pn.totalPage);
		
		if(pn.totalPage-pn.currentPage>0){
		
			pData+='<a href="#" onclick="pageInit('+(pn.currentPage+1)+')">next</a>';
			
		}
		
		$("#qnaDiv").html(data);
		$("#pagingDiv").html(pData);

		$(".readBoard").on("click",readBoard);

	
}//output

function pageInit(i){
	$.ajax({
			
			url:"hhQList"
			,data:{currentPage:i}
			,type:"get"
			,success:function(qMap){
				
				output(qMap);
				
			}//board success
			
		});	//board ajax
		
		
		
	}


//	var test;
function readBoard(){
//	test = arguments[0];
//	alert("정체를 밝혀라 : "+arguments[0]);
	var qBoardSeq;
	if(isNaN(Number(arguments[0]))) {
	//	alert("왔나?");
		qBoardSeq = $(this).attr("show-val");
	}
 	else {
 //		alert("왓다");
 		qBoardSeq = arguments[0];
 	}
	
//	alert("readBoard : "+qBoardSeq);

	
//	alert(qBoardSeq);
	
	$.ajax({
		
		url:"readBoard"
		,data:{qBoardSeq:qBoardSeq}
		,type:"get"
		,success:function(qna){
			
			var bData="";
			
			bData+='<table class="table table-boarded">';
			bData+='<tr><td style="padding-left:2%;">title</td><td>'+qna[0].TITLE+'</td></tr>';
			bData+='<tr><td style="padding-left:2%;">name</td><td>'+qna[0].PERSONID+'</td></tr>';
			bData+='<tr><td style="padding-left:2%;">date</td><td>'+qna[0].INDATE+'</td></tr>';
			bData+='<tr><td colspan="2" style="padding-left: 2%;">'+qna[0].CONTENTS+'</td></tr>';
			bData+='<input type="hidden" id="qBoardSeq" value="'+qna[0].QBOARDSEQ+'">';
			
			$("#boardDiv").html(bData);
			
			var btnData="";
			btnData+='<a href="#" data-dismiss="modal" class="btn" style="margin-top: -1%;">Close</a>';
			
			$("#fotter10").html(btnData);		
			
			var ciData="";
			
			ciData+='<input type="text" id="insertedComments" class="form-control" style="width:625px; margin-left:2%;">';
			ciData+='<input type="button" id="ci-btn" value="댓글 등록" class="btn btn-primary" style="margin:-7.5% 0% 0% 85%;">';//0421 class 추가
			
			$("#commentInsertDiv").html(ciData);
			$("#ci-btn").on("click",insertComment);
			
			var comment="";
			
			if(qna[0].COMMENTSEQ!=null){
								
				comment+='<table>';
				
				$.each(qna, function(index, item){
					
					comment+='<tr>';			
					comment+='<td style="padding-left:10%;">'+item.HHNAME+'</td>'; //0421 style 추가
					comment+='<td class="commentTd" style="padding-left: 25%; max-width:50%!important; width: 50%;">'+item.COMMENTS+'</td>'; //0421 style 추가
					comment+='<td style="padding-left:30px;">'+item.COMDATE+'</td>'; //0421 style 추가
					comment+='<td class="updateBtn"><input type="button" com-udt-seq="'+item.QBOARDSEQ+'" com-udt-ctt="'+item.COMMENTS+'" com-udt-val="'+item.COMMENTSEQ+'" class="com-udt-btn" id="upupbtn" value="수정" style="margin-left:230%;"></td>'; //0421 style 추가
					comment+='<td><input type="button" com-del-seq="'+item.QBOARDSEQ+'" com-del-val="'+item.COMMENTSEQ+'" class="com-del-btn"  value="삭제" style="margin-left:0%;"></td>';
					comment+='</tr>';
					
				});//each
				
				comment+='</table>';
				
				$("#commentDiv").html(comment);
				$(".com-udt-btn").on("click",updateComment);
				$(".com-del-btn").on("click",deleteComment);
				
					
			}//댓글 유무 if
			
			else{
								
				$("#commentDiv").html(comment);
				
			}
			
		}//readBoard success		
		
	});//ajax readBoard
	
}//readBoard

function deleteComment(){
	
	var qBoardSeq = $(this).attr("com-del-seq");
	var commentSeq = $(this).attr("com-del-val");
	
	$.ajax({

		url:"deleteComment"
		,data:{
			commentSeq:commentSeq
			,qBoardSeq:qBoardSeq
			}
		,type:"post"
		,success:function(result){
			
			if (result==1) {
				
				alert("삭제 성공");
				readBoard(qBoardSeq);

				
			} else {
				alert("삭제 실패");
				readBoard(qBoardSeq);
				
			}
			
		}
			
	});//deleteComment ajax
	
}//deleteComment

function updateComment(){
	
	var commentSeq = $(this).attr("com-udt-val");
	var comments = $(this).attr("com-udt-ctt");
	var qBoardSeq = $(this).attr("com-udt-seq");
	
//	alert("코코마데");
	
	var data='<input type="text" id="changedComments" value="'+comments+'">';
	
	var btnData='<input type="button" class="new-udt-btn" value="등록" id="rerererere">';
	
// 	$("#commentTd").html(data);
	$(this).parent().siblings(".commentTd").html(data);
	$(this).parent().html(btnData);
	
//	$(".updateBtn").html(btnData);
	
	$(".new-udt-btn").on("click",realUpdate);
	
	function realUpdate(){

		var comments=$("#changedComments").val();
		
//		alert(commentSeq+" / "+comments);
		
		$.ajax({
			
			url:"updateComment"
			,data:{
				commentSeq:commentSeq
				,comments:comments
				}
			,type:"post"
			,success:function(result){
				
				if(result==1){
					alert("수정 성공");
					readBoard(qBoardSeq);

				}else{
					alert("수정 실패");
					readBoard(qBoardSeq);

				}
				
			}//success
				
		});//updateComment ajax
		
	}
	
}//updateComment

function insertComment(){
	
	var comments=$("#insertedComments").val();
	var qBoardSeq=$("#qBoardSeq").val();
	console.log("seq : "+ qBoardSeq);
//	alert(qBoardSeq);
	
	$.ajax({
		
		url:"insertComment"
		,data:{
			
			comments:comments
			,qBoardSeq:qBoardSeq
		}
		,type:"post"
		,success:function(result){
					
			if (result==1) {
			
				alert("댓글 등록 성공");
				$("#insertedComments").val("");
			//	$("#myModal20").modal("hide");
			//	board();
				
				alert("here here : "+qBoardSeq);
			
	//			console.log("here : " + qBoardSeq);
				readBoard(qBoardSeq);
		
			} else {
				alert("댓글 등록 실패");
			}
			
			
		}//insertComment success		
		
	});//insertComment ajax
	
}//insertComment


//컨택인재백

function selectContactedPerson(){
	
	$.ajax({
		
		url:"selectContactedPerson"
		,type:"get"
		,success:function(cpList){
			
			var data="";
			
//			data+='<h3 style="font-size: 24px; margin-left: 1%; margin-top:1%; margin-bottom:1%;">컨택 인재 list</h3>';
			data+='<table border="0" class="table table-boarded">';//0421 클래스 추가
			data+='<td style="padding-left:1%;">이름</td><td>회사 이름</td><td>직책</td><td>현재 상황</td><td style="width:3%;"></td>'; //0421 style padding 추가
			
			$.each(cpList,function(index, item){
				
				data+='<tr>';
				data+='<td style="padding-left:1%;">'+item.personName+'</td>';				
				data+='<td>'+item.comName+'</td>';
				data+='<td>'+item.jobTitle+'</td>';
				
				if (item.status==2) {
					data+='<td>매칭 진행중</td>';
					data+='<td><input type="radio" name="contactedPerson" value="'+item.personId+'"></td>';

				} else if(item.status==9) {
					data+='<td>매칭 실패</td>';
					data+='<td><input type="button" class="del-btn" cp-del-val="'+item.listSeq+'" value="삭제"></td>';

				} else if(item.status==5){
					data+='<td>매칭 성공</td>';
					data+='<td><input type="button" class="del-btn" cp-del-val="'+item.listSeq+'" value="삭제"></td>';
	
				}
			//	data+='<td><input type="radio" name="selectPersonRadio" class="select-btn" aaa="'+item.personId+'" value="'+item.listSeq+'"></td>';		

				data+='</tr>';
								
			});	//cpList each
			
			data+='</table>';
			
			$("#statusDiv").html(data);
			$(".del-btn").on("click",delCP);
						
		}//contactedPersonList success	
		 
	});//contactedPersonList ajax
	
}//contactedPersonList

function delCP(){
	
	var listSeq= $(this).attr("cp-del-val");

	$.ajax({
		
		url:"delCP"
		,data:{listSeq:listSeq}
		,type:"post"
		,success:function(result){
			
			if (result==1) {
				
				alert("삭제 성공");
				selectContactedPerson();
				
			} else {
				alert("삭제 실패");
				selectContactedPerson();
				
			}
			
		}//success
				
	});//delCP

}//delCP

//0416 이력서백
function contactResume(){
		
	var personId=$(':radio[name="contactedPerson"]:checked').val();
	
	$("#resumeCheckDiv").html(data);
	
	$.ajax({
		
		url:"readResume"
		,data:{
			personId:personId
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
						
						$("#basicInfoDiv1").html(data);		
							
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
									$("#careerDiv1").html(cData);
									
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
											$("#certiDiv1").html(cerData);
											
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
														
														langData+='<table border="1"><tr>';
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
													
													$("#languageScoreDiv1").html(langData);
																										
													
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
															
															$("#abilityDiv1").html(abData);															
											
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
																	$("#activityDiv1").html(acData);
																	
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
				
				$("#resumeCheckDiv").html(data);
				
			}// resumeSeq if else
			
		}//checkResume success		
		
	});// init ajax
	
	
	
}//readResume

function inputOffer(){
		
	var comName=$("#comName").val();
	var comAddr=$("#comAddr").val();
	var jobTitle=$("#jobTitle").val();
	var firstOption=$("#firstOption").val();
	var secondOption=$("#secondOption").val();
	var thirdOption=$("#thirdOption").val();
	var fourthOption=$("#fourthOption").val();
	var fifthOption=$("#fifthOption").val();
	var explanation=$("#explanation").val();
	
	if(comName.trim() == ""){
		alert('기업명을 입력하세요!');
		$('#comName').focus();
		return;
	}else if(comAddr.trim() == ""){
		alert('기업 주소를 입력하세요!');
		$('#comAddr').focus();
		return;
	}else if(jobTitle.trim() == ""){
		alert('직무를 입력하세요!');
		$('#jobTitle').focus();
		return;
	}

	$.ajax({
		url:"inputOffer"
		,data:{

			comName:comName
			,comAddr:comAddr
			,jobTitle:jobTitle
			,firstOption:firstOption
			,secondOption:secondOption
			,thirdOption:thirdOption			
			,fourthOption:fourthOption
			,fifthOption:fifthOption
			,explanation:explanation
			
		}
		,type:"post"
		,success:function(finalResult){
			
			if(finalResult==1){
				alert("등록 성공");	
				  $("#myModal8").modal("hide");
				  offerList();
				  
				  //0415 모달닫기
				  
				
			}else{
				alert("등록 실패");
			}
			
		}
		
	});
	
	
}//function inputOffer 0411 백엔드

//오퍼백

function offerList(){
	
//(필바꿈) 로그인 다 붙히고 세션값 넣기	
//(필바꿈) 부가 설명 삭제 or 이름을 누르면 모달창이 뜨게? 아냐 시간 없을 것 같아

	$.ajax({

		url:"oList"
		,data:{
			hhId:hhId		
		}
		,type:"get"
		,success:function(oList){
			
			var data="";
			
			data+='<table border="0" class="table table-boarded"><tr><td style="width:2%; "></td><td style="width:10%;">기업 이름</td><td>직업명</td><td>회사 주소</td><td style="width:10%;">option1</td><td style="width:10%;">option2</td><td style="width:10%;">option3</td><td style="width:10%;">option4</td><td style="width:10%;">option5</td></tr>';
			
			if(oList!=null){
				//dao단에서 null로 초기화 하기
				
				$.each(oList,function(index,item){
					
					if (index==0) { //1항은 비교 대상이 없으니 일단 찍어줌
						
						data+='<tr>';
						
			//			data+='<td><input type="radio" name="selectPersonRadio" class="select-btn" aaa="'+item.personId+'" value="'+item.listSeq+'"></td>';
	
						
						data+='<td><input type="radio" name="optionSelect" style="margin-left:50%;" class="option-btn" value="'+oList[index].REQUESTSEQ+'"></td>';//0421 style 추가
						data+='<td>'+oList[index].COMNAME+'</td>';
						data+='<td>'+oList[index].JOBTITLE+'</td>';
						data+='<td>'+oList[index].COMADDR+'</td>';	
				
						if(oList[index].COMOPTION!=null){						
							data+='<td>'+oList[index].COMOPTION+'</td>';
						}					
						
		//				data+='<td>'+oList[index].EXPLANATION+'</td>';

					} else { //2순위 이하의 옵션을 찍는 곳
						
						if(oList[index-1].COMNAME==oList[index].COMNAME) {
														
							data+='<td>'+oList[index].COMOPTION+'</td>';	
							
						} else { //회사 정보를 찍는 곳
							
							data+='</tr>';
							data+='<td><input type="radio" name="optionSelect" style="margin-left:50%;" class="option-btn" value="'+oList[index].REQUESTSEQ+'"></td>'; //0421 style 추가
							data+='<td>'+item.COMNAME+'</td>';
							data+='<td>'+item.JOBTITLE+'</td>';
							data+='<td>'+item.COMADDR+'</td>';	
						
							if (item.COMOPTION!=null) {
								data+='<td>'+item.COMOPTION+'</td>';
							}//옵션값이 있으면 찍어줌						
							
						}
						
					}//index==0 or not 	
														
				});//oList each			
				
				
			}//oList is not null
			else{
				
				alert("옵션값 없음");
								
			}//oList is null
			data+='</tr>';			
			data+='</table>';
			
			$("#offerDiv").html(data);	
			
			
		}//offerList success
	
	});//offerList ajax
	
}//offerList()

function deleteOption(){
	
	requestSeq=$(':radio[name="optionSelect"]:checked').val();

	$.ajax({
		
		url:"deleteOption"
		,data:{requestSeq:requestSeq}
		,type:"post"
		,success:function(result){
			
			if (result<6||result>0) {alert("삭제 성공");}
			else {alert("삭제 실패");}
			
			offerList();
			
		}//success
		
	});//ajax
	
}//deleteOption



//0412백

function personList(){
	
var hhId = '${sessionScope.hhId}';
	
	$.ajax({
		
		url:"pickList"
		,data:{
			hhId:hhId
		}
		,type:"get"
		,success:function(pickList){
			
			var data='';
			
			data+='<table border="0" class="table table-boarded">';
			data+='<tr><td style="padding-left:1%;">회사 이름</td><td>직업 이름</td><td>구직자 이름</td><td>메세지 상태</td><td>응답여부</td><td style="width:3%;>선택</td"></tr>'; //0421 style 추가 명칭추가
			
			$.each(pickList,function(index, item){
				
				data+='<tr>';
				data+='<td style="padding-left:1%;">'+item.comName+'</td>';
				data+='<td>'+item.jobTitle+'</td>';
				data+='<td>'+item.personName+'</td>';
				
				
				if(item.contactFlag==0){
					data+='<td>메세지 미전송</td>';
				}else if(item.contactFlag==1){
					data+='<td>메세지 전송 완료</td>';
				}else{
					data+='<td>오류 발생</td>';
				}
				
				
				if(item.contactFlag==1&&item.status==1){				
					data+='<td>미응답</td>';					
				} else if(item.status==0){					
					data+='<td>요청 거절</td>';				
				} else if(item.status==2){				
					data+='<td>요청 수락</td>';				
				} else{					
					data+='<td></dt>';				
				}

				data+='<td><input type="radio" name="selectPersonRadio" class="select-btn" aaa="'+item.personId+'" value="'+item.listSeq+'"></td>';
				
				data+='</tr>';
				
			});// each
				
			data+='</table>';	
						
			$("#listDiv").html(data);
			//$("#contact-btn").on("click",contactPerson);

		}//success
		
	});//personList ajax

}//function personList

function messageModal(){
	
	listSeq=$(':radio[name="selectPersonRadio"]:checked').val();
	var temp=$("input:checked").parents("tr").find("td");
	
	personName=temp[2].textContent;
	personId=$("input:checked")[0].getAttribute("aaa");
	
//	alert(personName+"/ "+personId);
		 
	$("#tempContactDiv").html('받는 사람 : ' + personName); //0421 '보내는사람' 추가
	
}


//0415 메세지백
function sendMessage(){
	
	var contactTitle=$("#contactTitle").val();
	var contactMessage=$("#contactMessage").val();
	
//	alert(personId);
	
	$.ajax({
		
		url:"sendMessage"
		,data:{
			
			contactTitle:contactTitle
			,contactMessage:contactMessage
			,personName:personName	
			,personId:personId
			
		}
		,type:"post"
		,success:function(finalResult){
			
			if (finalResult==1) {
				alert("메세지 전송 성공");
				
				  $("#myModal14").modal("hide");
				  personList();
				  
			} else {
				alert("메세지 전송 실패");
			}
			
		}//success

	});//sendMessage ajax
	
}//sendMessage

function deletePersonList(){

	listSeq=$(':radio[name="selectPersonRadio"]:checked').val();

	$.ajax({
		
		url:"deletePersonList"
		,data:{
			listSeq:listSeq
			, hhId:hhId
			}
		,type:"post"
		,success:function(result){
			
			if (result==1) {
				
				alert("삭제 완료");
				personList();
				
			} else {

				alert("삭제 실패");
				personList();
				
			}
			
		}//deletePersonList success
		
	});//deletePersonList ajax
	
}//deletePersonList

</script>

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
</script>

<!-- 채팅 로직 -->
	<script>
	$(document).ready(function(){
		var roomSeq; //기업고유방
		var chatSeq; // 채팅내역
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
			roomSeq = $(this).data("roomseq");
			$(".msg").html("");
			$(".msg").html("samsung채팅방"+"<br>");
		});
		
		$("#lg").on("click", function(){
			roomSeq = $(this).data("roomseq");
			$(".msg").html("");
			$(".msg").html("lg채팅방"+"<br>");
		});
	});
</script>

<!-- search 관련 로직 -->
<script>
$(document).ready(function(){
	var category;
	var education;
	var level;
	var sector;
	var language;
	var license;
	
	//직종설정 value값 가져오기
	$("#btn_btn_primaryid").on("click", function(){				
		category=$('input:radio[name="keicheche"]:checked').val();
		$("#first").html("#"+category);
		$("#myModal2").modal("hide");
	});
	
	//학력설정 value값 가져오기
	$("#btn_btn_success").on("click", function(){
		education = $('input:radio[name="gakurekiche"]:checked').val();
		var temp;
		if(education == "1"){
			temp = "고등학교";
		}else if(education == "2"){
			temp = "전문대학";
		}else if(education == "3"){
			temp = "대학교";
		}else if(education == "4"){
			temp = "대학원";
		}
		$("#second").html("#"+temp);
		$("#myModal3").modal("hide");
	});
	
	// 직급설정 value값 가져오기
	$("#btn_btn_infoid").on("click", function(){
		level = $('input:radio[name="syotsukuche"]:checked').val();			
		$("#third").html("#"+level);
		$("#myModal4").modal("hide");
	});
	
	// 업종설정 value 값 가져오기
	$("#btn_btn_warning").on("click", function(){
		 sector=$('input:radio[name="sabisugyouche"]:checked').val();
		 $("#fourth").html("#"+sector);
		 $("#myModal5").modal("hide");
		
	});
	
	// 어학설정 value 값 가져오기
	$("#btn_btn_dangerid").on("click", function(){
		language = $('input:radio[name="eigodesuche"]:checked').val();
		$("#fifth").html("#"+language);
		$("#myModal6").modal("hide");
	});
	
	//자격증 value 값 가져오기
	$("#btn_btn_primary").on("click", function(){
		license = $('input:radio[name="kenchikusikakuche"]:checked').val();
		$("#sixth").html("#"+license);
		$("#myModal12").modal("hide");
		
	});
	
	//search 인재검색
	$("#btn_btn_primary1").on("click", function(){
		
		$.ajax({
			url:"search",
			data:{"category":category, "education":education, "level":level, "sector":sector, "language":language, "license":license},
			type:"GET",
			success: function(list){
				var content = "";
				content += "<br>"
				for(var i in list){	
					content += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
					content += "<input type=radio name=searchList data-personname="+list[i].personName+ " value="+list[i].personId+">" + list[i].personName + "<br>"
				};
				content += "<br>"
				content += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				content += "<button type=button id=regist>regist</button><br>"
				$("#test").html(content);				
			}
		});
	});
	
	// search된 인재 등록
	$(document).on("click", "#regist", function(event){
		var selPersonId = $('input:radio[name="searchList"]:checked').val();
		var selPersonName = $('input:radio[name="searchList"]:checked').data('personname');
		
		var selCompanyName = $('#selectoper option:selected').html();
		var selRequestSeq = $('#selectoper option:selected').val();
		var selhhId = $('#selectoper option:selected').data('hhid');
		var selJobTitle = $("#selectoper option:selected").data('jobtitle');
		
		alert(selPersonId + "," + selPersonName + "," + selCompanyName + "," + selRequestSeq + "," + selhhId + "," + selJobTitle); 
		
		var personList = {
				hhId : selhhId,
				personId : selPersonId,
				personName : selPersonName,
				requestSeq : selRequestSeq,
				comName : selCompanyName,
				jobTitle : selJobTitle,						
		};
				
		$.ajax({
			url: "spRegist",
			data:personList,
			type:"get",
			success: function(message){
				alert(message);
			}
		});
		
		event.stopImmediatePropagation(); // stopImmediatePropagation()를 써주면 특이한 상황이 생겼을때 한 번의 클릭으로  event가 중복실행 되는 것을 막아줌
	});
	
	// radio 초기화
	$("#reset").on("click", function(){
		searchList(); // selectBox 기업리스트 가져오기 
		
		$('input[name="keicheche"]:checked').each(function(){
		     $(this).attr("checked",false);
		     $("#first").html("");
		     category=null;
		});
		
		$('input[name="gakurekiche"]:checked').each(function(){
		     $(this).attr("checked",false);
		     $("#second").html("");
		     education = null;		     
		});
		
		$('input[name="syotsukuche"]:checked').each(function(){
		     $(this).attr("checked",false);
		     $("#third").html("");
		     level = null;		     
		});
		
		$('input[name="sabisugyouche"]:checked').each(function(){
		     $(this).attr("checked",false);
		     $("#fourth").html("");
		     sector = null;
		     
		});
		
		$('input[name="eigodesuche"]:checked').each(function(){
		     $(this).attr("checked",false);
		     $("#fifth").html("");
		     language = null;
		     
		});
		
		$('input[name="kenchikusikakuche"]:checked').each(function(){
		     $(this).attr("checked",false);		     
		     $("#sixth").html("");
		     license = null;
		});
		
		$("#test").html("");
	});
	
	// 로그아웃 함수
	$("#logout-btn").on("click", function(){
		location.href="logout";
	});
	
	$(".SearchPerson").on("click", function(){
		searchList();
	});
	
	// search기업목록가져오기 함수
	function searchList(){		
		$.ajax({
			url:"selectRequest",					
			type:"GET",
			success: function(request){						
				for(var i in request){
					$("#selectoper").append("<option data-hhid="+request[i].hhId+" data-jobtitle="+request[i].jobTitle+" value="+request[i].requestSeq+">"+request[i].comName+"</option>")
				}						
			}
		});
	}
	
	// select옵션 모두삭제
  	$("#search_modal_close, #search_modal_x").on("click", function(){
  		$("#selectoper option").remove();
  	});
});
</script>
<body> 

	<!-- HeadHunter 페이지 이기 때문에 세션 id값은 언제나 hhId! 
<input type="hidden" id="hhId" value="${sessionScope.hhId}">
	-->
	<!-- 첫번째 모달 창 -->
	<!-- a태그에 걸때는 class 명을 걸고 링크에 띄우고자하는 모달창의 id값을 줬습니다. aria-hidden이 true일 경우에는 콘텐츠가 평소에 숨겨져 있습니다. -->
	<!-- 첫번쨰 모달창에는 검색한 인재가 표시되어야 합니다. ajax 써야할듯 합니다. -->
	<div class="modal" id="myModal1" aria-hidden="true" style="display: none; z-index: 1050;  overflow: auto;"  >
    	<div class="modal-dialog" style="max-width: 100%; width: 90%; display: table;">
          <div class="modal-content modalone">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="search_modal_x">×</button>
              <h4 class="modal-title">Search Person List</h4>
            </div><div class="container"></div>
            
            <div class="modal-body" style="margin-bottom: 0%; ">
            <span id="first" style="margin-left: 1%;"></span>&nbsp;&nbsp;&nbsp;
            <span id="second"></span>&nbsp;&nbsp;&nbsp;
            <span id="third"></span>&nbsp;&nbsp;&nbsp;
            <span id="fourth"></span>&nbsp;&nbsp;&nbsp;
            <span id="fifth"></span>&nbsp;&nbsp;&nbsp;
            <span id="sixth"></span>
            
           		 <div class="btns">
           		 	<select id="selectoper" style="height: 33px; line-height: 26px;  vertical-align:middle;">						  						  
							<!-- 헤드헌터가 등록한 기업오퍼를 보는 선택박스 -->
													  							           		 	
           		 	 </select>	
		              <a data-toggle="modal" href="#myModal2" class="btn btn-primary" id="smodal-btn1" style="">직종설정</a>
		              <a data-toggle="modal" href="#myModal3" class="btn btn-success" id="smodal-btn2" style="">학력설정</a>
		              <a data-toggle="modal" href="#myModal4" class="btn btn-info"    id="smodal-btn3" style="">직급설정</a>
		              <a data-toggle="modal" href="#myModal5" class="btn btn-warning" id="smodal-btn4" style="">업종설정</a>
		              <a data-toggle="modal" href="#myModal6" class="btn btn-danger"  id="smodal-btn5" style="">어학설정</a>
		              <a data-toggle="modal" href="#myModal12" class="btn btn-primary"  id="smodal-btn6" style="">자격증설정</a>
              	</div>
              	<br>
              <div id=test class="modal-body1" style="margin-top: 1.3%; margin-bottom: 20%; height:50%!important;">
              
              <hr class="linee1" style="width: 1740px; text-align: left; margin:0 0 0 0;">
				<!-- 인재 뜨는곳 -->

              </div>
            </div>
            <div class="modal-footer" id="footer2">
              <a href="#" class="btn btn-warning" id="reset">Reset</a>
              <a href="#" data-dismiss="modal" class="btn" id="search_modal_close">Close</a>              
              <a href="#" class="btn btn-primary" id="btn_btn_primary1">Search</a>                            
            </div>
          </div>
        </div>
    </div>
	<!-- 두번째 모달 -->
	  <div class="modal" id="myModal2" aria-hidden="true" style="overflow:auto">
    	<div class="modal-dialog" id="dialog2" style="max-width: 100%; width: 90%;">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">직종설정</h4>
            </div><div class="container"></div>
            <div class="modal-body">
            	<h3 class="keiei" style="font-size:20px; margin: 0 0 0 20px;">경영・사무</h3>
						<hr class="linee1" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="keiche1" value="기획.전략.경영" name="keicheche">
                        <label for="keiche1" style="padding-right: 10px;">기획.전략.경영</label>
                        <input type="radio" id="keiche2" value="총무.법무.사무" name="keicheche">
                        <label for="keiche2" style="padding-right: 10px;">총무.법무.사무</label>
                        <input type="radio" id="keiche3" value="경리.출납.결산" name="keicheche">
                        <label for="keiche3" style="padding-right: 10px;">경리.출납.결산</label>
                        <input type="radio" id="keiche4" value="홍보.PR.사보" name="keicheche">
                        <label for="keiche4" style="padding-right: 10px;">홍보.PR.사보</label>
                        <input type="radio" id="keiche5" value="비서.안내.수행원" name="keicheche">
                        <label for="keiche5" style="padding-right: 10px;">비서.안내.수행원</label>
                        <input type="radio" id="keiche6" value="사무보조.문서작성" name="keicheche">
                        <label for="keiche6" style="padding-right: 10px;">사무보조.문서작성</label>
                        <input type="radio" id="keiche7" value="회계.재무.세무.IR" name="keicheche">
                        <label for="keiche7" style="padding-right: 10px;">회계.재무.세무.IR</label>
                        <input type="radio" id="keiche8" value="마케팅.광고.분석" name="keicheche">
                        <label for="keiche8" style="padding-right: 10px;">마케팅.광고.분석</label>
                        <input type="radio" id="keiche9" value="전시.컨벤션.세미나" name="keicheche">
                        <label for="keiche9" style="padding-right: 10px;">전시.컨벤션.세미나</label>
				</div>
            </div>
            <br>
            <h3 class="eigyou" style="font-size:20px; margin: 0 0 0 20px;">영업・고객상담</h3>
						<hr class="linee2" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="eigyou1" value="일반영업" name="keicheche">
                        <label for="eigyou1" style="padding-right: 10px;">일반영업</label>
                        <input type="radio" id="eigyou2" value="판매.매장관리" name="keicheche">
                        <label for="eigyou2" style="padding-right: 10px;">판매.매장관리</label>
                        <input type="radio" id="eigyou3" value="IT.솔루션영업" name="keicheche">
                        <label for="eigyou3" style="padding-right: 10px;">IT.솔루션영업</label>
                        <input type="radio" id="eigyou4" value="금융.보험영업" name="keicheche">
                        <label for="eigyou4" style="padding-right: 10px;">금융.보험영업</label>
                        <input type="radio" id="eigyou5" value="광고영업" name="keicheche">
                        <label for="eigyou5" style="padding-right: 10px;">광고영업</label>
                        <input type="radio" id="eigyou6" value="기술영업" name="keicheche">
                        <label for="eigyou6" style="padding-right: 10px;">기술영업</label>
                        <input type="radio" id="eigyou7" value="영업기획.관리.지원" name="keicheche">
                        <label for="eigyou7" style="padding-right: 10px;">영업기획.관리.지원</label>
                        <input type="radio" id="eigyou8" value="TM.아웃바운드" name="keicheche">
                        <label for="eigyou8" style="padding-right: 10px;">TM.아웃바운드</label>
                        <input type="radio" id="eigyou9" value="TM.인바운드" name="keicheche">
                        <label for="eigyou9" style="padding-right: 10px;">TM.인바운드</label>
                        <input type="radio" id="eigyou10" value="고객센터.CS" name="keicheche">
                        <label for="eigyou10" style="padding-right: 10px;">고객센터.CS</label>
                        <input type="radio" id="eigyou11" value="QA.CS.강사.수퍼바이저" name="keicheche">
                        <label for="eigyou11" style="padding-right: 10px;">QA.CS.강사.수퍼바이저</label>
           		</div>
           	 </div>
         
           <h3 class="seisan" style="font-size:20px; margin: 0 0 0 20px;">생산・제조</h3>
						<hr class="linee3" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox3">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="seisan1" value="금속.금형" name="keicheche">
                        <label for="seisan1" style="padding-right: 10px;">금속.금형</label>
                        <input type="radio" id="seisan2" value="기계.기계설비" name="keicheche">
                        <label for="seisan2" style="padding-right: 10px;">기계.기계설비</label>
                        <input type="radio" id="seisan3" value="화학.에너지" name="keicheche">
                        <label for="seisan3" style="padding-right: 10px;">화학.에너지</label>
                        <input type="radio" id="seisan4" value="섬유.의류패션" name="keicheche">
                        <label for="seisan4" style="padding-right: 10px;">섬유.의류패션</label>
                        <input type="radio" id="seisan5" value="전기.전자제어" name="keicheche">
                        <label for="seisan5" style="padding-right: 10px;">전기.전자제어</label>
                        <input type="radio" id="seisan6" value="생산관리.품질관리" name="keicheche">
                        <label for="seisan6" style="padding-right: 10px;">생산관리.품질관리</label>
                        <input type="radio" id="seisan7" value="반도체.디스플래이.LCD" name="keicheche">
                        <label for="seisan7" style="padding-right: 10px;">반도체.디스플래이.LCD</label>
                        <input type="radio" id="seisan8" value="생산.제조.포장.조립" name="keicheche">
                        <label for="seisan8" style="padding-right: 10px;">생산.제조.포장.조립</label>
                        <input type="radio" id="seisan9" value="비금속.요업.신소재" name="keicheche">
                        <label for="seisan9" style="padding-right: 10px;">비금속.요업.신소재</label>
                        <input type="radio" id="seisan10" value="바이오.제약.식품" name="keicheche">
                        <label for="seisan11" style="padding-right: 10px;">바이오.제약.식품</label>
                        <input type="radio" id="seisan11" value="설계.CAD.CAM" name="keicheche">
                        <label for="seisan11" style="padding-right: 10px;">설계.CAD.CAM</label>
                        <input type="radio" id="seisan12" value="안경.렌즈.광학" name="keicheche">
                        <label for="seisan12" style="padding-right: 10px;">안경.렌즈.광학</label>
           		</div>
           	 </div>
           	    <h3 class="intaneto" style="font-size:20px; margin: 0 0 0 20px;">IT・인터넷</h3>
						<hr class="linee4" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox4">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="intanetoche1" value="웹마스터.OA테스터" name="keicheche">
                        <label for="intanetoche1" style="padding-right: 10px;">웹마스터.OA테스터</label>
                        <input type="radio" id="intanetoche2" value="서버.네트워크.보안" name="keicheche">
                        <label for="intanetoche2" style="padding-right: 10px;">서버.네트워크.보안</label>
                        <input type="radio" id="intanetoche3" value="웹기획.PM" name="keicheche">
                        <label for="intanetoche3" style="padding-right: 10px;">웹기획.PM</label>
                        <input type="radio" id="intanetoche4" value="웹개발" name="keicheche">
                        <label for="intanetoche4" style="padding-right: 10px;">웹개발</label>
                        <input type="radio" id="intanetoche5" value="게임.Game" name="keicheche">
                        <label for="intanetoche5" style="padding-right: 10px;">게임.Game</label>
                        <input type="radio" id="intanetoche6" value="컨텐츠.사이트운영" name="keicheche">
                        <label for="intanetoche6" style="padding-right: 10px;">컨텐츠.사이트운영</label>
                        <input type="radio" id="intanetoche7" value="응용프로그램개발" name="keicheche">
                        <label for="intanetoche7" style="padding-right: 10px;">응용프로그램개발</label>
                        <input type="radio" id="intanetoche8" value="시스템개발" name="keicheche">
                        <label for="intanetoche8" style="padding-right: 10px;">시스템개발</label>
                        <input type="radio" id="intanetoche9" value="ERP.시스템분석.설계" name="keicheche">
                        <label for="intanetoche9" style="padding-right: 10px;">ERP.시스템분석.설계</label>
                        <input type="radio" id="intanetoche10" value="통신.모바일" name="keicheche">
                        <label for="intanetoche10" style="padding-right: 10px;">통신.모바일</label>
           		</div>
           	 </div>
             <h3 class="senmon" style="font-size:20px; margin: 0 0 0 20px;">전문직</h3>
						<hr class="linee5" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox5">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="senmon1" value="경영분석.컨설턴트" name="keicheche">
                        <label for="senmon1" style="padding-right: 10px;">경영분석.컨설턴트</label>
                        <input type="radio" id="senmon2" value="증권.투자.펀드.외환" name="keicheche">
                        <label for="senmon2" style="padding-right: 10px;">증권.투자.펀드.외환</label>
                        <input type="radio" id="senmon3" value="헤드헌팅.노무.직업상담" name="keicheche">
                        <label for="senmon3" style="padding-right: 10px;">헤드헌팅.노무.직업상담</label>
                        <input type="radio" id="senmon4" value="외국어.번역.통역" name="keicheche">
                        <label for="senmon4" style="padding-right: 10px;">외국어.번역.통역</label>
                        <input type="radio" id="senmon5" value="법률.특허.상표" name="keicheche">
                        <label for="senmon5" style="padding-right: 10px;">법률.특허.상표</label>
                        <input type="radio" id="senmon6" value="채권.보험.보상.심사" name="keicheche">
                        <label for="senmon6" style="padding-right: 10px;">채권.보험.보상.심사</label>
                        <input type="radio" id="senmon7" value="연구소.R&D" name="keicheche">
                        <label for="senmon7" style="padding-right: 10px;">연구소.R&D</label>
                        <input type="radio" id="senmon8" value="특수직" name="keicheche">
                        <label for="senmon8" style="padding-right: 10px;">특수직</label>
                        <input type="radio" id="senmon9" value="세무회계.CPA" name="keicheche">
                        <label for="senmon9" style="padding-right: 10px;">세무회계.CPA</label>
                        <input type="radio" id="senmon10" value="임원.CEO" name="keicheche">
                        <label for="senmon10" style="padding-right: 10px;">임원.CEO</label>
           		</div>
           	 </div>
           	 
           	  <h3 class="kyouiku" style="font-size:20px; margin: 0 0 0 20px;">교육</h3>
						<hr class="linee6" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox6">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="kyouiku1" value="교육기획.교재" name="keicheche">
                        <label for="kyouiku1" style="padding-right: 10px;">교육기획.교재</label>
                        <input type="radio" id="kyouiku2" value="초중고.특수학교" name="keicheche">
                        <label for="kyouiku2" style="padding-right: 10px;">초중고.특수학교</label>
                        <input type="radio" id="kyouiku3" value="학습지.과외방문" name="keicheche">
                        <label for="kyouiku3" style="padding-right: 10px;">학습지.과외방문</label>
                        <input type="radio" id="kyouiku4" value="유치원.보육" name="keicheche">
                        <label for="kyouiku4" style="padding-right: 10px;">유치원.보육</label>
                        <input type="radio" id="kyouiku5" value="전문직업.IT강사" name="keicheche">
                        <label for="kyouiku5" style="padding-right: 10px;">전문직업.IT강사</label>
                        <input type="radio" id="kyouiku6" value="입시.보습.속셈학원" name="keicheche">
                        <label for="kyouiku6" style="padding-right: 10px;">입시.보습.속셈학원</label>
                        <input type="radio" id="kyouiku7" value="학원관리.운영.상담" name="keicheche">
                        <label for="kyouiku7" style="padding-right: 10px;">학원관리.운영.상담</label>
                        <input type="radio" id="kyouiku8" value="대학교수.행정직" name="keicheche">
                        <label for="kyouiku8" style="padding-right: 10px;">대학교수.행정직</label>
                        <input type="radio" id="kyouiku9" value="외국어.어학원" name="keicheche">
                        <label for="kyouiku9" style="padding-right: 10px;">외국어.어학원</label>
           		</div>
           	 </div>
           	 
           	 <h3 class="media" style="font-size:20px; margin: 0 0 0 20px;">미디어</h3>
						<hr class="linee7" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox7">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="media1" value="연예.엔터테이먼트" name="keicheche">
                        <label for="media1" style="padding-right: 10px;">연예.엔터테이먼트</label>
                        <input type="radio" id="media2" value="방송연출.PD감독" name="keicheche">
                        <label for="media2" style="padding-right: 10px;">방송연출.PD감독</label>
                        <input type="radio" id="media3" value="공연.무대.스텝" name="keicheche">
                        <label for="media3" style="padding-right: 10px;">공연.무대.스텝</label>
                        <input type="radio" id="media4" value="광고.카피.CF" name="keicheche">
                        <label for="media4" style="padding-right: 10px;">광고.카피.CF</label>
                        <input type="radio" id="media5" value="기자" name="keicheche">
                        <label for="media5" style="padding-right: 10px;">기자</label>
                        <input type="radio" id="media6" value="진행.아나운서" name="keicheche">
                        <label for="media6" style="padding-right: 10px;">진행.아나운서</label>
                        <input type="radio" id="media7" value="음악.음향.사운드" name="keicheche">
                        <label for="media7" style="padding-right: 10px;">음악.음향.사운드</label>
                        <input type="radio" id="media8" value="인쇄.출판.편집" name="keicheche">
                        <label for="media8" style="padding-right: 10px;">인쇄.출판.편집</label>
                        <input type="radio" id="media9" value="사진.포토그라퍼" name="keicheche">
                        <label for="media9" style="padding-right: 10px;">사진.포토그라퍼</label>
           		</div>
           	 </div>
           
           	 <h3 class="tokusyu" style="font-size:20px; margin: 0 0 0 20px;">특수계층.공공</h3>
						<hr class="linee8" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox8">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="tokusyu1" value="고령인.실버" name="keicheche">
                        <label for="tokusyu1" style="padding-right: 10px;">고령인.실버</label>
                        <input type="radio" id="tokusyu2" value="장애인.국가유공자" name="keicheche">
                        <label for="tokusyu2" style="padding-right: 10px;">장애인.국가유공자</label>
                        <input type="radio" id="tokusyu3" value="병역특례" name="keicheche">
                        <label for="tokusyu3" style="padding-right: 10px;">병역특례</label>
                        <input type="radio" id="tokusyu4" value="공무원" name="keicheche">
                        <label for="tokusyu4" style="padding-right: 10px;">공무원</label>
                        <input type="radio" id="tokusyu5" value="사회복지.요양.봉사" name="keicheche">
                        <label for="tokusyu5" style="padding-right: 10px;">사회복지.요양.봉사</label>
                        <input type="radio" id="tokusyu6" value="장교.군인.부사관" name="keicheche">
                        <label for="tokusyu6" style="padding-right: 10px;">장교.군인.부사관</label>
           		</div>
           	 </div>
           
            	 <h3 class="kensetsu" style="font-size:20px; margin: 0 0 0 20px;">건설</h3>
						<hr class="linee9" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox9">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="kensetsu1" value="토목.조경.도시.측량" name="keicheche">
                        <label for="kensetsu1" style="padding-right: 10px;">토목.조경.도시.측량</label>
                        <input type="radio" id="kensetsu2" value="건축.인테리어.설계" name="keicheche">
                        <label for="kensetsu2" style="padding-right: 10px;">건축.인테리어.설계</label>
                        <input type="radio" id="kensetsu3" value="전기.소방.통신.설비" name="keicheche">
                        <label for="kensetsu3" style="padding-right: 10px;">전기.소방.통신.설비</label>
                        <input type="radio" id="kensetsu4" value="환경.플랜트" name="keicheche">
                        <label for="kensetsu4" style="padding-right: 10px;">환경.플랜트</label>
                        <input type="radio" id="kensetsu5" value="현장.시공.감리.공무" name="keicheche">
                        <label for="kensetsu5" style="padding-right: 10px;">현장.시공.감리.공무</label>
                        <input type="radio" id="kensetsu6" value="안전.품질.검사.관리" name="keicheche">
                        <label for="kensetsu6" style="padding-right: 10px;">안전.품질.검사.관리</label>
                        <input type="radio" id="kensetsu7" value="부동산.개발.경매.분양" name="keicheche">
                        <label for="kensetsu7" style="padding-right: 10px;">부동산.개발.경매.분양</label>
                        <input type="radio" id="kensetsu8" value="본사.관리.전산" name="keicheche">
                        <label for="kensetsu8" style="padding-right: 10px;">본사.관리.전산</label>
           		</div>
           	 </div>
           	 
           	 <h3 class="boueki" style="font-size:20px; margin: 0 0 0 20px;">유통.무역</h3>
						<hr class="linee10" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox10">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="boueki1" value="물류.유통.운송" name="keicheche">
                        <label for="boueki1" style="padding-right: 10px;">물류.유통.운송</label>
                        <input type="radio" id="boueki2" value="해외영업.무역영업" name="keicheche">
                        <label for="boueki2" style="padding-right: 10px;">해외영업.무역영업</label>
                        <input type="radio" id="boueki3" value="구매.자재.재고" name="keicheche">
                        <label for="boueki3" style="padding-right: 10px;">구매.자재.재고</label>
                        <input type="radio" id="boueki4" value="납품.배송.택배" name="keicheche">
                        <label for="boueki4" style="padding-right: 10px;">납품.배송.택배</label>
                        <input type="radio" id="boueki5" value="상품기획.MD" name="keicheche">
                        <label for="boueki5" style="padding-right: 10px;">상품기획.MD</label>
                        <input type="radio" id="boueki6" value="무역사무.수출입" name="keicheche">
                        <label for="boueki6" style="padding-right: 10px;">무역사무.수출입</label>
                        <input type="radio" id="boueki7" value="운전.기사" name="keicheche">
                        <label for="boueki7" style="padding-right: 10px;">운전.기사</label>
                        <input type="radio" id="boueki8" value="중장비.화물" name="keicheche">
                        <label for="boueki8" style="padding-right: 10px;">중장비.화물</label>
           		</div>
           	 </div>
           	 
           	 	 <h3 class="sabisu" style="font-size:20px; margin: 0 0 0 20px;">서비스</h3>
						<hr class="linee11" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox11">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="sabisu1" value="웨딩.행사.이벤트" name="keicheche">
                        <label for="sabisu1" style="padding-right: 10px;">웨딩.행사.이벤트</label>
                        <input type="radio" id="sabisu2" value="안내.도우미.나레이터" name="keicheche">
                        <label for="sabisu2" style="padding-right: 10px;">안내.도우미.나레이터</label>
                        <input type="radio" id="sabisu3" value="보안.경호.안전" name="keicheche">
                        <label for="sabisu3" style="padding-right: 10px;">보안.경호.안전</label>
                        <input type="radio" id="sabisu4" value="여행.관광.항공" name="keicheche">
                        <label for="sabisu4" style="padding-right: 10px;">여행.관광.항공</label>
                        <input type="radio" id="sabisu5" value="AS.서비스.수리" name="keicheche">
                        <label for="sabisu5" style="padding-right: 10px;">AS.서비스.수리</label>
                        <input type="radio" id="sabisu6" value="호텔.카지노.콘도" name="keicheche">
                        <label for="sabisu6" style="padding-right: 10px;">호텔.카지노.콘도</label>
                        <input type="radio" id="sabisu7" value="미용.피부관리.애견" name="keicheche">
                        <label for="sabisu7" style="padding-right: 10px;">미용.피부관리.애견</label>
                        <input type="radio" id="sabisu8" value="요리.제빵사.영양사" name="keicheche">
                        <label for="sabisu8" style="padding-right: 10px;">요리.제빵사.영양사</label>
                        <input type="radio" id="sabisu9" value="가사.청소.육아" name="keicheche">
                        <label for="sabisu9" style="padding-right: 10px;">가사.청소.육아</label>
           		</div>
           	 </div>
           	 
           	 	 <h3 class="dezain" style="font-size:20px; margin: 0 0 0 20px;">디자인</h3>
						<hr class="linee12" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox12">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="dezain1" value="그레픽디자인.CG" name="keicheche">
                        <label for="dezain1" style="padding-right: 10px;">그레픽디자인.CG</label>
                        <input type="radio" id="dezain2" value="출판.편집디자인" name="keicheche">
                        <label for="dezain2" style="padding-right: 10px;">출판.편집디자인</label>
                        <input type="radio" id="dezain3" value="제품.산업디자인" name="keicheche">
                        <label for="dezain3" style="padding-right: 10px;">제품.산업디자인</label>
                        <input type="radio" id="dezain4" value="캐릭터.만화.애니" name="keicheche">
                        <label for="dezain4" style="padding-right: 10px;">캐릭터.만화.애니</label>
                        <input type="radio" id="dezain5" value="의류.패션.잡화디자인" name="keicheche">
                        <label for="dezain5" style="padding-right: 10px;">의류.패션.잡화디자인</label>
                        <input type="radio" id="dezain6" value="디자인기타" name="keicheche">
                        <label for="dezain6" style="padding-right: 10px;">디자인기타</label>
                        <input type="radio" id="dezain7" value="전시.공간디자인" name="keicheche">
                        <label for="dezain7" style="padding-right: 10px;">전시.공간디자인</label>
                        <input type="radio" id="dezain8" value="광고.시각디자인" name="keicheche">
                        <label for="dezain8" style="padding-right: 10px;">광고.시각디자인</label>
           		</div>
           	 </div>
           	 
           	 	 <h3 class="iryou" style="font-size:20px; margin: 0 0 0 20px;">의료</h3>
						<hr class="linee13" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox13">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="iryou1" value="의사.치과.한의사" name="keicheche">
                        <label for="iryou1" style="padding-right: 10px;">의사.치과.한의사</label>
                        <input type="radio" id="iryou2" value="수의사" name="keicheche">
                        <label for="iryou2" style="padding-right: 10px;">수의사</label>
                        <input type="radio" id="iryou3" value="약사" name="keicheche">
                        <label for="iryou3" style="padding-right: 10px;">약사</label>
                        <input type="radio" id="iryou4" value="간호사.간호조무사" name="keicheche">
                        <label for="iryou4" style="padding-right: 10px;">간호사.간호조무사</label>
                        <input type="radio" id="iryou5" value="의료기사" name="keicheche">
                        <label for="iryou5" style="padding-right: 10px;">의료기사</label>
                        <input type="radio" id="iryou6" value="사무.원무.코디" name="keicheche">
                        <label for="iryou6" style="padding-right: 10px;">사무.원무.코디</label>
                        <input type="radio" id="iryou7" value="보험심사과" name="keicheche">
                        <label for="iryou7" style="padding-right: 10px;">보험심사과</label>
                        <input type="radio" id="iryou8" value="의료기타직" name="keicheche">
                        <label for="iryou8" style="padding-right: 10px;">의료기타직</label>
           		</div>
           	 </div>
          <div class="modal-footer" id="fotter3">
            <a href="#" data-dismiss="modal" class="btn" id="category_modal_close">Close</a>
            <a href="#" class="btn btn-primary" id="btn_btn_primaryid">Complete</a>
          </div>
        </div>
      </div>
  </div>
  </div>
  
	<!-- 학력모달창 -->
	<div class="modal" id="myModal3" aria-hidden="true">
    	<div class="modal-dialog" id="dialog2" style="max-width: 100%; width: 60%;">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">학력설정</h4>
            </div><div class="container"></div>
            <div class="modal-body">
            	<h3 class="gakureki" style="font-size:20px; margin: 0 0 0 20px;">최종학력</h3>
						<hr class="linee14" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="gakureki1" value="4" name="gakurekiche">
                        <label for="gakureki1" style="padding-right: 10px;">대학원</label>
                        <input type="radio" id="gakureki2" value="3" name="gakurekiche">
                        <label for="gakureki2" style="padding-right: 10px;">대학교</label>
                        <input type="radio" id="gakureki3" value="2" name="gakurekiche">
                        <label for="gakureki3" style="padding-right: 10px;">전문대학</label>
                        <input type="radio" id="gakureki4" value="1" name="gakurekiche">
                        <label for="gakureki4" style="padding-right: 10px;">고등학교</label>
					</div>
	            </div>
	        <div class="modal-footer" id="fotter4">
            <a href="#" data-dismiss="modal" class="btn" id="education_modal_close">Close</a>
            <a href="#" class="btn btn-success" id="btn_btn_success">Complete</a>
          </div>
			</div>
		  </div>
		</div>
	  </div>
		
		<!-- 직급모달창 -->
	<div class="modal" id="myModal4" aria-hidden="true">
    	<div class="modal-dialog" id="dialog2" style="max-width: 100%; width: 60%;">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">직급설정</h4>
            </div><div class="container"></div>
            <div class="modal-body">
            	<h3 class="syotsuku" style="font-size:20px; margin: 0 0 0 20px;">직급</h3>
						<hr class="linee15" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="syotsuku1" value="사원" name="syotsukuche">
                        <label for="syotsuku1" style="padding-right: 10px;">사원</label>
                        <input type="radio" id="syotsuku2" value="주임" name="syotsukuche">
                        <label for="syotsuku2" style="padding-right: 10px;">주임</label>
                        <input type="radio" id="syotsuku3" value="계장" name="syotsukuche">
                        <label for="syotsuku3" style="padding-right: 10px;">계장</label>
                        <input type="radio" id="syotsuku4" value="대리" name="syotsukuche">
                        <label for="syotsuku4" style="padding-right: 10px;">대리</label>
                        <input type="radio" id="syotsuku5" value=과장 name="syotsukuche">
                        <label for="syotsuku5" style="padding-right: 10px;">과장</label>
                        <input type="radio" id="syotsuku6" value="부장" name="syotsukuche">
                        <label for="syotsuku6" style="padding-right: 10px;">부장</label>
                        <input type="radio" id="syotsuku7" value="차장" name="syotsukuche">
                        <label for="syotsuku7" style="padding-right: 10px;">차장</label>
                        <input type="radio" id="syotsuku8" value="감사" name="syotsukuche">
                        <label for="syotsuku8" style="padding-right: 10px;">감사</label>
					</div>
	            </div>
	           	 <h3 class="syokuseki" style="font-size:20px; margin: 0 0 0 20px;">직책</h3>
						<hr class="linee16" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="syokuseki1" value="팀원" name="syokusekiche">
                        <label for="syokuseki1" style="padding-right: 10px;">팀원</label>
                        <input type="radio" id="syokuseki2" value="팀장" name="syokusekiche">
                        <label for="syokuseki2" style="padding-right: 10px;">팀장</label>
                        <input type="radio" id="syokuseki3" value="실장" name="syokusekiche">
                        <label for="syokuseki3" style="padding-right: 10px;">실장</label>
                        <input type="radio" id="syokuseki4" value="총무" name="syokusekiche">
                        <label for="syokuseki4" style="padding-right: 10px;">총무</label>
                        <input type="radio" id="syokuseki5" value="지점장" name="syokusekiche">
                        <label for="syokuseki5" style="padding-right: 10px;">지점장</label>
                        <input type="radio" id="syokuseki6" value="지사장" name="syokusekiche">
                        <label for="syokuseki6" style="padding-right: 10px;">지사장</label>
                        <input type="radio" id="syokuseki7" value="파트장" name="syokusekiche">
                        <label for="syokuseki7" style="padding-right: 10px;">파트장</label>
                        <input type="radio" id="syokuseki8" value="그룹장" name="syokusekiche">
                        <label for="syokuseki8" style="padding-right: 10px;">그룹장</label>
					</div>
	            </div>
	        <div class="modal-footer" id="fotter5">
            <a href="#" data-dismiss="modal" class="btn" id="level_modal_close">Close</a>
            <a href="#" class="btn btn-info" id="btn_btn_infoid">Complete</a>
          </div>
			</div>
		  </div>
		</div>
	  </div>
		
	<!-- 업종모달창 -->
	<div class="modal" id="myModal5" aria-hidden="true" style="overflow:auto">
    	<div class="modal-dialog" id="dialog2" style="max-width: 100%; width: 90%;">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">업종설정</h4>
            </div><div class="container"></div>
            <div class="modal-body">
            	<h3 class="sabisugyou" style="font-size:20px; margin: 0 0 0 20px;">서비스업</h3>
						<hr class="linee17" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="sabisugyou1" value="호텔.여행.항공" name="sabisugyouche">
                        <label for="sabisugyou1" style="padding-right: 10px;">호텔.여행.항공</label>
                        <input type="radio" id="sabisugyou2" value="외식업.식음료" name="sabisugyouche">
                        <label for="sabisugyou2" style="padding-right: 10px;">외식업.식음료</label>
                        <input type="radio" id="sabisugyou3" value="시설관리.경비.용역" name="sabisugyouche">
                        <label for="sabisugyou3" style="padding-right: 10px;">시설관리.경비.용역</label>
                        <input type="radio" id="sabisugyou4" value="레저.스포츠.여가" name="sabisugyouche">
                        <label for="sabisugyou4" style="padding-right: 10px;">레저.스포츠.여가</label>
                        <input type="radio" id="sabisugyou5" value="AS.카센터.주유" name="sabisugyouche">
                        <label for="sabisugyou5" style="padding-right: 10px;">AS.카센터.주유</label>
                        <input type="radio" id="sabisugyou6" value="렌탈.임대" name="sabisugyouche">
                        <label for="sabisugyou6" style="padding-right: 10px;">렌탈.임대</label>
                        <input type="radio" id="sabisugyou7" value="웨딩.장례.이벤트" name="sabisugyouche">
                        <label for="sabisugyou7" style="padding-right: 10px;">웨딩.장례.이벤트</label>
                        <input type="radio" id="sabisugyou8" value="기타서비스업" name="sabisugyouche">
                        <label for="sabisugyou8" style="padding-right: 10px;">기타서비스업</label>
                        <input type="radio" id="sabisugyou9" value="뷰티.미용" name="sabisugyouche">
                        <label for="sabisugyou9" style="padding-right: 10px;">뷰티.미용</label>
					</div>
	            </div>
	            
	            <h3 class="kagakugyou" style="font-size:20px; margin: 0 0 0 20px;">제조.화학</h3>
						<hr class="linee18" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="kagakugyou1" value="전기.전자.기계.자동차" name="sabisugyouche">
                        <label for="kagakugyou1" style="padding-right: 10px;">전기.전자.기계.자동차</label>
                        <input type="radio" id="kagakugyou2" value="석유.화학.에너지" name="sabisugyouche">
                        <label for="kagakugyou2" style="padding-right: 10px;">석유.화학.에너지</label>
                        <input type="radio" id="kagakugyou3" value="섬유.패션.화장품.뷰티" name="sabisugyouche">
                        <label for="kagakugyou2" style="padding-right: 10px;">섬유.패션.화장품.뷰티</label>
                        <input type="radio" id="kagakugyou4" value="생활용품.소비재.사무" name="sabisugyouche">
                        <label for="kagakugyou4" style="padding-right: 10px;">생활용품.소비재.사무</label>
                        <input type="radio" id="kagakugyou5" value="가구.목재.제지" name="sabisugyouche">
                        <label for="kagakugyou5" style="padding-right: 10px;">가구.목재.제지</label>
                        <input type="radio" id="kagakugyou6" value="농업.어업.광업.임업" name="sabisugyouche">
                        <label for="kagakugyou6" style="padding-right: 10px;">농업.어업.광업.임업</label>
                        <input type="radio" id="kagakugyou7" value="금속.재료.철강.조선.항공" name="sabisugyouche">
                        <label for="kagakugyou7" style="padding-right: 10px;">금속.재료.철강.조선.항공</label>
                        <input type="radio" id="kagakugyou8" value="기타제조업" name="sabisugyouche">
                        <label for="kagakugyou8" style="padding-right: 10px;">기타제조업</label>
                        <input type="radio" id="kagakugyou9" value="식품가공.개발.환경" name="sabisugyouche">
                        <label for="kagakugyou9" style="padding-right: 10px;">식품가공.개발.환경</label>
                        <input type="radio" id="kagakugyou10" value="반도체.광학.LCD" name="sabisugyouche">
                        <label for="kagakugyou10" style="padding-right: 10px;">반도체.광학.LCD</label>
					</div>
	            </div>
						              
	            <h3 class="tsuusinngyou" style="font-size:20px; margin: 0 0 0 20px;">IT.웹.통신</h3>
						<hr class="linee19" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="tsuusinngyou1" value="솔루션.SHER.CRM" name="sabisugyouche">
                        <label for="tsuusinngyou1" style="padding-right: 10px;">솔루션.SHER.CRM</label>
                        <input type="radio" id="tsuusinngyou2" value="웹에이젼시" name="sabisugyouche">
                        <label for="tsuusinngyou2" style="padding-right: 10px;">웹에이젼시</label>
                        <input type="radio" id="tsuusinngyou3" value="쇼핑몰.오픈마켓" name="sabisugyouche">
                        <label for="tsuusinngyou3" style="padding-right: 10px;">쇼핑몰.오픈마켓</label>
                        <input type="radio" id="tsuusinngyou4" value="포털.인터넷.컨텐츠" name="sabisugyouche">
                        <label for="tsuusinngyou4" style="padding-right: 10px;">포털.인터넷.컨텐츠</label>
                        <input type="radio" id="tsuusinngyou5" value="네트워크.통신.모바일" name="sabisugyouche">
                        <label for="tsuusinngyou5" style="padding-right: 10px;">네트워크.통신.모바일</label>
                        <input type="radio" id="tsuusinngyou6" value="하드웨어.장비" name="sabisugyouche">
                        <label for="tsuusinngyou6" style="padding-right: 10px;">하드웨어.장비</label>
                        <input type="radio" id="tsuusinngyou7" value="정보보안.백신" name="sabisugyouche">
                        <label for="tsuusinngyou7" style="padding-right: 10px;">정보보안.백신</label>
                        <input type="radio" id="tsuusinngyou8" value="IT컨설팅" name="sabisugyouche">
                        <label for="tsuusinngyou8" style="padding-right: 10px;">IT컨설팅</label>
                        <input type="radio" id="tsuusinngyou9" value="게임" name="sabisugyouche">
                        <label for="tsuusinngyou9" style="padding-right: 10px;">게임</label>
					</div>
	            </div>

	            <h3 class="kinyueigyou" style="font-size:20px; margin: 0 0 0 20px;">은행.금융업</h3>
						<hr class="linee20" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="kinyueigyou1" value="은행.금융.저축" name="sabisugyouche">
                        <label for="tsuusinngyou1" style="padding-right: 10px;">은행.금융.저축</label>
                        <input type="radio" id="kinyueigyou2" value="대출.캐피탈.여신" name="sabisugyouche">
                        <label for="tsuusinngyou2" style="padding-right: 10px;">대출.캐피탈.여신</label>
                        <input type="radio" id="kinyueigyou3" value="기타금융" name="sabisugyouche">
                        <label for="tsuusinngyou3" style="padding-right: 10px;">기타금융</label>
                        <input type="radio" id="kinyueigyou4" value="증권.보험.카드" name="sabisugyouche">
                        <label for="tsuusinngyou4" style="padding-right: 10px;">증권.보험.카드</label>
					</div>
	            </div>
	            
	            <h3 class="mediasangyou" style="font-size:20px; margin: 0 0 0 20px;">미디어.디자인</h3>
						<hr class="linee21" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="mediasangyou1" value="신문.잡지.언론사" name="sabisugyouche">
                        <label for="mediasangyou1" style="padding-right: 10px;">신문.잡지.언론사</label>
                        <input type="radio" id="mediasangyou2" value="방송사.케이블" name="sabisugyouche">
                        <label for="mediasangyou2" style="padding-right: 10px;">방송사.케이블</label>
                        <input type="radio" id="mediasangyou3" value="연예.엔터테이먼트" name="sabisugyouche">
                        <label for="mediasangyou3" style="padding-right: 10px;">연예.엔터테이먼트</label>
                        <input type="radio" id="mediasangyou4" value="광고.흥보.전시" name="sabisugyouche">
                        <label for="mediasangyou4" style="padding-right: 10px;">광고.흥보.전시</label>
                        <input type="radio" id="mediasangyou5" value="영화.배급.음악" name="sabisugyouche">
                        <label for="mediasangyou5" style="padding-right: 10px;">영화.배급.음악</label>
                        <input type="radio" id="mediasangyou6" value="공연.예술.문화" name="sabisugyouche">
                        <label for="mediasangyou6" style="padding-right: 10px;">공연.예술.문화</label>
                        <input type="radio" id="mediasangyou7" value="출판.인쇄.사진" name="sabisugyouche">
                        <label for="mediasangyou7" style="padding-right: 10px;">출판.인쇄.사진</label>
                        <input type="radio" id="mediasangyou8" value="캐릭터.애니메이션" name="sabisugyouche">
                        <label for="mediasangyou8" style="padding-right: 10px;">캐릭터.애니메이션</label>
                        <input type="radio" id="mediasangyou9" value="디자인.설계" name="sabisugyouche">
                        <label for="mediasangyou9" style="padding-right: 10px;">디자인.설계</label>
					</div>
	            </div>
	            
	             <h3 class="kyouikugyou" style="font-size:20px; margin: 0 0 0 20px;">교육업</h3>
						<hr class="linee22" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="kyouikugyou1" value="초중고.대학" name="sabisugyouche">
                        <label for="kyouikugyou1" style="padding-right: 10px;">초중고.대학</label>
                        <input type="radio" id="kyouikugyou2" value="학원,어학원" name="sabisugyouche">
                        <label for="kyouikugyou2" style="padding-right: 10px;">학원,어학원</label>
                        <input type="radio" id="kyouikugyou3" value="유아.유치원" name="sabisugyouche">
                        <label for="kyouikugyou3" style="padding-right: 10px;">유아.유치원</label>
                        <input type="radio" id="kyouikugyou4" value="교재.학습지" name="sabisugyouche">
                        <label for="kyouikugyou4" style="padding-right: 10px;">교재.학습지</label>
                        <input type="radio" id="kyouikugyou5" value="전문.기능학원" name="sabisugyouche">
                        <label for="kyouikugyou5" style="padding-right: 10px;">전문.기능학원</label>
					</div>
	            </div>
	            
	             <h3 class="seiyakugyou" style="font-size:20px; margin: 0 0 0 20px;">의료.제약.복지</h3>
						<hr class="linee23" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="seiyakugyou1" value="의료.보건" name="sabisugyouche">
                        <label for="seiyakugyou1" style="padding-right: 10px;">의료.보건</label>
                        <input type="radio" id="seiyakugyou2" value="제약.바이오" name="sabisugyouche">
                        <label for="seiyakugyou2" style="padding-right: 10px;">제약.바이오</label>
                        <input type="radio" id="seiyakugyou3" value="사회복지" name="sabisugyouche">
                        <label for="seiyakugyou3" style="padding-right: 10px;">사회복지</label>
					</div>
	            </div>
	            
	                  <h3 class="hanbaigyou" style="font-size:20px; margin: 0 0 0 20px;">판매.유통</h3>
						<hr class="linee24" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="hanbaigyou1" value="판매.유통" name="sabisugyouche">
                        <label for="hanbaigyou1" style="padding-right: 10px;">판매.유통</label>
                        <input type="radio" id="hanbaigyou2" value="무역,상사" name="sabisugyouche">
                        <label for="hanbaigyou2" style="padding-right: 10px;">무역,상사</label>
                        <input type="radio" id="hanbaigyou3" value="운송.운수.물류" name="sabisugyouche">
                        <label for="hanbaigyou3" style="padding-right: 10px;">운송.운수.물류</label>
					</div>
	            </div>
	            
	                <h3 class="kenchikugyou" style="font-size:20px; margin: 0 0 0 20px;">건설업</h3>
						<hr class="linee25" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="kenchikugyou1" value="건설.건축.토목.시공" name="sabisugyouche">
                        <label for="kenchikugyou1" style="padding-right: 10px;">건설.건축.토목.시공</label>
                        <input type="radio" id="kenchikugyou2" value="실내.인테리어.조경" name="sabisugyouche">
                        <label for="kenchikugyou2" style="padding-right: 10px;">실내.인테리어.조경</label>
                        <input type="radio" id="kenchikugyou3" value="환경.설비" name="sabisugyouche">
                        <label for="kenchikugyou3" style="padding-right: 10px;">환경.설비</label>
                        <input type="radio" id="kenchikugyou4" value="부동산.임대.중개" name="sabisugyouche">
                        <label for="kenchikugyou4" style="padding-right: 10px;">부동산.임대.중개</label>
					</div>
	            </div>
	            
	                  <h3 class="kikangyou" style="font-size:20px; margin: 0 0 0 20px;">기관.협회</h3>
						<hr class="linee26" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="kikangyou1" value="정부.공공기관.공기업" name="sabisugyouche">
                        <label for="kikangyou1" style="padding-right: 10px;">정부.공공기관.공기업</label>
                        <input type="radio" id="kikangyou2" value="협회.단체" name="sabisugyouche">
                        <label for="kikangyou2" style="padding-right: 10px;">협회.단체</label>
                        <input type="radio" id="kikangyou3" value="법률.법무.특허" name="sabisugyouche">
                        <label for="kikangyou3" style="padding-right: 10px;">법률.법무.특허</label>
                        <input type="radio" id="kikangyou4" value="세무.회계" name="sabisugyouche">
                        <label for="kikangyou4" style="padding-right: 10px;">세무.회계</label>
                        <input type="radio" id="kikangyou5" value="연구소.컨설팅.조사" name="sabisugyouche">
                        <label for="kikangyou5" style="padding-right: 10px;">연구소.컨설팅.조사</label>
					</div>
	            </div>
	        <div class="modal-footer" id="fotter6">
            <a href="#" data-dismiss="modal" class="btn" id="sector_modal_close">Close</a>
            <a href="#" class="btn btn-warning" id="btn_btn_warning">Complete</a>
          </div>
			</div>
		  </div>
		</div>
	  </div>
	
	<!-- 어학모달창 -->
	<div class="modal" id="myModal6" aria-hidden="true" style="overflow:auto">
    	<div class="modal-dialog" id="dialog2" style="max-width: 100%; width: 60%;">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">어학설정</h4>
            </div><div class="container"></div>
            <div class="modal-body">
            	<h3 class="eigodesu" style="font-size:20px; margin: 0 0 0 20px;">영어</h3>
						<hr class="linee27" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="eigodesu1" value="TOEIC" name="eigodesuche">
                        <label for="eigodesu1" style="padding-right: 10px;">TOEIC</label>
                        <input type="radio" id="eigodesu2" value="TOEFI" name="eigodesuche">
                        <label for="eigodesu2" style="padding-right: 10px;">TOEFI</label>
                        <input type="radio" id="eigodesu3" value="TEPS" name="eigodesuche">
                        <label for="eigodesu3" style="padding-right: 10px;">TEPS</label>
                        <input type="radio" id="eigodesu4" value="IELTS" name="eigodesuche">
                        <label for="eigodesu4" style="padding-right: 10px;">IELTS</label>
                        <input type="radio" id="eigodesu5" value="OPIC" name="eigodesuche">
                        <label for="eigodesu5" style="padding-right: 10px;">OPIC</label>
                        <input type="radio" id="eigodesu6" value="무역영어" name="eigodesuche">
                        <label for="eigodesu6" style="padding-right: 10px;">무역영어</label>
                        <input type="radio" id="eigodesu7" value="SPA" name="eigodesuche">
                        <label for="eigodesu7" style="padding-right: 10px;">SPA</label>
                        <input type="radio" id="eigodesu8" value="SAT" name="eigodesuche">
                        <label for="eigodesu8" style="padding-right: 10px;">SAT</label>
                        <input type="radio" id="eigodesu9" value="영어교원자격증" name="eigodesuche">
                        <label for="eigodesu9" style="padding-right: 10px;">영어교원자격증</label>
					</div>
	            </div>
	          
	           	 <h3 class="nihongodesu" style="font-size:20px; margin: 0 0 0 20px;">일본어</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="nihongodesu1" value="JLPT" name="eigodesuche">
                        <label for="nihongodesu1" style="padding-right: 10px;">JLPT</label>
                        <input type="radio" id="nihongodesu2" value="JPT" name="eigodesuche">
                        <label for="nihongodesu2" style="padding-right: 10px;">JPT</label>
                        <input type="radio" id="nihongodesu3" value="SJPT" name="eigodesuche">
                        <label for="nihongodesu3" style="padding-right: 10px;">SJPT</label>
                        <input type="radio" id="nihongodesu4" value="EJU" name="eigodesuche">
                        <label for="nihongodesu4" style="padding-right: 10px;">EJU</label>
                        <input type="radio" id="nihongodesu5" value="일본어교원자격증" name="eigodesuche">
                        <label for="nihongodesu5" style="padding-right: 10px;">일본어교원자격증</label>
					</div>
	            </div>
	            
	                	 <h3 class="cyuugokugodesu" style="font-size:20px; margin: 0 0 0 20px;">중국어</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="cyuugokugodesu1" value="HSK" name="eigodesuche">
                        <label for="cyuugokugodesu1" style="padding-right: 10px;">HSK</label>
                        <input type="radio" id="cyuugokugodesu2" value="TSC" name="eigodesuche">
                        <label for="cyuugokugodesu2" style="padding-right: 10px;">TSC</label>
                        <input type="radio" id="cyuugokugodesu3" value="HSK회화" name="eigodesuche">
                        <label for="cyuugokugodesu3" style="padding-right: 10px;">HSK회화</label>
                        <input type="radio" id="cyuugokugodesu4" value="OPIC" name="eigodesuche">
                        <label for="cyuugokugodesu4" style="padding-right: 10px;">OPIC</label>
                        <input type="radio" id="cyuugokugodesu5" value="YCT" name="eigodesuche">
                        <label for="cyuugokugodesu5" style="padding-right: 10px;">YCT</label>
                        <input type="radio" id="cyuugokugodesu6" value="TOCFL" name="eigodesuche">
                        <label for="cyuugokugodesu6" style="padding-right: 10px;">TOCFL</label>
                        <input type="radio" id="cyuugokugodesu7" value="중국어교원자격증" name="eigodesuche">
                        <label for="cyuugokugodesu7" style="padding-right: 10px;">중국어교원자격증</label>
					</div>
	            </div>
	            
	             <h3 class="doitsugodesu" style="font-size:20px; margin: 0 0 0 20px;">독일어</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="doitsugodesu1" value="ZD" name="eigodesuche">
                        <label for="doitsugodesu1" style="padding-right: 10px;">ZD</label>
                        <input type="radio" id="doitsugodesu2" value="DSH" name="eigodesuche">
                        <label for="doitsugodesu2" style="padding-right: 10px;">DSH</label>
                        <input type="radio" id="doitsugodesu3" value="TESTDAF" name="eigodesuche">
                        <label for="doitsugodesu3" style="padding-right: 10px;">TESTDAF</label>
                        <input type="radio" id="doitsugodesu4" value="FLEX독일어" name="eigodesuche">
                        <label for="doitsugodesu4" style="padding-right: 10px;">FLEX독일어</label>
                        <input type="radio" id="doitsugodesu5" value="SD2" name="eigodesuche">
                        <label for="doitsugodesu5" style="padding-right: 10px;">SD2</label>
					</div>
	            </div>
	            
	             <h3 class="huransugodesu" style="font-size:20px; margin: 0 0 0 20px;">불어</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="huransugodesu1" value="DELF A2" name="eigodesuche">
                        <label for="huransugodesu1" style="padding-right: 10px;">DELF A2</label>
                        <input type="radio" id="huransugodesu2" value="DELF B1" name="eigodesuche">
                        <label for="huransugodesu2" style="padding-right: 10px;">DELF B1</label>
                        <input type="radio" id="huransugodesu3" value="DELF B2" name="eigodesuche">
                        <label for="huransugodesu2" style="padding-right: 10px;">DELF B2</label>
                        <input type="radio" id="huransugodesu4" value="DELF" name="eigodesuche">
                        <label for="huransugodesu4" style="padding-right: 10px;">DELF</label>
                        <input type="radio" id="huransugodesu5" value="FELF A1" name="eigodesuche">
                        <label for="huransugodesu5" style="padding-right: 10px;">FELF A1</label>
					</div>
	            </div>
	            
	             <h3 class="supegodesu" style="font-size:20px; margin: 0 0 0 20px;">스페인어</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="supegodesu1" value="DELE" name="eigodesuche">
                        <label for="supegodesu1" style="padding-right: 10px;">DELE</label>
                        <input type="radio" id="supegodesu2" value="FLEX스페인어" name="eigodesuche">
                        <label for="supegodesu2" style="padding-right: 10px;">FLEX스페인어</label>
                        <input type="radio" id="supegodesu3" value="OPIC" name="eigodesuche">
                        <label for="supegodesu3" style="padding-right: 10px;">OPIC</label>
					</div>
	            </div>
	            
	             <h3 class="rojiagodesu" style="font-size:20px; margin: 0 0 0 20px;">러시아어</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="rojiagodesu1" value="토르플" name="eigodesuche">
                        <label for="rojiagodesu1" style="padding-right: 10px;">토르플</label>
                        <input type="radio" id="rojiagodesu2" value="FLEX러시아어" name="eigodesuche">
                        <label for="rojiagodesu2" style="padding-right: 10px;">FLEX러시아어</label>
                        <input type="radio" id="rojiagodesu3" value="OPIC" name="eigodesuche">
                        <label for="rojiagodesu3" style="padding-right: 10px;">OPIC</label>
                        <input type="radio" id="rojiagodesu4" value="SNULT 러시아어" name="eigodesuche">
                        <label for="rojiagodesu4" style="padding-right: 10px;">SNULT 러시아어</label>
					</div>
	            </div>
	            
	             <h3 class="iterigodesu" style="font-size:20px; margin: 0 0 0 20px;">이탈리아어</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="iterigodesu1" value="CILS" name="eigodesuche">
                        <label for="iterigodesu1" style="padding-right: 10px;">CILS</label>
                        <input type="radio" id="iterigodesu2" value="CEU" name="eigodesuche">
                        <label for="iterigodesu2" style="padding-right: 10px;">CEU</label>
					</div>
	            </div>
	            
	             <h3 class="kankokugodesu" style="font-size:20px; margin: 0 0 0 20px;">한국어</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="kankokugodesu1" value="TOPIK" name="eigodesuche">
                        <label for="kankokugodesu1" style="padding-right: 10px;">TOPIK</label>
                        <input type="radio" id="kankokugodesu2" value="KBS한국어능력시험" name="eigodesuche">
                        <label for="kankokugodesu2" style="padding-right: 10px;">KBS한국어능력시험</label>
                        <input type="radio" id="kankokugodesu3" value="국어능력인증시험" name="eigodesuche">
                        <label for="kankokugodesu3" style="padding-right: 10px;">국어능력인증시험</label>
                        <input type="radio" id="kankokugodesu4" value="한국어교원자격증" name="eigodesuche">
                        <label for="kankokugodesu4" style="padding-right: 10px;">한국어교원자격증</label>
					</div>
	            </div>
	            
	             <h3 class="igaigodesu" style="font-size:20px; margin: 0 0 0 20px;">기타</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="igaigodesu1" value="한자능력검정시험" name="eigodesuche">
                        <label for="igaigodesu1" style="padding-right: 10px;">한자능력검정시험</label>
                        <input type="radio" id="igaigodesu2" value="한자자격검정" name="eigodesuche">
                        <label for="igaigodesu2" style="padding-right: 10px;">한자자격검정</label>
                        <input type="radio" id="igaigodesu3" value="베트남어" name="eigodesuche">
                        <label for="igaigodesu3" style="padding-right: 10px;">베트남어</label>
                        <input type="radio" id="igaigodesu4" value="인도네시아어" name="eigodesuche">
                        <label for="igaigodesu4" style="padding-right: 10px;">인도네시아어</label>
					</div>
	            </div>
	        <div class="modal-footer" id="fotter7">
            <a href="#" data-dismiss="modal" class="btn" id="language_modal_close">Close</a>
            <a href="#" class="btn btn-danger" id="btn_btn_dangerid">Complete</a>
          </div>
			</div>
		  </div>
		</div>
	  </div>
	  
	  <!-- 자격증모달창 -->
	<div class="modal" id="myModal12" aria-hidden="true" style="overflow:auto">
    	<div class="modal-dialog" id="dialog2" style="max-width: 100%; width: 60%;">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">자격증설정</h4>
            </div><div class="container"></div>
            <div class="modal-body">
            	<h3 class="kenchikusikaku" style="font-size:20px; margin: 0 0 0 20px;">건설/건축/토목</h3>
						<hr class="linee29" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="kenchikusikaku1" value="건설기계기사" name="kenchikusikakuche">
                        <label for="kenchikusikaku1" style="padding-right: 10px;">건설기계기사</label>
                        <input type="radio" id="kenchikusikaku2" value="건설안전기사" name="kenchikusikakuche">
                        <label for="kenchikusikaku2" style="padding-right: 10px;">건설안전기사</label>
                        <input type="radio" id="kenchikusikaku3" value="토목기사" name="kenchikusikakuche">
                        <label for="kenchikusikaku3" style="padding-right: 10px;">토목기사</label>
                        <input type="radio" id="kenchikusikaku4" value="건축기사" name="kenchikusikakuche">
                        <label for="kenchikusikaku4" style="padding-right: 10px;">건축기사</label>
                        <input type="radio" id="kenchikusikaku5" value="실내건축기사" name="kenchikusikakuche">
                        <label for="kenchikusikaku5" style="padding-right: 10px;">실내건축기사</label>
                        <input type="radio" id="kenchikusikaku6" value="조경기사" name="kenchikusikakuche">
                        <label for="kenchikusikaku6" style="padding-right: 10px;">조경기사</label>
                        <input type="radio" id="kenchikusikaku7" value="지적기사" name="kenchikusikakuche">
                        <label for="kenchikusikaku7" style="padding-right: 10px;">지적기사</label>
                        <input type="radio" id="kenchikusikaku8" value="도시계획기사" name="kenchikusikakuche">
                        <label for="kenchikusikaku8" style="padding-right: 10px;">도시계획기사</label>
                        <input type="radio" id="kenchikusikaku9" value="측량기사" name="kenchikusikakuche">
                        <label for="kenchikusikaku9" style="padding-right: 10px;">측량기사</label><br>
                        <input type="radio" id="kenchikusikaku10" value="전산응용건축제도기능사" name="kenchikusikakuche">
                        <label for="kenchikusikaku10" style="padding-right: 10px;">전산응용건축제도기능사</label>
					</div>
	            </div>
	            
	            <h3 class="jyouhousikaku" style="font-size:20px; margin: 0 0 0 20px;">IT/WEB/정보</h3>
						<hr class="linee30" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="jyouhousikaku1" value="CCNA" name="kenchikusikakuche">
                        <label for="jyouhousikaku1" style="padding-right: 10px;">CCNA</label>
                        <input type="radio" id="jyouhousikaku2" value="CCNP/CCIE" name="kenchikusikakuche">
                        <label for="jyouhousikaku2" style="padding-right: 10px;">CCNP/CCIE</label>
                        <input type="radio" id="jyouhousikaku3" value="MCSE/LPIC" name="kenchikusikakuche">
                        <label for="jyouhousikaku3" style="padding-right: 10px;">MCSE/LPIC</label>
                        <input type="radio" id="jyouhousikaku4" value="PC정비사" name="kenchikusikakuche">
                        <label for="jyouhousikaku4" style="padding-right: 10px;">PC정비사</label>
                        <input type="radio" id="jyouhousikaku5" value="네트워크관리사" name="kenchikusikakuche">
                        <label for="jyouhousikaku5" style="padding-right: 10px;">네트워크관리사</label>
                        <input type="radio" id="jyouhousikaku6" value="사무자동화산업기사" name="kenchikusikakuche">
                        <label for="jyouhousikaku6" style="padding-right: 10px;">사무자동화산업기사</label>
                        <input type="radio" id="jyouhousikaku7" value="웹디자인기능사" name="kenchikusikakuche">
                        <label for="jyouhousikaku7" style="padding-right: 10px;">웹디자인기능사</label>
                        <input type="radio" id="jyouhousikaku8" value="정보기술자격(ITQ)" name="kenchikusikakuche">
                        <label for="jyouhousikaku8" style="padding-right: 10px;">정보기술자격(ITQ)</label>
                        <input type="radio" id="jyouhousikaku9" value="정보처리기사" name="kenchikusikakuche">
                        <label for="jyouhousikaku9" style="padding-right: 10px;">정보처리기사</label>
                        <input type="radio" id="jyouhousikaku10" value="컴퓨터그래픽스운용기능사" name="kenchikusikakuche">
                        <label for="jyouhousikaku10" style="padding-right: 10px;">컴퓨터그래픽스운용기능사</label>
					</div>
	            </div>
	            
	             <h3 class="kankyousikaku" style="font-size:20px; margin: 0 0 0 20px;">환경/안전/설비</h3>
						<hr class="linee31" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="kankyousikaku1" value="가스기능사" name="kenchikusikakuche">
                        <label for="kankyousikaku1" style="padding-right: 10px;">가스기능사</label>
                        <input type="radio" id="kankyousikaku2" value="공조냉동기계기능사" name="kenchikusikakuche">
                        <label for="kankyousikaku2" style="padding-right: 10px;">공조냉동기계기능사</label>
                        <input type="radio" id="kankyousikaku3" value="대기환경기사" name="kenchikusikakuche">
                        <label for="kankyousikaku3" style="padding-right: 10px;">대기환경기사</label>
                        <input type="radio" id="kankyousikaku4" value="산업안전기사" name="kenchikusikakuche">
                        <label for="kankyousikaku4" style="padding-right: 10px;">산업안전기사</label>
                        <input type="radio" id="kankyousikaku5" value="소방설비기사" name="kenchikusikakuche">
                        <label for="kankyousikaku5" style="padding-right: 10px;">소방설비기사</label>
                        <input type="radio" id="kankyousikaku6" value="수질환경기사" name="kenchikusikakuche">
                        <label for="kankyousikaku6" style="padding-right: 10px;">수질환경기사</label>
                        <input type="radio" id="kankyousikaku7" value="에너지관리기사" name="kenchikusikakuche">
                        <label for="kankyousikaku7" style="padding-right: 10px;">에너지관리기사</label>
                        <input type="radio" id="kankyousikaku8" value="위험물산업기사" name="kenchikusikakuche">
                        <label for="kankyousikaku8" style="padding-right: 10px;">위험물산업기사</label><br>
                        <input type="radio" id="kankyousikaku9" value="폐기물처리기사" name="kenchikusikakuche">
                        <label for="kankyousikaku9" style="padding-right: 10px;">폐기물처리기사</label>
                        <input type="radio" id="kankyousikaku10" value="화공기사" name="kenchikusikakuche">
                        <label for="kankyousikaku10" style="padding-right: 10px;">화공기사</label>
					</div>
	            </div>
	            
	              <h3 class="denkisikaku" style="font-size:20px; margin: 0 0 0 20px;">전기/전자/통신</h3>
						<hr class="linee32" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="denkisikaku1" value="CISA/CISSP" name="kenchikusikakuche">
                        <label for="denkisikaku1" style="padding-right: 10px;">CISA/CISSP</label>
                        <input type="radio" id="denkisikaku2" value="무선통신기사" name="kenchikusikakuche">
                        <label for="denkisikaku2" style="padding-right: 10px;">무선통신기사</label>
                        <input type="radio" id="denkisikaku3" value="전기공사기사" name="kenchikusikakuche">
                        <label for="denkisikaku3" style="padding-right: 10px;">전기공사기사</label>
                        <input type="radio" id="denkisikaku4" value="전기기기기사" name="kenchikusikakuche">
                        <label for="denkisikaku4" style="padding-right: 10px;">전기기기기사</label>
                        <input type="radio" id="denkisikaku5" value="전기기사" name="kenchikusikakuche">
                        <label for="denkisikaku5" style="padding-right: 10px;">전기기사</label>
                        <input type="radio" id="denkisikaku6" value="전자기기기능사" name="kenchikusikakuche">
                        <label for="denkisikaku6" style="padding-right: 10px;">전자기기기능사</label>
                        <input type="radio" id="denkisikaku7" value="전자기사" name="kenchikusikakuche">
                        <label for="denkisikaku7" style="padding-right: 10px;">전자기사</label>
                        <input type="radio" id="denkisikaku8" value="전자캐드기능사" name="kenchikusikakuche">
                        <label for="denkisikaku8" style="padding-right: 10px;">전자캐드기능사</label>
                        <input type="radio" id="denkisikaku9" value="정보통신기사" name="kenchikusikakuche">
                        <label for="denkisikaku9" style="padding-right: 10px;">정보통신기사</label>
					</div>
	            </div>
	            
	            <h3 class="seisansikaku" style="font-size:20px; margin: 0 0 0 20px;">생산/제조/기계</h3>
						<hr class="linee33" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="seisansikaku1" value="기계설계기사" name="kenchikusikakuche">
                        <label for="seisansikaku1" style="padding-right: 10px;">기계설계기사</label>
                        <input type="radio" id="seisansikaku2" value="기계조립/정비기능사" name="kenchikusikakuche">
                        <label for="seisansikaku2" style="padding-right: 10px;">기계조립/정비기능사</label>
                        <input type="radio" id="seisansikaku3" value="선반/밀링기능사" name="kenchikusikakuche">
                        <label for="seisansikaku3" style="padding-right: 10px;">선반/밀링기능사</label>
                        <input type="radio" id="seisansikaku4" value="일반기계기사" name="kenchikusikakuche">
                        <label for="seisansikaku4" style="padding-right: 10px;">일반기계기사</label>
                        <input type="radio" id="seisansikaku5" value="자동차정비기능사" name="kenchikusikakuche">
                        <label for="seisansikaku5" style="padding-right: 10px;">자동차정비기능사</label>
                        <input type="radio" id="seisansikaku6" value="전기/가스용접기사" name="kenchikusikakuche">
                        <label for="seisansikaku6" style="padding-right: 10px;">전기/가스용접기사</label>
                        <input type="radio" id="seisansikaku7" value="지게차운전기능사" name="kenchikusikakuche">
                        <label for="seisansikaku7" style="padding-right: 10px;">지게차운전기능사</label><br>
                        <input type="radio" id="seisansikaku8" value="품질관리기사" name="kenchikusikakuche">
                        <label for="seisansikaku8" style="padding-right: 10px;">품질관리기사</label>
                        <input type="radio" id="seisansikaku9" value="품질경영기사" name="kenchikusikakuche">
                        <label for="seisansikaku9" style="padding-right: 10px;">품질경영기사</label>
					</div>
	            </div>
	            
	              <h3 class="keieisikaku" style="font-size:20px; margin: 0 0 0 20px;">금융/경영/회계</h3>
						<hr class="linee34" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="keieisikaku1" value="CFP/AFPK" name="kenchikusikakuche">
                        <label for="keieisikaku1" style="padding-right: 10px;">CFP/AFPK</label>
                        <input type="radio" id="keieisikaku2" value="CPA/AICPA" name="kenchikusikakuche">
                        <label for="keieisikaku2" style="padding-right: 10px;">CPA/AICPA</label>
                        <input type="radio" id="keieisikaku3" value="금융자사관리사" name="kenchikusikakuche">
                        <label for="keieisikaku3" style="padding-right: 10px;">금융자사관리사</label>
                        <input type="radio" id="keieisikaku4" value="선물거래상담사" name="kenchikusikakuche">
                        <label for="keieisikaku4" style="padding-right: 10px;">선물거래상담사</label>
                        <input type="radio" id="keieisikaku5" value="손해사정인" name="kenchikusikakuche">
                        <label for="keieisikaku5" style="padding-right: 10px;">손해사정인</label>
                        <input type="radio" id="keieisikaku6" value="재무위험관리사" name="kenchikusikakuche">
                        <label for="keieisikaku6" style="padding-right: 10px;">재무위험관리사</label>
                        <input type="radio" id="keieisikaku7" value="전산세무회계" name="kenchikusikakuche">
                        <label for="keieisikaku7" style="padding-right: 10px;">전산세무회계</label>
                        <input type="radio" id="keieisikaku8" value="증권투자상담사" name="kenchikusikakuche">
                        <label for="keieisikaku8" style="padding-right: 10px;">증권투자상담사</label>
					</div>
	            </div>
	            
	              <h3 class="bouekisikaku" style="font-size:20px; margin: 0 0 0 20px;">유통/무역/요리</h3>
						<hr class="linee35" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="bouekisikaku1" value="국제무역사" name="kenchikusikakuche">
                        <label for="bouekisikaku1" style="padding-right: 10px;">국제무역사</label>
                        <input type="radio" id="bouekisikaku2" value="무역영어" name="kenchikusikakuche">
                        <label for="bouekisikaku2" style="padding-right: 10px;">무역영어</label>
                        <input type="radio" id="bouekisikaku3" value="물류관리사" name="kenchikusikakuche">
                        <label for="bouekisikaku3" style="padding-right: 10px;">물류관리사</label>
                        <input type="radio" id="bouekisikaku4" value="유통관리사" name="kenchikusikakuche">
                        <label for="bouekisikaku4" style="padding-right: 10px;">유통관리사</label>
                        <input type="radio" id="bouekisikaku5" value="일/중/양식조리기능사" name="kenchikusikakuche">
                        <label for="bouekisikaku5" style="padding-right: 10px;">일/중/양식조리기능사</label>
                        <input type="radio" id="bouekisikaku6" value="제과/제빵기능사" name="kenchikusikakuche">
                        <label for="bouekisikaku6" style="padding-right: 10px;">제과/제빵기능사</label>
                        <input type="radio" id="bouekisikaku7" value="한식조리기능사" name="kenchikusikakuche">
                        <label for="bouekisikaku7" style="padding-right: 10px;">한식조리기능사</label>
					</div>
	            </div>
	            
	              <h3 class="keibisikaku" style="font-size:20px; margin: 0 0 0 20px;">기타</h3>
						<hr class="linee36" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="radio" id="keibisikaku1" value="경비지도사" name="kenchikusikakuche">
                        <label for="keibisikaku1" style="padding-right: 10px;">경비지도사</label>
                        <input type="radio" id="keibisikaku2" value="공인중개사" name="kenchikusikakuche">
                        <label for="keibisikaku2" style="padding-right: 10px;">공인중개사</label>
                        <input type="radio" id="keibisikaku3" value="도서관/사서" name="kenchikusikakuche">
                        <label for="keibisikaku3" style="padding-right: 10px;">도서관/사서</label>
                        <input type="radio" id="keibisikaku4" value="직업상담사" name="kenchikusikakuche">
                        <label for="keibisikaku4" style="padding-right: 10px;">직업상담사</label>
                        <input type="radio" id="keibisikaku5" value="통/번역사" name="kenchikusikakuche">
                        <label for="keibisikaku5" style="padding-right: 10px;">통/번역사</label>
					</div>
	            </div>
	            
	        <div class="modal-footer" id="fotter4">
            <a href="#" data-dismiss="modal" class="btn" id="license_modal_close">Close</a>
            <a href="#" class="btn btn-primary" id="btn_btn_primary">Complete</a>
          </div>
			</div>
		  </div>
		</div>
	  </div>
	  
	<!-- 조건검색 끝 -->
	
	
	<!-- 오퍼프 -->
	<!-- 오퍼등록 모달창 스타트 -->
	<div class="modal" id="myModal7" aria-hidden="true" style="display: none; z-index: 1050;  overflow: auto;"  >
    	<div class="modal-dialog" style="max-width: 100%; width: 90%; display: table;">
          <div class="modal-content modalone">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

              <h4 class="modal-title">REQUEST</h4>
              
            </div><div class="container"></div>
            
            <div class="modal-body" style="margin-bottom: 0%;">
           		 <div class="btns">
		              <a data-toggle="modal" href="#myModal8" class="btn btn-primary" id="smodal-btn1" style="">기업오퍼등록</a>
              	      <input type="button" class="btn btn-danger"id="deleteOffer" value="오퍼 삭제"><!-- 0421 class 추가 -->
              	
              	</div>
              	<br>
              <div class="modal-body2" style="margin-top: 1.3%; margin-bottom: 10%;">
              <hr class="linee1" style="width: 1740px; text-align: left; margin:  0 0 0 0;">
				<!-- 기업오퍼 뜨는곳 -->
				<br>
				<!-- 
				<h3 class="ketka" style="font-size: 24px; margin-left: 1%;">등록결과</h3><br> -->
				<div id="offerDiv">
				</div>
              </div>
            </div>
            <div class="modal-footer" id="footer2">
              <a href="#" data-dismiss="modal" class="btn">Close</a>
            </div>
          </div>
        </div> <!-- modal-dialog -->
    </div> <!-- myModal7 -->
	<!-- 두번째 모달 -->
	<!-- 오퍼등록창에서 기업관련정보 입력하는 폼 시작 -->
	 <div class="modal" id="myModal8" aria-hidden="true">
    	<div class="modal-dialog" id="dialog2" style="max-width: 100%; width: 80%;">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">기업오퍼등록</h4>
            </div><div class="container"></div>
            <div class="modal-body">
            	
            	<!-- 0411 프론트 오퍼등록 폼 시작 -->
            	<form class="form-inline" role="form">
				  <div class="form-group">
				    <label class="sr-only" for="oper1"></label> <!-- 기업명 -->
				    <input type="text" class="form-control" name="comName" id="comName" placeholder="기업명을 입력하세요." style="margin-left:10%;">
				  </div>
				  <div class="form-group">
				    <label class="sr-only" for="oper2"></label> <!-- 직업이름 -->
				    <input type="text" class="form-control"name="jobTitle" id="jobTitle"  placeholder="직무를 입력하세요." style="margin-left:10%;">
				  </div>
				  <div class="form-group">
				    <label class="sr-only" for="oper3"></label> <!-- 기업 주소 -->
				    <input type="text" class="form-control" name="comAddr" id="comAddr" placeholder="기업주소를 입력하세요." style="margin-left:10%;">
				  </div>
				  <div class="form-group">
				    <label class="sr-only" for="oper4"></label> <!-- 옵션1 -->
				    <input type="text" class="form-control" name="firstOption" id="firstOption" placeholder="조건을 입력하세요." style="margin-left:10%;">
				  </div>
				  <div class="form-group">
				    <label class="sr-only" for="oper5"></label> <!-- 옵션2 -->
				    <input type="text" class="form-control" name="secondOption" id="secondOption" placeholder="조건을 입력하세요." style="margin-left:10%;">
				  </div>
				  <div class="form-group">
				    <label class="sr-only" for="oper6"></label> <!-- 옵션3 -->
				    <input type="text" class="form-control" name="thirdOption" id="thirdOption" placeholder="조건을 입력하세요." style="margin-left:10%;">
				  </div>
				  <div class="form-group">
				    <label class="sr-only" for="oper7"></label> <!-- 옵션4 -->
				    <input type="text" class="form-control" name="fourthOption" id="fourthOption" placeholder="조건을 입력하세요." style="margin-left:10%;">
				  </div>
				  <div class="form-group">
				    <label class="sr-only" for="oper8"></label> <!-- 옵션5 -->
				    <input type="text" class="form-control" name="fifthOption" id="fifthOption" placeholder="조건을 입력하세요." style="margin-left:10%;">
				  </div>
			  
		<!-- 오퍼등록창에서 기업관련정보 입력하는 폼 끝 --> 
				  </form>
            
	        <div class="modal-footer" id="fotter7">
            <a href="#" data-dismiss="modal" class="btn">Close</a>
            <input type="button" id="inputOffer" class="btn btn-primary" value="Register">
          </div>
			</div>
		  </div>
		</div>
	  </div><!-- myModal8 -->
	<!-- 오퍼등록 모달 끝 -->
	
	
	
	
	<!-- 진행상황 모달창 스타트 -->
	<div class="modal" id="myModal9" aria-hidden="true" style="display: none; z-index: 1050;  overflow: auto;"  >
    	<div class="modal-dialog" style="max-width: 100%; width: 90%; display: table;">
          <div class="modal-content modalone">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">PROGRESS</h4>
            </div>
            <div class="container"></div>
            
            <div class="modal-body" style="margin-bottom: 0%;">
           		 <div class="btns">
		               
		               <button type="button" class="btn btn-primary" id="utd-mat-btn" style="height: 36px;">매칭 상태 변경</button> 
		               <!-- 0416 서류확인 모달 띄우기 위해서 기존 라디오 버튼 제거하고 a태그로 대체 하였습니다. -->
					
					 <!-- 
		             <a data-toggle="modal" href="#myModal16" class="btn btn-warning" id="resumeCheck-btn" style="">서류확인</a>
		              -->
		              
		             <label class="btn btn-danger ">
					 	<input type="radio" name="matching" id="option30" value="9" autocomplete="off" > 매칭 실패
					</label>
					
					<label class="btn btn-info ">
						<input type="radio" name="matching" id="option30" value="5" autocomplete="off"> 매칭 성공
					</label>
					
			
              	</div>
              	<br>
              <div class="modal-body2" style="margin-top: 1.3%; margin-bottom: 20%;">
              <hr class="linee1" style="width: 1740px; text-align: left; margin:  0 0 0 0;">
				<!-- 인재 뜨는곳 -->
				<!-- 컨택인재프 -->	
					
					
					<div id="statusDiv">
					</div>
		
 
              </div>
            </div>
            <div class="modal-footer" id="footer2">
              <a href="#" data-dismiss="modal" class="btn">Close</a>
            </div>
          </div>
        </div>
    </div>
	
	<!-- 진행상황 모달 끝 -->
	
	
	<!-- 관심인재리스트 -->
	<div class="modal" id="myModal13" aria-hidden="true" style="display: none; z-index: 1050;  overflow: auto;"  >
    	<div class="modal-dialog" style="max-width: 100%; width: 90%; display: table;">
          <div class="modal-content modalone">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">Favorites</h4>
            </div><div class="container"></div>
            
            <div class="modal-body" style="margin-bottom: 0%; ">
           		 <div class="btns">
           		 <!-- 0416 모달띄우기 위해서 기존 버튼에서 a태그로 교체하였습니다. -->
		              <a data-toggle="modal" href="#myModal15" class="btn btn-primary" id="readResume-btn" style="">이력서보기</a>
		              <a data-toggle="modal" href="#myModal14" class="btn btn-success" id="contact-btn" style="">컨텍/메시지전송</a>
		              <!-- 
		              <a data-toggle="" href="" class="btn btn-info" id="smodal-btn9" style="">목록가기</a>
		               -->
		              <button type="button" class="btn btn-danger" id="smodal-btn10">목록삭제</button>
              	</div>
              	<br>
              <div class="modal-body1" style="margin-top: 1.3%; margin-bottom: 10%;">
              
              <hr class="linee1" style="width: 1740px; text-align: left; margin:0 0 0 0;">
				<!-- 인재 뜨는곳 -->
				<!-- 0412프 -->
				<!-- <h3 style="font-size: 24px; margin-left: 1%; margin-top:1%; margin-bottom:1%; ">관심인재List</h3> -->
				<div id="listDiv">
				
				</div>

              </div>
            </div>
            <div class="modal-footer" id="footer17">
              <a href="#" data-dismiss="modal" class="btn">Close</a>
            </div>
          </div>
        </div>
    </div>
    <!-- 관심인재리스트 첫번째 모달끝 -->
    
    	<!-- 0415 메세지 모달 프 -->
      <!-- 관심인재 메시지 보내기 시작 -->
	<div class="modal" id="myModal14" aria-hidden="true">
    	<div class="modal-dialog" id="dialog2" style="max-width: 25%; width: 25;">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">메세지전송창</h4>
            </div><div class="container"></div>
            <div class="modal-body">
            
				<div class="form-group" style="margin-bottom: 23%;">
				    <label class="sr-only" for="mg1"></label> <!-- 메시지제목 -->
				    <input type="text" class="form-control" id="contactTitle" name="contactTitle" placeholder="메시지제목을 입력하세요." style="margin-top:2%; margin-left:2%; max-width:100%; width:96%;">				 
					<br>
					<textarea name="contactMessage" id="contactMessage" class="form-control col-sm-5" rows="4" style="margin-left:2%; max-width:100%; width:96%;"></textarea>
				</div>  
				<!-- listSeq를 확인하기 위한 임시 div -->
				<!-- tempContact -->
				<div id="tempContactDiv" style="padding-left: 2%;">
				</div>
								
			 <div class="modal-footer" id="fotter3">
            <a href="#" data-dismiss="modal" class="btn">Close</a>
            <input type="button" id="send-btn" class="btn btn-success" value="Send전송">
           <!-- 
            <a href="#" class="btn btn-success">Send</a>
           -->
          </div>
        </div>
      </div>
  </div>
  </div>
  <!-- 관심인재 메시지 보내기 끝 -->

<!-- 0416 이력서보기 모달창 -->
	<div class="modal" id="myModal15" aria-hidden="true" style="display: none; z-index: 1050;  overflow: auto;"  >
    	<div class="modal-dialog" style="max-width: 100%; width: 90%; display: table;">
          <div class="modal-content modalone">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">이력서보기</h4>
            </div><div class="container"></div>
            <div class="modal-body" style="margin-bottom: 0%; ">
              	<br>
              <div class="modal-body1" style="margin-top: 1.3%; margin-bottom: 15%;">
              
              <hr class="linee1" style="width: 1740px; text-align: left; margin:0 0 0 0;">
				<!-- 이력서 뜨는곳 -->
				
				<div id="favResumeDiv">
				
				<div id="basicInfoDiv"></div>
				<div id="careerDiv"></div>
				<div id="certiDiv"></div>
				<div id="languageScoreDiv"></div>
				<div id="abilityDiv"></div>
				<div id="activityDiv"></div>
				
				</div>
				
								
                 </div>
            </div>
            <div class="modal-footer" id="footer2">
              <a href="#" data-dismiss="modal" class="btn btn-primary">Close</a>
            </div>
          </div>
        </div>
    </div>
	
	<!-- 모달15 끝 -->
	
<!-- 0416 서류보기 모달창 -->
	
	<div class="modal" id="myModal16" aria-hidden="true" style="display: none; z-index: 1050;  overflow: auto;"  >
    	<div class="modal-dialog" style="max-width: 100%; width: 90%; display: table;">
          <div class="modal-content modalone">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">서류확인</h4>
            </div><div class="container"></div>
            <div class="modal-body" style="margin-bottom: 0%; ">
              	<br>
              <div class="modal-body1" style="margin-top: 1.3%; margin-bottom: 38%;">
              
              <hr class="linee1" style="width: 1740px; text-align: left; margin:0 0 0 0;">
				<!-- 이력서 뜨는곳 -->
				
					<div id="resumeCheckDiv">
			
					<div id="basicInfoDiv1"></div>
					<div id="careerDiv1"></div>
					<div id="certiDiv1"></div>
					<div id="languageScoreDiv1"></div>
					<div id="abilityDiv1"></div>
					<div id="activityDiv1"></div>
					
					</div>

              </div>
            </div>
            <div class="modal-footer" id="footer2">
              <a href="#" data-dismiss="modal" class="btn btn-primary">Close</a>
            </div>
          </div>
        </div>
    </div>
	
	<header class="header2" id="header2">
		<!--header-start-->
		<div class="container">
		</div>
	</header>
    <nav class="main-nav-outer" id="test2">
		<div class="container">
			<ul class="head-nav">
				<li class="SearchPerson"><a data-toggle="modal" href="#myModal1">Search Person</a></li>
				<li><a data-toggle="modal" href="#myModal7">Request</a></li>
				<li><a data-toggle="modal" href="#myModal9">Progress</a></li>
				<li><a data-toggle="modal" href="#myModal13">Favorites</a></li>
				<li><a href="diaryPage">Calendar</a></li>
			</ul>
		<button type="button" class="btn4 btn-danger pull-right" id="logout-btn">Logout</button> 
			</div>
	</nav>
<div class="contanier">
	<div id="qnaDiv" class="boardPerson col-lg-8"><!-- 게시판div -->

	 </div>
	 
<!-- 0420 게시글보기 모달창 시작. -->
   <div class="modal" id="myModal20" aria-hidden="true" style="display: none; z-index: 1050;  overflow: auto; "  >
       <div class="modal-dialog" style="width: 40%; height: 40%; margin-left: 10%; margin-top: 14%;">
          <div class="modal-content modalone">
            <div class="modal-header" style="height: 40px;">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin: -6px 10px;">×</button>
              <h4 class="modal-title" style="margin: -6px!important;">BOARD</h4>
            </div><div class="container"></div>
            <div class="modal-body">
         
            <div class="form-group" style="margin-bottom: 10%;">
                 
                 <div id="boardDiv"></div>
                 
                 <hr>
                 
                 <div id="commentInsertDiv"></div>
                 
                 <hr>
                 
                 <div id="commentDiv"></div>
                 
               </div>  
               
               </div>
           <div class="modal-footer" id="fotter10" style="margin-top: 0%;">
         
          </div>
        </div>
      </div>
    </div>
   
      <!-- 0420 게시글보기 모달창 끝. -->
   <!-- 모달 띄우는 명령어(이건 상황에 맞게 변형하시면 될듯 합니다 ~ -->
   <a data-toggle="modal" id="readBoard" href="#myModal20"></a>
   
 
	 
	<!-- 0417 1:1채팅창 시작-->
	<div class="contanier">
	<div class="oneChatrom col-lg-4">
	<div class="chatfri"style="float:left; margin-top:0%; margin-left:22.5%;width:27%; height:348px; background-color: white; border: 1px solid!important; border-color:#B9E0F7!important; border-radius: 10px">
				<table>
					<thead>
					<tr>
						<th style="width:5%; text-align: center; padding-top: 4%;">구직자 목록</th>				
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
		<textarea class="chattextbox"rows="4" style="background-color:#CDCDCD;width:464px;margin-left: 22.5%; margin-top: 0.5%; border-radius: 10px; border-color:#B9E0F7!important; outline: none!important;" disabled></textarea>	
		<input type="button" class="btn btn-primary" id="" value="화상채팅" style="width:19%; height:40px; text-align: center; margin-left:22% ; margin-top: 0.2%;">
		<input type="button" class="btn btn-primary" id="" value="게시글가기" style="width:19%; height:40px; text-align: center; margin-left: ; margin-top: 0.2%;">
		<input type="button" class="btn btn-primary" id="chatStart" value="채팅하기" style="width:19%; height:40px; text-align: center; margin-left: ; margin-top: 0.2%;">
		<input type="button" class="btn btn-primary" id="" value="메시지전송" style="width:19%; height:40px; text-align: center; margin-left: ; margin-top: 0.2%;">		
	</div>
		
</div>
	
	<!-- 0417 1:1 채팅창 종료 -->

</div>
<!-- 0415 추가 css 끝 -->

<br><br>

	<div class="writeclass col-lg-8">
	<!-- 	<input type="button" id="writeBoadr" class="btn btn-primary" value="글쓰기" style="float: right; margin-top: -2%;"> -->
	</div>
	<br>
	<br>
<div id="pagingDiv" style=" position: absolute; margin-top: 355px; margin-left: 38%; font-size: 20px;">
	
<!--  	
<div class="container">
	
	
	<nav aria-label="Page navigation">
		<ul class="pagination" id="pagination"  style="text-align: center; margin-left: -6%; margin-top: -2%;">
			
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
	-->
	
</div>
	</body>

</html>

