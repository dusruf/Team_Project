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

//(필바꿈) 로그인 붙히고 세션값 불러오기 
//var hhId = '${sessionScope.loginId}';
var hhId="11";

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
	$("#resumeCheck-btn").on("click",readResume);
	
});//JQ frame

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
	
		$.each(resp, function(index,item){
			
			data+='<tr>';
			data+='<th style="width:5%; text-align: center;">'+item.qBoardSeq+'</th>';		
			data+='<th style="width:55%; text-align: center;">'+item.title+'</th>';				
			data+='<th style="width:15%; text-align: center;">'+item.personId+'</th>';			
			data+='<th style="width:15%; text-align: center;">'+item.indate+'</th>';
			data+='</tr>';
	
		});	
			
		data+='</tbody>';
		data+='<tfoot>';
		data+='</tfoot>';
		data+='</table>';
	
		
		$("#qnaDiv").html(data);
	
}//output


//컨택인재백

function selectContactedPerson(){
	
	$.ajax({
		
		url:"selectContactedPerson"
		,data:{hhId:hhId}
		,type:"get"
		,success:function(cpList){
			
			var data="";
			
			data+='<h3>컨택 인재 list</h3>';
			data+='<table border="1">';
			data+='<td>이름</td><td>회사 이름</td><td>직책</td><td></td><td></td>';
			
			$.each(cpList,function(index, item){
				
				data+='<tr>';
				data+='<td>'+item.personName+'</td>';				
				data+='<td>'+item.comName+'</td>';
				data+='<td>'+item.jobTitle+'</td>';
				data+='<td><input type="radio" name="contactedPerson" value="'+item.personId+'"></td>';
				
				if(item.status==9){
					
					data+='<td><input type="button" class="del-btn" value="삭제"></td>';
					
				}
				data+='</tr>';
								
			});	//cpList each
			
			data+='</table>';
			
			$("#statusDiv").html(data);
						
		}//contactedPersonList success	
		 
	});//contactedPersonList ajax
	
}//contactedPersonList


//0416 이력서백
function readResume(){
		
	var personId=$(':radio[name="contactedPerson"]:checked').val();
//	alert(personId);
	
	$.ajax({
		
		url:"readResume"
		,data:{personId:personId}
		,type:"get"
		,success:function(){
			
			
			
		}
		
	});
	
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
			
			data+='<table border="1"><tr><td></td><td>기업 이름</td><td>직업 이름</td><td>회사 주소</td><td>option1</td><td>option2</td><td>option3</td><td>option4</td><td>option5</td></tr>';
			
			if(oList!=null){
				//dao단에서 null로 초기화 하기
				
				$.each(oList,function(index,item){
					
					if (index==0) { //1항은 비교 대상이 없으니 일단 찍어줌
						
						data+='<tr>';
						
			//			data+='<td><input type="radio" name="selectPersonRadio" class="select-btn" aaa="'+item.personId+'" value="'+item.listSeq+'"></td>';
	
						
						data+='<td><input type="radio" name="optionSelect" class="option-btn" value="'+oList[index].REQUESTSEQ+'"></td>';
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
							data+='<td><input type="radio" name="optionSelect" class="option-btn" value="'+oList[index].REQUESTSEQ+'"></td>';
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
	
	//(필) 아직 로그인을 안 합쳐서 임시로 설정한 var hhId, 나중에 세션값에 넣기
	var hhId=11;
	
	$.ajax({
		
		url:"pickList"
		,data:{
			hhId:hhId
		}
		,type:"get"
		,success:function(pickList){
			
			var data='';
			
			data+='<table border="1">';
			data+='<tr><td>회사 이름</td><td>직업 이름</td><td>구직자 이름</td><td></td><td></td><td></td></tr>';
			
			$.each(pickList,function(index, item){
				
				data+='<tr>';
				data+='<td>'+item.comName+'</td>';
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
//	personId=temp[5].getaaa;
	personId=$("input:checked")[0].getAttribute("aaa");

		
	$("#tempContactDiv").html(personName);
	
}


//0415 메세지백
function sendMessage(){
	
	var contactTitle=$("#contactTitle").val();
	var contactMessage=$("#contactMessage").val();
		
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
				
			} else {

				alert("삭제 실패");
				
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
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">Search Person List</h4>
            </div><div class="container"></div>
            
            <div class="modal-body" style="margin-bottom: 0%; ">
           		 <div class="btns">
           		 	<select class="selectoper" style="height: 33px; line-height: 26px;  vertical-align:middle;">
						  <option>기업오퍼 들어가는곳</option>
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
              <div class="modal-body1" style="margin-top: 1.3%; margin-bottom: 38%;">
              
              <hr class="linee1" style="width: 1740px; text-align: left; margin:0 0 0 0;">
				<!-- 인재 뜨는곳 -->

              </div>
            </div>
            <div class="modal-footer" id="footer2">
              <a href="#" data-dismiss="modal" class="btn">Close</a>
              <a href="#" class="btn btn-primary">Search</a>
            </div>
          </div>
        </div>
    </div>
	<!-- 두번째 모달 -->
	 <div class="modal" id="myModal2" aria-hidden="true">
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
                        <input type="checkbox" id="keiche1" value="option3" name="keicheche">
                        <label for="keiche1" style="padding-right: 10px;">기획.전략.경영</label>
                        <input type="checkbox" id="keiche2" value="option3" name="keicheche">
                        <label for="keiche2" style="padding-right: 10px;">총무.법무.사무</label>
                        <input type="checkbox" id="keiche3" value="option3" name="keicheche">
                        <label for="keiche3" style="padding-right: 10px;">경리.출납.결산</label>
                        <input type="checkbox" id="keiche4" value="option3" name="keicheche">
                        <label for="keiche4" style="padding-right: 10px;">홍보.PR.사보</label>
                        <input type="checkbox" id="keiche5" value="option3" name="keicheche">
                        <label for="keiche5" style="padding-right: 10px;">비서.안내.수행원</label>
                        <input type="checkbox" id="keiche6" value="option3" name="keicheche">
                        <label for="keiche6" style="padding-right: 10px;">사무보조.문서작성</label>
                        <input type="checkbox" id="keiche7" value="option3" name="keicheche">
                        <label for="keiche7" style="padding-right: 10px;">회계.재무.세무.IR</label>
                        <input type="checkbox" id="keiche8" value="option3" name="keicheche">
                        <label for="keiche8" style="padding-right: 10px;">마케팅.광고.분석</label>
                        <input type="checkbox" id="keiche9" value="option3" name="keicheche">
                        <label for="keiche9" style="padding-right: 10px;">전시.컨벤션.세미나</label>
				</div>
            </div>
            <br>
            <h3 class="eigyou" style="font-size:20px; margin: 0 0 0 20px;">영업・고객상담</h3>
						<hr class="linee2" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="eigyou1" value="option4" name="eigyouche">
                        <label for="eigyou1" style="padding-right: 10px;">일반영업</label>
                        <input type="checkbox" id="eigyou2" value="option4" name="eigyouche">
                        <label for="eigyou2" style="padding-right: 10px;">판매.매장관리</label>
                        <input type="checkbox" id="eigyou3" value="option4" name="eigyouche">
                        <label for="eigyou3" style="padding-right: 10px;">IT.솔루션영업</label>
                        <input type="checkbox" id="eigyou4" value="option4" name="eigyouche">
                        <label for="eigyou4" style="padding-right: 10px;">금융.보험영업</label>
                        <input type="checkbox" id="eigyou5" value="option4" name="eigyouche">
                        <label for="eigyou5" style="padding-right: 10px;">광고영업</label>
                        <input type="checkbox" id="eigyou6" value="option4" name="eigyouche">
                        <label for="eigyou6" style="padding-right: 10px;">기술영업</label>
                        <input type="checkbox" id="eigyou7" value="option4" name="eigyouche">
                        <label for="eigyou7" style="padding-right: 10px;">영업기획.관리.지원</label>
                        <input type="checkbox" id="eigyou8" value="option4" name="eigyouche">
                        <label for="eigyou8" style="padding-right: 10px;">TM.아웃바운드</label>
                        <input type="checkbox" id="eigyou9" value="option4" name="eigyouche">
                        <label for="eigyou9" style="padding-right: 10px;">TM.인바운드</label>
                        <input type="checkbox" id="eigyou10" value="option4" name="eigyouche">
                        <label for="eigyou10" style="padding-right: 10px;">고객센터.CS</label>
                        <input type="checkbox" id="eigyou11" value="option4" name="eigyouche">
                        <label for="eigyou11" style="padding-right: 10px;">QA.CS.강사.수퍼바이저</label>
           		</div>
           	 </div>
         
           <h3 class="seisan" style="font-size:20px; margin: 0 0 0 20px;">생산・제조</h3>
						<hr class="linee3" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox3">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="seisan1" value="option5" name="seisanche">
                        <label for="seisan1" style="padding-right: 10px;">금속.금형</label>
                        <input type="checkbox" id="seisan2" value="option5" name="seisanche">
                        <label for="seisan2" style="padding-right: 10px;">기계.기계설비</label>
                        <input type="checkbox" id="seisan3" value="option5" name="seisanche">
                        <label for="seisan3" style="padding-right: 10px;">화학.에너지</label>
                        <input type="checkbox" id="seisan4" value="option5" name="seisanche">
                        <label for="seisan4" style="padding-right: 10px;">섬유.의류패션</label>
                        <input type="checkbox" id="seisan5" value="option5" name="seisanche">
                        <label for="seisan5" style="padding-right: 10px;">전기.전자제어</label>
                        <input type="checkbox" id="seisan6" value="option5" name="seisanche">
                        <label for="seisan6" style="padding-right: 10px;">생산관리.품질관리</label>
                        <input type="checkbox" id="seisan7" value="option5" name="seisanche">
                        <label for="seisan7" style="padding-right: 10px;">반도체.디스플래이.LCD</label>
                        <input type="checkbox" id="seisan8" value="option5" name="seisanche">
                        <label for="seisan8" style="padding-right: 10px;">생산.제조.포장.조립</label>
                        <input type="checkbox" id="seisan9" value="option5" name="seisanche">
                        <label for="seisan9" style="padding-right: 10px;">비금속.요업.신소재</label>
                        <input type="checkbox" id="seisan10" value="option5" name="seisanche">
                        <label for="seisan11" style="padding-right: 10px;">바이오.제약.식품</label>
                        <input type="checkbox" id="seisan11" value="option5" name="seisanche">
                        <label for="seisan11" style="padding-right: 10px;">설계.CAD.CAM</label>
                        <input type="checkbox" id="seisan12" value="option5" name="seisanche">
                        <label for="seisan12" style="padding-right: 10px;">안경.렌즈.광학</label>
           		</div>
           	 </div>
           	    <h3 class="intaneto" style="font-size:20px; margin: 0 0 0 20px;">IT・인터넷</h3>
						<hr class="linee4" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox4">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="intanetoche1" value="option6" name="intanetoche">
                        <label for="intanetoche1" style="padding-right: 10px;">웹마스터.OA테스터</label>
                        <input type="checkbox" id="intanetoche2" value="option6" name="intanetoche">
                        <label for="intanetoche2" style="padding-right: 10px;">서버.네트워크.보안</label>
                        <input type="checkbox" id="intanetoche3" value="option6" name="intanetoche">
                        <label for="intanetoche3" style="padding-right: 10px;">웹기획.PM</label>
                        <input type="checkbox" id="intanetoche4" value="option6" name="intanetoche">
                        <label for="intanetoche4" style="padding-right: 10px;">웹개발</label>
                        <input type="checkbox" id="intanetoche5" value="option6" name="intanetoche">
                        <label for="intanetoche5" style="padding-right: 10px;">게임.Game</label>
                        <input type="checkbox" id="intanetoche6" value="option6" name="intanetoche">
                        <label for="intanetoche6" style="padding-right: 10px;">컨텐츠.사이트운영</label>
                        <input type="checkbox" id="intanetoche7" value="option6" name="intanetoche">
                        <label for="intanetoche7" style="padding-right: 10px;">응용프로그램개발</label>
                        <input type="checkbox" id="intanetoche8" value="option6" name="intanetoche">
                        <label for="intanetoche8" style="padding-right: 10px;">시스템개발</label>
                        <input type="checkbox" id="intanetoche9" value="option6" name="intanetoche">
                        <label for="intanetoche9" style="padding-right: 10px;">ERP.시스템분석.설계</label>
                        <input type="checkbox" id="intanetoche10" value="option6" name="intanetoche">
                        <label for="intanetoche10" style="padding-right: 10px;">통신.모바일</label>
           		</div>
           	 </div>
             <h3 class="senmon" style="font-size:20px; margin: 0 0 0 20px;">전문직</h3>
						<hr class="linee5" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox5">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="senmon1" value="option7" name="senmonche">
                        <label for="senmon1" style="padding-right: 10px;">경영분석.컨설턴트</label>
                        <input type="checkbox" id="senmon2" value="option7" name="senmonche">
                        <label for="senmon2" style="padding-right: 10px;">증권.투자.펀드.외환</label>
                        <input type="checkbox" id="senmon3" value="option7" name="senmonche">
                        <label for="senmon3" style="padding-right: 10px;">헤드헌팅.노무.직업상담</label>
                        <input type="checkbox" id="senmon4" value="option7" name="senmonche">
                        <label for="senmon4" style="padding-right: 10px;">외국어.번역.통역</label>
                        <input type="checkbox" id="senmon5" value="option7" name="senmonche">
                        <label for="senmon5" style="padding-right: 10px;">법률.특허.상표</label>
                        <input type="checkbox" id="senmon6" value="option7" name="senmonche">
                        <label for="senmon6" style="padding-right: 10px;">채권.보험.보상.심사</label>
                        <input type="checkbox" id="senmon7" value="option7" name="senmonche">
                        <label for="senmon7" style="padding-right: 10px;">연구소.R&D</label>
                        <input type="checkbox" id="senmon8" value="option7" name="senmonche">
                        <label for="senmon8" style="padding-right: 10px;">특수직</label>
                        <input type="checkbox" id="senmon9" value="option7" name="senmonche">
                        <label for="senmon9" style="padding-right: 10px;">세무회계.CPA</label>
                        <input type="checkbox" id="senmon10" value="option7" name="senmonche">
                        <label for="senmon10" style="padding-right: 10px;">임원.CEO</label>
           		</div>
           	 </div>
           	 
           	  <h3 class="kyouiku" style="font-size:20px; margin: 0 0 0 20px;">교육</h3>
						<hr class="linee6" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox6">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="kyouiku1" value="option6" name="kyouikuche">
                        <label for="kyouiku1" style="padding-right: 10px;">교육기획.교재</label>
                        <input type="checkbox" id="kyouiku2" value="option6" name="kyouikuche">
                        <label for="kyouiku2" style="padding-right: 10px;">초중고.특수학교</label>
                        <input type="checkbox" id="kyouiku3" value="option6" name="kyouikuche">
                        <label for="kyouiku3" style="padding-right: 10px;">학습지.과외방문</label>
                        <input type="checkbox" id="kyouiku4" value="option6" name="kyouikuche">
                        <label for="kyouiku4" style="padding-right: 10px;">유치원.보육</label>
                        <input type="checkbox" id="kyouiku5" value="option6" name="kyouikuche">
                        <label for="kyouiku5" style="padding-right: 10px;">전문직업.IT강사</label>
                        <input type="checkbox" id="kyouiku6" value="option6" name="kyouikuche">
                        <label for="kyouiku6" style="padding-right: 10px;">입시.보습.속셈학원</label>
                        <input type="checkbox" id="kyouiku7" value="option6" name="kyouikuche">
                        <label for="kyouiku7" style="padding-right: 10px;">학원관리.운영.상담</label>
                        <input type="checkbox" id="kyouiku8" value="option6" name="kyouikuche">
                        <label for="kyouiku8" style="padding-right: 10px;">대학교수.행정직</label>
                        <input type="checkbox" id="kyouiku9" value="option6" name="kyouikuche">
                        <label for="kyouiku9" style="padding-right: 10px;">외국어.어학원</label>
           		</div>
           	 </div>
           	 
           	 <h3 class="media" style="font-size:20px; margin: 0 0 0 20px;">미디어</h3>
						<hr class="linee7" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox7">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="media1" value="option7" name="mediache">
                        <label for="media1" style="padding-right: 10px;">연예.엔터테이먼트</label>
                        <input type="checkbox" id="media2" value="option7" name="mediache">
                        <label for="media2" style="padding-right: 10px;">방송연출.PD감독</label>
                        <input type="checkbox" id="media3" value="option7" name="mediache">
                        <label for="media3" style="padding-right: 10px;">공연.무대.스텝</label>
                        <input type="checkbox" id="media4" value="option7" name="mediache">
                        <label for="media4" style="padding-right: 10px;">광고.카피.CF</label>
                        <input type="checkbox" id="media5" value="option7" name="mediache">
                        <label for="media5" style="padding-right: 10px;">기자</label>
                        <input type="checkbox" id="media6" value="option7" name="mediache">
                        <label for="media6" style="padding-right: 10px;">진행.아나운서</label>
                        <input type="checkbox" id="media7" value="option7" name="mediache">
                        <label for="media7" style="padding-right: 10px;">음악.음향.사운드</label>
                        <input type="checkbox" id="media8" value="option7" name="mediache">
                        <label for="media8" style="padding-right: 10px;">인쇄.출판.편집</label>
                        <input type="checkbox" id="media9" value="option7" name="mediache">
                        <label for="media9" style="padding-right: 10px;">사진.포토그라퍼</label>
           		</div>
           	 </div>
           
           	 <h3 class="tokusyu" style="font-size:20px; margin: 0 0 0 20px;">특수계층.공공</h3>
						<hr class="linee8" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox8">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="tokusyu1" value="option8" name="tokusyuche">
                        <label for="tokusyu1" style="padding-right: 10px;">고령인.실버</label>
                        <input type="checkbox" id="tokusyu2" value="option8" name="tokusyuche">
                        <label for="tokusyu2" style="padding-right: 10px;">장애인.국가유공자</label>
                        <input type="checkbox" id="tokusyu3" value="option8" name="tokusyuche">
                        <label for="tokusyu3" style="padding-right: 10px;">병역특례</label>
                        <input type="checkbox" id="tokusyu4" value="option8" name="tokusyuche">
                        <label for="tokusyu4" style="padding-right: 10px;">공무원</label>
                        <input type="checkbox" id="tokusyu5" value="option8" name="tokusyuche">
                        <label for="tokusyu5" style="padding-right: 10px;">사회복지.요양.봉사</label>
                        <input type="checkbox" id="tokusyu6" value="option8" name="tokusyuche">
                        <label for="tokusyu6" style="padding-right: 10px;">장교.군인.부사관</label>
                        <input type="checkbox" id="tokusyu7" value="option8" name="tokusyuche">
           		</div>
           	 </div>
           
            	 <h3 class="kensetsu" style="font-size:20px; margin: 0 0 0 20px;">건설</h3>
						<hr class="linee9" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox9">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="kensetsu1" value="option9" name="kensetsuche">
                        <label for="kensetsu1" style="padding-right: 10px;">토목.조경.도시.측량</label>
                        <input type="checkbox" id="kensetsu2" value="option9" name="kensetsuche">
                        <label for="kensetsu2" style="padding-right: 10px;">건축.인테리어.설계</label>
                        <input type="checkbox" id="kensetsu3" value="option9" name="kensetsuche">
                        <label for="kensetsu3" style="padding-right: 10px;">전기.소방.통신.설비</label>
                        <input type="checkbox" id="kensetsu4" value="option9" name="kensetsuche">
                        <label for="kensetsu4" style="padding-right: 10px;">환경.플랜트</label>
                        <input type="checkbox" id="kensetsu5" value="option9" name="kensetsuche">
                        <label for="kensetsu5" style="padding-right: 10px;">현장.시공.감리.공무</label>
                        <input type="checkbox" id="kensetsu6" value="option9" name="kensetsuche">
                        <label for="kensetsu6" style="padding-right: 10px;">안전.품질.검사.관리</label>
                        <input type="checkbox" id="kensetsu7" value="option9" name="kensetsuche">
                        <label for="kensetsu7" style="padding-right: 10px;">부동산.개발.경매.분양</label>
                        <input type="checkbox" id="kensetsu8" value="option9" name="kensetsuche">
                        <label for="kensetsu8" style="padding-right: 10px;">본사.관리.전산</label>
           		</div>
           	 </div>
           	 
           	 <h3 class="boueki" style="font-size:20px; margin: 0 0 0 20px;">유통.무역</h3>
						<hr class="linee10" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox10">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="boueki1" value="option10" name="bouekiche">
                        <label for="boueki1" style="padding-right: 10px;">물류.유통.운송</label>
                        <input type="checkbox" id="boueki2" value="option10" name="bouekiche">
                        <label for="boueki2" style="padding-right: 10px;">해외영업.무역영업</label>
                        <input type="checkbox" id="boueki3" value="option10" name="bouekiche">
                        <label for="boueki3" style="padding-right: 10px;">구매.자재.재고</label>
                        <input type="checkbox" id="boueki4" value="option10" name="bouekiche">
                        <label for="boueki4" style="padding-right: 10px;">납품.배송.택배</label>
                        <input type="checkbox" id="boueki5" value="option10" name="bouekiche">
                        <label for="boueki5" style="padding-right: 10px;">상품기획.MD</label>
                        <input type="checkbox" id="boueki6" value="option10" name="bouekiche">
                        <label for="boueki6" style="padding-right: 10px;">무역사무.수출입</label>
                        <input type="checkbox" id="boueki7" value="option10" name="bouekiche">
                        <label for="boueki7" style="padding-right: 10px;">운전.기사</label>
                        <input type="checkbox" id="boueki8" value="option10" name="bouekiche">
                        <label for="boueki8" style="padding-right: 10px;">중장비.화물</label>
           		</div>
           	 </div>
           	 
           	 	 <h3 class="sabisu" style="font-size:20px; margin: 0 0 0 20px;">서비스</h3>
						<hr class="linee11" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox11">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="sabisu1" value="option11" name="sabisuche">
                        <label for="sabisu1" style="padding-right: 10px;">웨딩.행사.이벤트</label>
                        <input type="checkbox" id="sabisu2" value="option11" name="sabisuche">
                        <label for="sabisu2" style="padding-right: 10px;">안내.도우미.나레이터</label>
                        <input type="checkbox" id="sabisu3" value="option11" name="sabisuche">
                        <label for="sabisu3" style="padding-right: 10px;">보안.경호.안전</label>
                        <input type="checkbox" id="sabisu4" value="option11" name="sabisuche">
                        <label for="sabisu4" style="padding-right: 10px;">여행.관광.항공</label>
                        <input type="checkbox" id="sabisu5" value="option11" name="sabisuche">
                        <label for="sabisu5" style="padding-right: 10px;">AS.서비스.수리</label>
                        <input type="checkbox" id="sabisu6" value="option11" name="sabisuche">
                        <label for="sabisu6" style="padding-right: 10px;">호텔.카지노.콘도</label>
                        <input type="checkbox" id="sabisu7" value="option11" name="sabisuche">
                        <label for="sabisu7" style="padding-right: 10px;">미용.피부관리.애견</label>
                        <input type="checkbox" id="sabisu8" value="option11" name="sabisuche">
                        <label for="sabisu8" style="padding-right: 10px;">요리.제빵사.영양사</label>
                        <input type="checkbox" id="sabisu9" value="option11" name="sabisuche">
                        <label for="sabisu9" style="padding-right: 10px;">가사.청소.육아</label>
           		</div>
           	 </div>
           	 
           	 	 <h3 class="dezain" style="font-size:20px; margin: 0 0 0 20px;">디자인</h3>
						<hr class="linee12" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox12">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="dezain1" value="option12" name="dezainche">
                        <label for="dezain1" style="padding-right: 10px;">그레픽디자인.CG</label>
                        <input type="checkbox" id="dezain2" value="option12" name="dezainche">
                        <label for="dezain2" style="padding-right: 10px;">출판.편집디자인</label>
                        <input type="checkbox" id="dezain3" value="option12" name="dezainche">
                        <label for="dezain3" style="padding-right: 10px;">제품.산업디자인</label>
                        <input type="checkbox" id="dezain4" value="option12" name="dezainche">
                        <label for="dezain4" style="padding-right: 10px;">캐릭터.만화.애니</label>
                        <input type="checkbox" id="dezain5" value="option12" name="dezainche">
                        <label for="dezain5" style="padding-right: 10px;">의류.패션.잡화디자인</label>
                        <input type="checkbox" id="dezain6" value="option12" name="dezainche">
                        <label for="dezain6" style="padding-right: 10px;">디자인기타</label>
                        <input type="checkbox" id="dezain7" value="option12" name="dezainche">
                        <label for="dezain7" style="padding-right: 10px;">전시.공간디자인</label>
                        <input type="checkbox" id="dezain8" value="option12" name="dezainche">
                        <label for="dezain8" style="padding-right: 10px;">광고.시각디자인</label>
           		</div>
           	 </div>
           	 
           	 	 <h3 class="iryou" style="font-size:20px; margin: 0 0 0 20px;">의료</h3>
						<hr class="linee13" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox13">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="iryou1" value="option13" name="iryouche">
                        <label for="iryou1" style="padding-right: 10px;">의사.치과.한의사</label>
                        <input type="checkbox" id="iryou2" value="option13" name="iryouche">
                        <label for="iryou2" style="padding-right: 10px;">수의사</label>
                        <input type="checkbox" id="iryou3" value="option13" name="iryouche">
                        <label for="iryou3" style="padding-right: 10px;">약사</label>
                        <input type="checkbox" id="iryou4" value="option13" name="iryouche">
                        <label for="iryou4" style="padding-right: 10px;">간호사.간호조무사</label>
                        <input type="checkbox" id="iryou5" value="option13" name="iryouche">
                        <label for="iryou5" style="padding-right: 10px;">의료기사</label>
                        <input type="checkbox" id="iryou6" value="option13" name="iryouche">
                        <label for="iryou6" style="padding-right: 10px;">사무.원무.코디</label>
                        <input type="checkbox" id="iryou7" value="option13" name="iryouche">
                        <label for="iryou7" style="padding-right: 10px;">보험심사과</label>
                        <input type="checkbox" id="iryou8" value="option13" name="iryouche">
                        <label for="iryou8" style="padding-right: 10px;">의료기타직</label>
           		</div>
           	 </div>
          <div class="modal-footer" id="fotter3">
            <a href="#" data-dismiss="modal" class="btn">Close</a>
            <a href="#" class="btn btn-primary">Complete</a>
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
                        <input type="checkbox" id="gakureki1" value="option14" name="gakurekiche">
                        <label for="gakureki1" style="padding-right: 10px;">대학원</label>
                        <input type="checkbox" id="gakureki2" value="option14" name="gakurekiche">
                        <label for="gakureki2" style="padding-right: 10px;">대학교</label>
                        <input type="checkbox" id="gakureki3" value="option14" name="gakurekiche">
                        <label for="gakureki3" style="padding-right: 10px;">전문대학</label>
                        <input type="checkbox" id="gakureki4" value="option14" name="gakurekiche">
                        <label for="gakureki4" style="padding-right: 10px;">고등학교</label>
					</div>
	            </div>
	        <div class="modal-footer" id="fotter4">
            <a href="#" data-dismiss="modal" class="btn">Close</a>
            <a href="#" class="btn btn-success">Complete</a>
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
                        <input type="checkbox" id="syotsuku1" value="option15" name="syotsukuche">
                        <label for="syotsuku1" style="padding-right: 10px;">사원</label>
                        <input type="checkbox" id="syotsuku2" value="option15" name="syotsukuche">
                        <label for="syotsuku2" style="padding-right: 10px;">주임</label>
                        <input type="checkbox" id="syotsuku3" value="option15" name="syotsukuche">
                        <label for="syotsuku3" style="padding-right: 10px;">계장</label>
                        <input type="checkbox" id="syotsuku4" value="option15" name="syotsukuche">
                        <label for="syotsuku4" style="padding-right: 10px;">대리</label>
                        <input type="checkbox" id="syotsuku5" value="option15" name="syotsukuche">
                        <label for="syotsuku5" style="padding-right: 10px;">과장</label>
                        <input type="checkbox" id="syotsuku6" value="option15" name="syotsukuche">
                        <label for="syotsuku6" style="padding-right: 10px;">부장</label>
                        <input type="checkbox" id="syotsuku7" value="option15" name="syotsukuche">
                        <label for="syotsuku7" style="padding-right: 10px;">차장</label>
                        <input type="checkbox" id="syotsuku8" value="option15" name="syotsukuche">
                        <label for="syotsuku8" style="padding-right: 10px;">감사</label>
					</div>
	            </div>
	           	 <h3 class="syokuseki" style="font-size:20px; margin: 0 0 0 20px;">직책</h3>
						<hr class="linee16" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="syokuseki1" value="option16" name="syokusekiche">
                        <label for="syokuseki1" style="padding-right: 10px;">팀원</label>
                        <input type="checkbox" id="syokuseki2" value="option16" name="syokusekiche">
                        <label for="syokuseki2" style="padding-right: 10px;">팀장</label>
                        <input type="checkbox" id="syokuseki3" value="option16" name="syokusekiche">
                        <label for="syokuseki3" style="padding-right: 10px;">실장</label>
                        <input type="checkbox" id="syokuseki4" value="option16" name="syokusekiche">
                        <label for="syokuseki4" style="padding-right: 10px;">총무</label>
                        <input type="checkbox" id="syokuseki5" value="option16" name="syokusekiche">
                        <label for="syokuseki5" style="padding-right: 10px;">지점장</label>
                        <input type="checkbox" id="syokuseki6" value="option16" name="syokusekiche">
                        <label for="syokuseki6" style="padding-right: 10px;">지사장</label>
                        <input type="checkbox" id="syokuseki7" value="option16" name="syokusekiche">
                        <label for="syokuseki7" style="padding-right: 10px;">파트장</label>
                        <input type="checkbox" id="syokuseki8" value="option16" name="syokusekiche">
                        <label for="syokuseki8" style="padding-right: 10px;">그룹장</label>
					</div>
	            </div>
	        <div class="modal-footer" id="fotter5">
            <a href="#" data-dismiss="modal" class="btn">Close</a>
            <a href="#" class="btn btn-info">Complete</a>
          </div>
			</div>
		  </div>
		</div>
	  </div>
		
	<!-- 업종모달창 -->
	<div class="modal" id="myModal5" aria-hidden="true">
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
                        <input type="checkbox" id="sabisugyou1" value="option17" name="sabisugyouche">
                        <label for="sabisugyou1" style="padding-right: 10px;">호텔.여행.항공</label>
                        <input type="checkbox" id="sabisugyou2" value="option17" name="sabisugyouche">
                        <label for="sabisugyou2" style="padding-right: 10px;">외식업.식음료</label>
                        <input type="checkbox" id="sabisugyou3" value="option17" name="sabisugyouche">
                        <label for="sabisugyou3" style="padding-right: 10px;">시설관리.경비.용역</label>
                        <input type="checkbox" id="sabisugyou4" value="option17" name="sabisugyouche">
                        <label for="sabisugyou4" style="padding-right: 10px;">레저.스포츠.여가</label>
                        <input type="checkbox" id="sabisugyou5" value="option17" name="sabisugyouche">
                        <label for="sabisugyou5" style="padding-right: 10px;">AS.카센터.주유</label>
                        <input type="checkbox" id="sabisugyou6" value="option17" name="sabisugyouche">
                        <label for="sabisugyou6" style="padding-right: 10px;">렌탈.임대</label>
                        <input type="checkbox" id="sabisugyou7" value="option17" name="sabisugyouche">
                        <label for="sabisugyou7" style="padding-right: 10px;">웨딩.장례.이벤트</label>
                        <input type="checkbox" id="sabisugyou8" value="option17" name="sabisugyouche">
                        <label for="sabisugyou8" style="padding-right: 10px;">기타서비스업</label>
                        <input type="checkbox" id="sabisugyou9" value="option17" name="sabisugyouche">
                        <label for="sabisugyou9" style="padding-right: 10px;">뷰티.미용</label>
					</div>
	            </div>
	            
	            <h3 class="kagakugyou" style="font-size:20px; margin: 0 0 0 20px;">제조.화학</h3>
						<hr class="linee18" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="kagakugyou1" value="option18" name="kagakugyouche">
                        <label for="kagakugyou1" style="padding-right: 10px;">전기.전자.기계.자동차</label>
                        <input type="checkbox" id="kagakugyou2" value="option18" name="kagakugyouche">
                        <label for="kagakugyou2" style="padding-right: 10px;">석유.화학.에너지</label>
                        <input type="checkbox" id="kagakugyou3" value="option18" name="kagakugyouche">
                        <label for="kagakugyou2" style="padding-right: 10px;">섬유.패션.화장품.뷰티</label>
                        <input type="checkbox" id="kagakugyou4" value="option18" name="kagakugyouche">
                        <label for="kagakugyou4" style="padding-right: 10px;">생활용품.소비재.사무</label>
                        <input type="checkbox" id="kagakugyou5" value="option18" name="kagakugyouche">
                        <label for="kagakugyou5" style="padding-right: 10px;">가구.목재.제지</label>
                        <input type="checkbox" id="kagakugyou6" value="option18" name="kagakugyouche">
                        <label for="kagakugyou6" style="padding-right: 10px;">농업.어업.광업.임업</label>
                        <input type="checkbox" id="kagakugyou7" value="option18" name="kagakugyouche">
                        <label for="kagakugyou7" style="padding-right: 10px;">금속.재료.철강.조선.항공</label>
                        <input type="checkbox" id="kagakugyou8" value="option18" name="kagakugyouche">
                        <label for="kagakugyou8" style="padding-right: 10px;">기타제조업</label>
                        <input type="checkbox" id="kagakugyou9" value="option18" name="kagakugyouche">
                        <label for="kagakugyou9" style="padding-right: 10px;">식품가공.개발.환경</label>
                        <input type="checkbox" id="kagakugyou10" value="option18" name="kagakugyouche">
                        <label for="kagakugyou10" style="padding-right: 10px;">반도체.광학.LCD</label>
					</div>
	            </div>
						              
	            <h3 class="tsuusinngyou" style="font-size:20px; margin: 0 0 0 20px;">IT.웹.통신</h3>
						<hr class="linee19" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="tsuusinngyou1" value="option19" name="tsuusinngyouche">
                        <label for="tsuusinngyou1" style="padding-right: 10px;">솔루션.SHER.CRM</label>
                        <input type="checkbox" id="tsuusinngyou2" value="option19" name="tsuusinngyouche">
                        <label for="tsuusinngyou2" style="padding-right: 10px;">웹에이젼시</label>
                        <input type="checkbox" id="tsuusinngyou3" value="option19" name="tsuusinngyouche">
                        <label for="tsuusinngyou3" style="padding-right: 10px;">쇼핑몰.오픈마켓</label>
                        <input type="checkbox" id="tsuusinngyou4" value="option19" name="tsuusinngyouche">
                        <label for="tsuusinngyou4" style="padding-right: 10px;">포털.인터넷.컨텐츠</label>
                        <input type="checkbox" id="tsuusinngyou5" value="option19" name="tsuusinngyouche">
                        <label for="tsuusinngyou5" style="padding-right: 10px;">네트워크.통신.모바일</label>
                        <input type="checkbox" id="tsuusinngyou6" value="option19" name="tsuusinngyouche">
                        <label for="tsuusinngyou6" style="padding-right: 10px;">하드웨어.장비</label>
                        <input type="checkbox" id="tsuusinngyou7" value="option19" name="tsuusinngyouche">
                        <label for="tsuusinngyou7" style="padding-right: 10px;">정보보안.백신</label>
                        <input type="checkbox" id="tsuusinngyou8" value="option19" name="tsuusinngyouche">
                        <label for="tsuusinngyou8" style="padding-right: 10px;">IT컨설팅</label>
                        <input type="checkbox" id="tsuusinngyou9" value="option19" name="tsuusinngyouche">
                        <label for="tsuusinngyou9" style="padding-right: 10px;">게임</label>
					</div>
	            </div>

	            <h3 class="kinyueigyou" style="font-size:20px; margin: 0 0 0 20px;">은행.금융업</h3>
						<hr class="linee20" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="kinyueigyou1" value="option20" name="kinyueigyouche">
                        <label for="tsuusinngyou1" style="padding-right: 10px;">은행.금융.저축</label>
                        <input type="checkbox" id="kinyueigyou2" value="option20" name="kinyueigyouche">
                        <label for="tsuusinngyou2" style="padding-right: 10px;">대출.캐피탈.여신</label>
                        <input type="checkbox" id="kinyueigyou3" value="option20" name="kinyueigyouche">
                        <label for="tsuusinngyou3" style="padding-right: 10px;">기타금융</label>
                        <input type="checkbox" id="kinyueigyou4" value="option20" name="kinyueigyouche">
                        <label for="tsuusinngyou4" style="padding-right: 10px;">증권.보험.카드</label>
					</div>
	            </div>
	            
	            <h3 class="mediasangyou" style="font-size:20px; margin: 0 0 0 20px;">미디어.디자인</h3>
						<hr class="linee21" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="mediasangyou1" value="option21" name="mediasangyouche">
                        <label for="mediasangyou1" style="padding-right: 10px;">신문.잡지.언론사</label>
                        <input type="checkbox" id="mediasangyou2" value="option21" name="mediasangyouche">
                        <label for="mediasangyou2" style="padding-right: 10px;">방송사.케이블</label>
                        <input type="checkbox" id="mediasangyou3" value="option21" name="mediasangyouche">
                        <label for="mediasangyou3" style="padding-right: 10px;">연예.엔터테이먼트</label>
                        <input type="checkbox" id="mediasangyou4" value="option21" name="mediasangyouche">
                        <label for="mediasangyou4" style="padding-right: 10px;">광고.흥보.전시</label>
                        <input type="checkbox" id="mediasangyou5" value="option21" name="mediasangyouche">
                        <label for="mediasangyou5" style="padding-right: 10px;">영화.배급.음악</label>
                        <input type="checkbox" id="mediasangyou6" value="option21" name="mediasangyouche">
                        <label for="mediasangyou6" style="padding-right: 10px;">공연.예술.문화</label>
                        <input type="checkbox" id="mediasangyou7" value="option21" name="mediasangyouche">
                        <label for="mediasangyou7" style="padding-right: 10px;">출판.인쇄.사진</label>
                        <input type="checkbox" id="mediasangyou8" value="option21" name="mediasangyouche">
                        <label for="mediasangyou8" style="padding-right: 10px;">캐릭터.애니메이션</label>
                        <input type="checkbox" id="mediasangyou9" value="option21" name="mediasangyouche">
                        <label for="mediasangyou9" style="padding-right: 10px;">디자인.설계</label>
					</div>
	            </div>
	            
	             <h3 class="kyouikugyou" style="font-size:20px; margin: 0 0 0 20px;">교육업</h3>
						<hr class="linee22" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="kyouikugyou1" value="option22" name="kyouikugyouche">
                        <label for="kyouikugyou1" style="padding-right: 10px;">초중고.대학</label>
                        <input type="checkbox" id="kyouikugyou2" value="option22" name="kyouikugyouche">
                        <label for="kyouikugyou2" style="padding-right: 10px;">학원,어학원</label>
                        <input type="checkbox" id="kyouikugyou3" value="option22" name="kyouikugyouche">
                        <label for="kyouikugyou3" style="padding-right: 10px;">유아.유치원</label>
                        <input type="checkbox" id="kyouikugyou4" value="option22" name="kyouikugyouche">
                        <label for="kyouikugyou4" style="padding-right: 10px;">교재.학습지</label>
                        <input type="checkbox" id="kyouikugyou5" value="option22" name="kyouikugyouche">
                        <label for="kyouikugyou5" style="padding-right: 10px;">전문.기능학원</label>
					</div>
	            </div>
	            
	             <h3 class="seiyakugyou" style="font-size:20px; margin: 0 0 0 20px;">의료.제약.복지</h3>
						<hr class="linee23" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="seiyakugyou1" value="option23" name="seiyakugyouche">
                        <label for="seiyakugyou1" style="padding-right: 10px;">의료.보건</label>
                        <input type="checkbox" id="seiyakugyou2" value="option23" name="seiyakugyouche">
                        <label for="seiyakugyou2" style="padding-right: 10px;">제약.바이오</label>
                        <input type="checkbox" id="seiyakugyou3" value="option23" name="seiyakugyouche">
                        <label for="seiyakugyou3" style="padding-right: 10px;">사회복지</label>
					</div>
	            </div>
	            
	                  <h3 class="hanbaigyou" style="font-size:20px; margin: 0 0 0 20px;">판매.유통</h3>
						<hr class="linee24" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="hanbaigyou1" value="option23" name="hanbaigyouche">
                        <label for="hanbaigyou1" style="padding-right: 10px;">판매.유통</label>
                        <input type="checkbox" id="hanbaigyou2" value="option23" name="hanbaigyouche">
                        <label for="hanbaigyou2" style="padding-right: 10px;">무역,상사</label>
                        <input type="checkbox" id="hanbaigyou3" value="option23" name="hanbaigyouche">
                        <label for="hanbaigyou3" style="padding-right: 10px;">운송.운수.물류</label>
					</div>
	            </div>
	            
	                <h3 class="kenchikugyou" style="font-size:20px; margin: 0 0 0 20px;">건설업</h3>
						<hr class="linee25" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="kenchikugyou1" value="option24" name="kenchikugyouche">
                        <label for="kenchikugyou1" style="padding-right: 10px;">건설.건축.토목.시공</label>
                        <input type="checkbox" id="kenchikugyou2" value="option24" name="kenchikugyouche">
                        <label for="kenchikugyou2" style="padding-right: 10px;">실내.인테리어.조경</label>
                        <input type="checkbox" id="kenchikugyou3" value="option24" name="kenchikugyouche">
                        <label for="kenchikugyou3" style="padding-right: 10px;">환경.설비</label>
                        <input type="checkbox" id="kenchikugyou4" value="option24" name="kenchikugyouche">
                        <label for="kenchikugyou4" style="padding-right: 10px;">부동산.임대.중개</label>
					</div>
	            </div>
	            
	                  <h3 class="kikangyou" style="font-size:20px; margin: 0 0 0 20px;">기관.협회</h3>
						<hr class="linee26" style="width: 1700px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="kikangyou1" value="option25" name="kikangyouche">
                        <label for="kikangyou1" style="padding-right: 10px;">정부.공공기관.공기업</label>
                        <input type="checkbox" id="kikangyou2" value="option25" name="kikangyouche">
                        <label for="kikangyou2" style="padding-right: 10px;">협회.단체</label>
                        <input type="checkbox" id="kikangyou3" value="option25" name="kikangyouche">
                        <label for="kikangyou3" style="padding-right: 10px;">법률.법무.특허</label>
                        <input type="checkbox" id="kikangyou4" value="option25" name="kikangyouche">
                        <label for="kikangyou4" style="padding-right: 10px;">세무.회계</label>
                        <input type="checkbox" id="kikangyou5" value="option25" name="kikangyouche">
                        <label for="kikangyou5" style="padding-right: 10px;">연구소.컨설팅.조사</label>
					</div>
	            </div>
	        <div class="modal-footer" id="fotter6">
            <a href="#" data-dismiss="modal" class="btn">Close</a>
            <a href="#" class="btn btn-warning">Complete</a>
          </div>
			</div>
		  </div>
		</div>
	  </div>
	
	<!-- 어학모달창 -->
	<div class="modal" id="myModal6" aria-hidden="true">
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
                        <input type="checkbox" id="eigodesu1" value="option26" name="eigodesuche">
                        <label for="eigodesu1" style="padding-right: 10px;">TOEIC</label>
                        <input type="checkbox" id="eigodesu2" value="option26" name="eigodesuche">
                        <label for="eigodesu2" style="padding-right: 10px;">TOEFI</label>
                        <input type="checkbox" id="eigodesu3" value="option26" name="eigodesuche">
                        <label for="eigodesu3" style="padding-right: 10px;">TEPS</label>
                        <input type="checkbox" id="eigodesu4" value="option26" name="eigodesuche">
                        <label for="eigodesu4" style="padding-right: 10px;">IELTS</label>
                        <input type="checkbox" id="eigodesu5" value="option26" name="eigodesuche">
                        <label for="eigodesu5" style="padding-right: 10px;">OPIC</label>
                        <input type="checkbox" id="eigodesu6" value="option26" name="eigodesuche">
                        <label for="eigodesu6" style="padding-right: 10px;">무역영어</label>
                        <input type="checkbox" id="eigodesu7" value="option26" name="eigodesuche">
                        <label for="eigodesu7" style="padding-right: 10px;">SPA</label>
                        <input type="checkbox" id="eigodesu8" value="option26" name="eigodesuche">
                        <label for="eigodesu8" style="padding-right: 10px;">SAT</label>
                        <input type="checkbox" id="eigodesu9" value="option26" name="eigodesuche">
                        <label for="eigodesu9" style="padding-right: 10px;">영어교원자격증</label>
					</div>
	            </div>
	          
	           	 <h3 class="nihongodesu" style="font-size:20px; margin: 0 0 0 20px;">일본어</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="nihongodesu1" value="option26" name="nihongodesuche">
                        <label for="nihongodesu1" style="padding-right: 10px;">JLPT</label>
                        <input type="checkbox" id="nihongodesu2" value="option26" name="nihongodesuche">
                        <label for="nihongodesu2" style="padding-right: 10px;">JPT</label>
                        <input type="checkbox" id="nihongodesu3" value="option26" name="nihongodesuche">
                        <label for="nihongodesu3" style="padding-right: 10px;">SJPT</label>
                        <input type="checkbox" id="nihongodesu4" value="option26" name="nihongodesuche">
                        <label for="nihongodesu4" style="padding-right: 10px;">EJU</label>
                        <input type="checkbox" id="nihongodesu5" value="option26" name="nihongodesuche">
                        <label for="nihongodesu5" style="padding-right: 10px;">일본어교원자격증</label>
					</div>
	            </div>
	            
	                	 <h3 class="cyuugokugodesu" style="font-size:20px; margin: 0 0 0 20px;">중국어</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="cyuugokugodesu1" value="option27" name="cyuugokugodesuche">
                        <label for="cyuugokugodesu1" style="padding-right: 10px;">HSK</label>
                        <input type="checkbox" id="cyuugokugodesu2" value="option27" name="cyuugokugodesuche">
                        <label for="cyuugokugodesu2" style="padding-right: 10px;">TSC</label>
                        <input type="checkbox" id="cyuugokugodesu3" value="option27" name="cyuugokugodesuche">
                        <label for="cyuugokugodesu3" style="padding-right: 10px;">HSK회화</label>
                        <input type="checkbox" id="cyuugokugodesu4" value="option27" name="cyuugokugodesuche">
                        <label for="cyuugokugodesu4" style="padding-right: 10px;">OPIC</label>
                        <input type="checkbox" id="cyuugokugodesu5" value="option27" name="cyuugokugodesuche">
                        <label for="cyuugokugodesu5" style="padding-right: 10px;">YCT</label>
                        <input type="checkbox" id="cyuugokugodesu6" value="option27" name="cyuugokugodesuche">
                        <label for="cyuugokugodesu6" style="padding-right: 10px;">TOCFL</label>
                        <input type="checkbox" id="cyuugokugodesu7" value="option27" name="cyuugokugodesuche">
                        <label for="cyuugokugodesu7" style="padding-right: 10px;">중국어교원자격증</label>
					</div>
	            </div>
	            
	             <h3 class="doitsugodesu" style="font-size:20px; margin: 0 0 0 20px;">독일어</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="doitsugodesu1" value="option28" name="doitsugodesuche">
                        <label for="doitsugodesu1" style="padding-right: 10px;">ZD</label>
                        <input type="checkbox" id="doitsugodesu2" value="option28" name="doitsugodesuche">
                        <label for="doitsugodesu2" style="padding-right: 10px;">DSH</label>
                        <input type="checkbox" id="doitsugodesu3" value="option28" name="doitsugodesuche">
                        <label for="doitsugodesu3" style="padding-right: 10px;">TESTDAF</label>
                        <input type="checkbox" id="doitsugodesu4" value="option28" name="doitsugodesuche">
                        <label for="doitsugodesu4" style="padding-right: 10px;">FLEX독일어</label>
                        <input type="checkbox" id="doitsugodesu5" value="option28" name="doitsugodesuche">
                        <label for="doitsugodesu5" style="padding-right: 10px;">SD2</label>
					</div>
	            </div>
	            
	             <h3 class="huransugodesu" style="font-size:20px; margin: 0 0 0 20px;">불어</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="huransugodesu1" value="option29" name="huransugodesuche">
                        <label for="huransugodesu1" style="padding-right: 10px;">DELF A2</label>
                        <input type="checkbox" id="huransugodesu2" value="option29" name="huransugodesuche">
                        <label for="huransugodesu2" style="padding-right: 10px;">DELF B1</label>
                        <input type="checkbox" id="huransugodesu3" value="option29" name="huransugodesuche">
                        <label for="huransugodesu2" style="padding-right: 10px;">DELF B2</label>
                        <input type="checkbox" id="huransugodesu4" value="option29" name="huransugodesuche">
                        <label for="huransugodesu4" style="padding-right: 10px;">DELF</label>
                        <input type="checkbox" id="huransugodesu5" value="option29" name="huransugodesuche">
                        <label for="huransugodesu5" style="padding-right: 10px;">FELF A1</label>
					</div>
	            </div>
	            
	             <h3 class="supegodesu" style="font-size:20px; margin: 0 0 0 20px;">스페인어</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="supegodesu1" value="option30" name="supegodesuche">
                        <label for="supegodesu1" style="padding-right: 10px;">DELE</label>
                        <input type="checkbox" id="supegodesu2" value="option30" name="supegodesuche">
                        <label for="supegodesu2" style="padding-right: 10px;">FLEX스페인어</label>
                        <input type="checkbox" id="supegodesu3" value="option30" name="supegodesuche">
                        <label for="supegodesu3" style="padding-right: 10px;">OPIC</label>
					</div>
	            </div>
	            
	             <h3 class="rojiagodesu" style="font-size:20px; margin: 0 0 0 20px;">러시아어</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="rojiagodesu1" value="option31" name="rojiagodesuche">
                        <label for="rojiagodesu1" style="padding-right: 10px;">토르플</label>
                        <input type="checkbox" id="rojiagodesu2" value="option31" name="rojiagodesuche">
                        <label for="rojiagodesu2" style="padding-right: 10px;">FLEX러시아어</label>
                        <input type="checkbox" id="rojiagodesu3" value="option31" name="rojiagodesuche">
                        <label for="rojiagodesu3" style="padding-right: 10px;">OPIC</label>
                        <input type="checkbox" id="rojiagodesu4" value="option31" name="rojiagodesuche">
                        <label for="rojiagodesu4" style="padding-right: 10px;">SNULT 러시아어</label>
					</div>
	            </div>
	            
	             <h3 class="iterigodesu" style="font-size:20px; margin: 0 0 0 20px;">이탈리아어</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="iterigodesu1" value="option32" name="iterigodesuche">
                        <label for="iterigodesu1" style="padding-right: 10px;">CILS</label>
                        <input type="checkbox" id="iterigodesu2" value="option32" name="iterigodesuche">
                        <label for="iterigodesu2" style="padding-right: 10px;">CEU</label>
					</div>
	            </div>
	            
	             <h3 class="kankokugodesu" style="font-size:20px; margin: 0 0 0 20px;">한국어</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="kankokugodesu1" value="option33" name="kankokugodesuche">
                        <label for="kankokugodesu1" style="padding-right: 10px;">TOPIK</label>
                        <input type="checkbox" id="kankokugodesu2" value="option33" name="kankokugodesuche">
                        <label for="kankokugodesu2" style="padding-right: 10px;">KBS한국어능력시험</label>
                        <input type="checkbox" id="kankokugodesu3" value="option33" name="kankokugodesuche">
                        <label for="kankokugodesu3" style="padding-right: 10px;">국어능력인증시험</label>
                        <input type="checkbox" id="kankokugodesu4" value="option33" name="kankokugodesuche">
                        <label for="kankokugodesu4" style="padding-right: 10px;">한국어교원자격증</label>
					</div>
	            </div>
	            
	             <h3 class="igaigodesu" style="font-size:20px; margin: 0 0 0 20px;">기타</h3>
						<hr class="linee28" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
	            <div class="checkbox2">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="igaigodesu1" value="option34" name="igaigodesuche">
                        <label for="igaigodesu1" style="padding-right: 10px;">한자능력검정시험</label>
                        <input type="checkbox" id="igaigodesu2" value="option34" name="igaigodesuche">
                        <label for="igaigodesu2" style="padding-right: 10px;">한자자격검정</label>
                        <input type="checkbox" id="igaigodesu3" value="option34" name="igaigodesuche">
                        <label for="igaigodesu3" style="padding-right: 10px;">베트남어</label>
                        <input type="checkbox" id="igaigodesu4" value="option34" name="igaigodesuche">
                        <label for="igaigodesu4" style="padding-right: 10px;">인도네시아어</label>
					</div>
	            </div>
	        <div class="modal-footer" id="fotter7">
            <a href="#" data-dismiss="modal" class="btn">Close</a>
            <a href="#" class="btn btn-danger">Complete</a>
          </div>
			</div>
		  </div>
		</div>
	  </div>
	  
	  <!-- 학력모달창 -->
	<div class="modal" id="myModal12" aria-hidden="true">
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
                        <input type="checkbox" id="kenchikusikaku1" value="option31" name="kenchikusikakuche">
                        <label for="kenchikusikaku1" style="padding-right: 10px;">건설기계기사</label>
                        <input type="checkbox" id="kenchikusikaku2" value="option31" name="kenchikusikakuche">
                        <label for="kenchikusikaku2" style="padding-right: 10px;">건설안전기사</label>
                        <input type="checkbox" id="kenchikusikaku3" value="option31" name="kenchikusikakuche">
                        <label for="kenchikusikaku3" style="padding-right: 10px;">토목기사</label>
                        <input type="checkbox" id="kenchikusikaku4" value="option31" name="kenchikusikakuche">
                        <label for="kenchikusikaku4" style="padding-right: 10px;">건축기사</label>
                        <input type="checkbox" id="kenchikusikaku5" value="option31" name="kenchikusikakuche">
                        <label for="kenchikusikaku5" style="padding-right: 10px;">실내건축기사</label>
                        <input type="checkbox" id="kenchikusikaku6" value="option31" name="kenchikusikakuche">
                        <label for="kenchikusikaku6" style="padding-right: 10px;">조경기사</label>
                        <input type="checkbox" id="kenchikusikaku7" value="option31" name="kenchikusikakuche">
                        <label for="kenchikusikaku7" style="padding-right: 10px;">지적기사</label>
                        <input type="checkbox" id="kenchikusikaku8" value="option31" name="kenchikusikakuche">
                        <label for="kenchikusikaku8" style="padding-right: 10px;">도시계획기사</label>
                        <input type="checkbox" id="kenchikusikaku9" value="option31" name="kenchikusikakuche">
                        <label for="kenchikusikaku9" style="padding-right: 10px;">측량기사</label><br>
                        <input type="checkbox" id="kenchikusikaku10" value="option31" name="kenchikusikakuche">
                        <label for="kenchikusikaku10" style="padding-right: 10px;">전산응용건축제도기능사</label>
					</div>
	            </div>
	            
	            <h3 class="jyouhousikaku" style="font-size:20px; margin: 0 0 0 20px;">IT/WEB/정보</h3>
						<hr class="linee30" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="jyouhousikaku1" value="option32" name="jyouhousikakuche">
                        <label for="jyouhousikaku1" style="padding-right: 10px;">CCNA</label>
                        <input type="checkbox" id="jyouhousikaku2" value="option32" name="jyouhousikakuche">
                        <label for="jyouhousikaku2" style="padding-right: 10px;">CCNP/CCIE</label>
                        <input type="checkbox" id="jyouhousikaku3" value="option32" name="jyouhousikakuche">
                        <label for="jyouhousikaku3" style="padding-right: 10px;">MCSE/LPIC</label>
                        <input type="checkbox" id="jyouhousikaku4" value="option32" name="jyouhousikakuche">
                        <label for="jyouhousikaku4" style="padding-right: 10px;">PC정비사</label>
                        <input type="checkbox" id="jyouhousikaku5" value="option32" name="jyouhousikakuche">
                        <label for="jyouhousikaku5" style="padding-right: 10px;">네트워크관리사</label>
                        <input type="checkbox" id="jyouhousikaku6" value="option32" name="jyouhousikakuche">
                        <label for="jyouhousikaku6" style="padding-right: 10px;">사무자동화산업기사</label>
                        <input type="checkbox" id="jyouhousikaku7" value="option32" name="jyouhousikakuche">
                        <label for="jyouhousikaku7" style="padding-right: 10px;">웹디자인기능사</label>
                        <input type="checkbox" id="jyouhousikaku8" value="option32" name="jyouhousikakuche">
                        <label for="jyouhousikaku8" style="padding-right: 10px;">정보기술자격(ITQ)</label>
                        <input type="checkbox" id="jyouhousikaku9" value="option32" name="jyouhousikakuche">
                        <label for="jyouhousikaku9" style="padding-right: 10px;">정보처리기사</label>
                        <input type="checkbox" id="jyouhousikaku10" value="option32" name="jyouhousikakuche">
                        <label for="jyouhousikaku10" style="padding-right: 10px;">컴퓨터그래픽스운용기능사</label>
					</div>
	            </div>
	            
	             <h3 class="kankyousikaku" style="font-size:20px; margin: 0 0 0 20px;">환경/안전/설비</h3>
						<hr class="linee31" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="kankyousikaku1" value="option33" name="kankyousikakuche">
                        <label for="kankyousikaku1" style="padding-right: 10px;">가스기능사</label>
                        <input type="checkbox" id="kankyousikaku2" value="option33" name="kankyousikakuche">
                        <label for="kankyousikaku2" style="padding-right: 10px;">공조냉동기계기능사</label>
                        <input type="checkbox" id="kankyousikaku3" value="option33" name="kankyousikakuche">
                        <label for="kankyousikaku3" style="padding-right: 10px;">대기환경기사</label>
                        <input type="checkbox" id="kankyousikaku4" value="option33" name="kankyousikakuche">
                        <label for="kankyousikaku4" style="padding-right: 10px;">산업안전기사</label>
                        <input type="checkbox" id="kankyousikaku5" value="option33" name="kankyousikakuche">
                        <label for="kankyousikaku5" style="padding-right: 10px;">소방설비기사</label>
                        <input type="checkbox" id="kankyousikaku6" value="option33" name="kankyousikakuche">
                        <label for="kankyousikaku6" style="padding-right: 10px;">수질환경기사</label>
                        <input type="checkbox" id="kankyousikaku7" value="option33" name="kankyousikakuche">
                        <label for="kankyousikaku7" style="padding-right: 10px;">에너지관리기사</label>
                        <input type="checkbox" id="kankyousikaku8" value="option33" name="kankyousikakuche">
                        <label for="kankyousikaku8" style="padding-right: 10px;">위험물산업기사</label><br>
                        <input type="checkbox" id="kankyousikaku9" value="option33" name="kankyousikakuche">
                        <label for="kankyousikaku9" style="padding-right: 10px;">폐기물처리기사</label>
                        <input type="checkbox" id="kankyousikaku10" value="option33" name="kankyousikakuche">
                        <label for="kankyousikaku10" style="padding-right: 10px;">화공기사</label>
					</div>
	            </div>
	            
	              <h3 class="denkisikaku" style="font-size:20px; margin: 0 0 0 20px;">전기/전자/통신</h3>
						<hr class="linee32" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="denkisikaku1" value="option34" name="denkisikakuche">
                        <label for="denkisikaku1" style="padding-right: 10px;">CISA/CISSP</label>
                        <input type="checkbox" id="denkisikaku2" value="option34" name="denkisikakuche">
                        <label for="denkisikaku2" style="padding-right: 10px;">무선통신기사</label>
                        <input type="checkbox" id="denkisikaku3" value="option34" name="denkisikakuche">
                        <label for="denkisikaku3" style="padding-right: 10px;">전기공사기사</label>
                        <input type="checkbox" id="denkisikaku4" value="option34" name="denkisikakuche">
                        <label for="denkisikaku4" style="padding-right: 10px;">전기기기기사</label>
                        <input type="checkbox" id="denkisikaku5" value="option34" name="denkisikakuche">
                        <label for="denkisikaku5" style="padding-right: 10px;">전기기사</label>
                        <input type="checkbox" id="denkisikaku6" value="option34" name="denkisikakuche">
                        <label for="denkisikaku6" style="padding-right: 10px;">전자기기기능사</label>
                        <input type="checkbox" id="denkisikaku7" value="option34" name="denkisikakuche">
                        <label for="denkisikaku7" style="padding-right: 10px;">전자기사</label>
                        <input type="checkbox" id="denkisikaku8" value="option34" name="denkisikakuche">
                        <label for="denkisikaku8" style="padding-right: 10px;">전자캐드기능사</label>
                        <input type="checkbox" id="denkisikaku9" value="option34" name="denkisikakuche">
                        <label for="denkisikaku9" style="padding-right: 10px;">정보통신기사</label>
					</div>
	            </div>
	            
	            <h3 class="seisansikaku" style="font-size:20px; margin: 0 0 0 20px;">생산/제조/기계</h3>
						<hr class="linee33" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="seisansikaku1" value="option35" name="seisansikakuche">
                        <label for="seisansikaku1" style="padding-right: 10px;">기계설계기사</label>
                        <input type="checkbox" id="seisansikaku2" value="option35" name="seisansikakuche">
                        <label for="seisansikaku2" style="padding-right: 10px;">기계조립/정비기능사</label>
                        <input type="checkbox" id="seisansikaku3" value="option35" name="seisansikakuche">
                        <label for="seisansikaku3" style="padding-right: 10px;">선반/밀링기능사</label>
                        <input type="checkbox" id="seisansikaku4" value="option35" name="seisansikakuche">
                        <label for="seisansikaku4" style="padding-right: 10px;">일반기계기사</label>
                        <input type="checkbox" id="seisansikaku5" value="option35" name="seisansikakuche">
                        <label for="seisansikaku5" style="padding-right: 10px;">자동차정비기능사</label>
                        <input type="checkbox" id="seisansikaku6" value="option35" name="seisansikakuche">
                        <label for="seisansikaku6" style="padding-right: 10px;">전기/가스용접기사</label>
                        <input type="checkbox" id="seisansikaku7" value="option35" name="seisansikakuche">
                        <label for="seisansikaku7" style="padding-right: 10px;">지게차운전기능사</label><br>
                        <input type="checkbox" id="seisansikaku8" value="option35" name="seisansikakuche">
                        <label for="seisansikaku8" style="padding-right: 10px;">품질관리기사</label>
                        <input type="checkbox" id="seisansikaku9" value="option35" name="seisansikakuche">
                        <label for="seisansikaku9" style="padding-right: 10px;">품질경영기사</label>
					</div>
	            </div>
	            
	              <h3 class="keieisikaku" style="font-size:20px; margin: 0 0 0 20px;">금융/경영/회계</h3>
						<hr class="linee34" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="keieisikaku1" value="option36" name="keieisikakuche">
                        <label for="keieisikaku1" style="padding-right: 10px;">CFP/AFPK</label>
                        <input type="checkbox" id="keieisikaku2" value="option36" name="keieisikakuche">
                        <label for="keieisikaku2" style="padding-right: 10px;">CPA/AICPA</label>
                        <input type="checkbox" id="keieisikaku3" value="option36" name="keieisikakuche">
                        <label for="keieisikaku3" style="padding-right: 10px;">금융자사관리사</label>
                        <input type="checkbox" id="keieisikaku4" value="option36" name="keieisikakuche">
                        <label for="keieisikaku4" style="padding-right: 10px;">선물거래상담사</label>
                        <input type="checkbox" id="keieisikaku5" value="option36" name="keieisikakuche">
                        <label for="keieisikaku5" style="padding-right: 10px;">손해사정인</label>
                        <input type="checkbox" id="keieisikaku6" value="option36" name="keieisikakuche">
                        <label for="keieisikaku6" style="padding-right: 10px;">재무위험관리사</label>
                        <input type="checkbox" id="keieisikaku7" value="option36" name="keieisikakuche">
                        <label for="keieisikaku7" style="padding-right: 10px;">전산세무회계</label>
                        <input type="checkbox" id="keieisikaku8" value="option36" name="keieisikakuche">
                        <label for="keieisikaku8" style="padding-right: 10px;">증권투자상담사</label>
					</div>
	            </div>
	            
	              <h3 class="bouekisikaku" style="font-size:20px; margin: 0 0 0 20px;">유통/무역/요리</h3>
						<hr class="linee35" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="bouekisikaku1" value="option37" name="bouekisikakuche">
                        <label for="bouekisikaku1" style="padding-right: 10px;">국제무역사</label>
                        <input type="checkbox" id="bouekisikaku2" value="option37" name="bouekisikakuche">
                        <label for="bouekisikaku2" style="padding-right: 10px;">무역영어</label>
                        <input type="checkbox" id="bouekisikaku3" value="option37" name="bouekisikakuche">
                        <label for="bouekisikaku3" style="padding-right: 10px;">물류관리사</label>
                        <input type="checkbox" id="bouekisikaku4" value="option37" name="bouekisikakuche">
                        <label for="bouekisikaku4" style="padding-right: 10px;">유통관리사</label>
                        <input type="checkbox" id="bouekisikaku5" value="option37" name="bouekisikakuche">
                        <label for="bouekisikaku5" style="padding-right: 10px;">일/중/양식조리기능사</label>
                        <input type="checkbox" id="bouekisikaku6" value="option37" name="bouekisikakuche">
                        <label for="bouekisikaku6" style="padding-right: 10px;">제과/제빵기능사</label>
                        <input type="checkbox" id="bouekisikaku7" value="option37" name="bouekisikakuche">
                        <label for="bouekisikaku7" style="padding-right: 10px;">한식조리기능사</label>
					</div>
	            </div>
	            
	              <h3 class="keibisikaku" style="font-size:20px; margin: 0 0 0 20px;">기타</h3>
						<hr class="linee36" style="width: 1130px; text-align: left; margin:  0 0 0 0;">
               <div class="checkbox1">
                 <div class="checkbox checkbox-success">
                        <input type="checkbox" id="keibisikaku1" value="option38" name="keibisikakuche">
                        <label for="keibisikaku1" style="padding-right: 10px;">경비지도사</label>
                        <input type="checkbox" id="keibisikaku2" value="option38" name="keibisikakuche">
                        <label for="keibisikaku2" style="padding-right: 10px;">공인중개사</label>
                        <input type="checkbox" id="keibisikaku3" value="option38" name="keibisikakuche">
                        <label for="keibisikaku3" style="padding-right: 10px;">도서관/사서</label>
                        <input type="checkbox" id="keibisikaku4" value="option38" name="keibisikakuche">
                        <label for="keibisikaku4" style="padding-right: 10px;">직업상담사</label>
                        <input type="checkbox" id="keibisikaku5" value="option38" name="keibisikakuche">
                        <label for="keibisikaku5" style="padding-right: 10px;">통/번역사</label>
					</div>
	            </div>
	            
	        <div class="modal-footer" id="fotter4">
            <a href="#" data-dismiss="modal" class="btn">Close</a>
            <a href="#" class="btn btn-primary">Complete</a>
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
              <h4 class="modal-title">기업오퍼등록</h4>
              
            </div><div class="container"></div>
            
            <div class="modal-body" style="margin-bottom: 0%;">
           		 <div class="btns">
		              <a data-toggle="modal" href="#myModal8" class="btn btn-primary" id="smodal-btn1" style="">기업오퍼등록</a>
              	      <input type="button" id="deleteOffer" value="오퍼 삭제">
              	
              	</div>
              	<br>
              <div class="modal-body2" style="margin-top: 1.3%; margin-bottom: 15%;">
              <hr class="linee1" style="width: 1740px; text-align: left; margin:  0 0 0 0;">
				<!-- 기업오퍼 뜨는곳 -->
				<h3>test test</h3>
				<div id="offerDiv">
				</div>
              </div>
            </div>
            <div class="modal-footer" id="footer2">
              <a href="#" data-dismiss="modal" class="btn">Close</a>
              <a href="#" class="btn btn-primary">Complete</a>
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
				  <div class="form-group">
				    <label class="sr-only" for="oper9"></label> <!-- 부가 설명 -->
				    <textarea name="explanation" id="explanation" rows="5" cols="23" placeholder="부가 설명을 입력하세요"></textarea>
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
              <h4 class="modal-title">채용진행상황</h4>
            </div>
            <div class="container"></div>
            
            <div class="modal-body" style="margin-bottom: 0%;">
           		 <div class="btns">
		               
		               <button type="button" class="btn btn-primary" id="update-btn1">Update</button> 
		               <!-- 0416 서류확인 모달 띄우기 위해서 기존 라디오 버튼 제거하고 a태그로 대체 하였습니다. -->
		               <a data-toggle="modal" href="#myModal16" class="btn btn-warning" id="resumeCheck-btn" style="">서류확인</a>
		             
		             <label class="btn btn-danger ">
					 	<input type="radio" name="options30" id="option30" value="personSign" autocomplete="off" > 1:1채팅
					</label>
					
					<label class="btn btn-info ">
						<input type="radio" name="options30" id="option30" value="personSign" autocomplete="off"> 면접확인
					</label>
					
					<label class="btn btn-success ">
						<input type="radio" name="options30" id="option30" value="personSign" autocomplete="off"> 채용완료
					</label>
              	</div>
              	<br>
              <div class="modal-body2" style="margin-top: 1.3%; margin-bottom: 38%;">
              <hr class="linee1" style="width: 1740px; text-align: left; margin:  0 0 0 0;">
				<!-- 인재 뜨는곳 -->
				<!-- 컨택인재프 -->	
					
					<h3>Testing</h3>
					
					<div id="statusDiv">
					</div>
		
 
              </div>
            </div>
            <div class="modal-footer" id="footer2">
              <a href="#" data-dismiss="modal" class="btn">Close</a>
              <a href="#" class="btn btn-primary">Complete</a>
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
              <h4 class="modal-title">Person List</h4>
            </div><div class="container"></div>
            
            <div class="modal-body" style="margin-bottom: 0%; ">
           		 <div class="btns">
           		 <!-- 0416 모달띄우기 위해서 기존 버튼에서 a태그로 교체하였습니다. -->
		              <a data-toggle="modal" href="#myModal15" class="btn btn-success" id="contact-btn" style="">이력서보기</a>
		              <a data-toggle="modal" href="#myModal14" class="btn btn-success" id="contact-btn" style="">컨텍/메시지전송</a>
		              <a data-toggle="" href="" class="btn btn-info" id="smodal-btn9" style="">목록가기</a>
		              <button type="button" class="btn btn-danger" id="smodal-btn10">목록삭제</button>
              	</div>
              	<br>
              <div class="modal-body1" style="margin-top: 1.3%; margin-bottom: 38%;">
              
              <hr class="linee1" style="width: 1740px; text-align: left; margin:0 0 0 0;">
				<!-- 인재 뜨는곳 -->
				<!-- 0412프 -->
				<h3>modal test</h3>
				<div id="listDiv">
				
				</div>

              </div>
            </div>
            <div class="modal-footer" id="footer17">
              <a href="#" data-dismiss="modal" class="btn">Close</a>
              <a href="#" class="btn btn-primary">Complete</a>
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
				<div id="tempContactDiv">
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
              <div class="modal-body1" style="margin-top: 1.3%; margin-bottom: 38%;">
              
              <hr class="linee1" style="width: 1740px; text-align: left; margin:0 0 0 0;">
				<!-- 이력서 뜨는곳 -->

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
					리레키쇼다요~~
				
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
				<li><a data-toggle="modal" href="#myModal1">Search Person</a></li>
				<li><a data-toggle="modal" href="#myModal7">Operation</a></li>
				<li><a data-toggle="modal" href="#myModal9">Progress</a></li>
				<li><a data-toggle="modal" href="#myModal13">Favorites</a></li>
				<li><a href="#Counselling">Counselling</a></li>
			</ul>
		<button type="button" class="btn4 btn-danger pull-right" id="logout-btn">Logout</button> 
			</div>
	</nav>
<div class="contanier">
	<div id="qnaDiv" class="boardPerson col-lg-8"><!-- 게시판div -->
		<!-- 
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width:5%; text-align: center;">번호</th>				
					<th style="width:55%; text-align: center;">제목</th>				
					<th style="width:15%; text-align: center;">게시자</th>				
					<th style="width:15%; text-align: center;">등록일자</th>				
				</tr>
				</thead>
			<tbody>
					게시판 내용이 들어가는 곳
					아래는 예제에요 로직짜면서 지워주심 댑니다~
					<tr>
							<th style="width:5%; text-align: center;">1</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>
					
					<tr>
							<th style="width:5%; text-align: center;">2</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>
					
					<tr>
							<th style="width:5%; text-align: center;">3</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>
					
					<tr>
							<th style="width:5%; text-align: center;">4</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>
					
					<tr>
							<th style="width:5%; text-align: center;">5</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>
					
					<tr>
							<th style="width:5%; text-align: center;">6</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>
					
					<tr>
							<th style="width:5%; text-align: center;">7</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>
					
					<tr>
							<th style="width:5%; text-align: center;">8</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>
					
					<tr>
							<th style="width:5%; text-align: center;">9</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>			

					<tr>
							<th style="width:5%; text-align: center;">10</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>			

					<tr>
							<th style="width:5%; text-align: center;">11</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>			

					<tr>
							<th style="width:5%; text-align: center;">12</th>				
							<th style="width:55%; text-align: center;">취업질문드려요</th>				
							<th style="width:15%; text-align: center;">김방글</th>				
							<th style="width:15%; text-align: center;">2019-04-13</th>
					</tr>			
					예제끝
			</tbody>
			<tfoot>


			</tfoot>
		</table>
 -->	
	 </div>
	
	<!-- 0415 1:1채팅창 시작-->
	<div class="contanier">
	<div class="oneChatrom col-lg-4">
		<div class="chatbox" style="margin-top:; margin-left:38.2%;width:61%; height:348px; background-color: #B9E0F7; border-radius: 10px; " >
			<div class="chatfri"style="margin-top:0%; margin-left:-57%;width:56%; height:437px; background-color: white; border: 1px solid!important; border-color:#B9E0F7!important; border-radius: 10px">
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
							</tbody>
							<!-- 헤드헌터 목록 불러오는곳 끝 -->
							
							<tfoot>


							</tfoot>
				</table>
			</div>
			<div class="msg">
			<!-- 채팅글 뜨는곳 -->
			
			</div>
		</div>		
		<textarea class="chattextbox"rows="4" cols="50" style="margin-left: 38.2%; margin-top: 0.5%; border-radius: 10px; border-color:#B9E0F7!important; outline: none!important;" ></textarea>
	</div>
		<input type="button" class="btn btn-primary" id="" value="화상채팅" style="width: 4.7%; height:40px; text-align: center; margin-left:13% ; margin-top: 0.2%;">
		<input type="button" class="btn btn-primary" id="" value="게시글가기" style="width: 4.7%; height:40px; text-align: center; margin-left: ; margin-top: 0.2%;">
		<input type="button" class="btn btn-primary" id="" value="채팅하기" style="width: 4.7%; height:40px; text-align: center; margin-left: ; margin-top: 0.2%;">
		<input type="button" class="btn btn-primary" id="" value="메시지전송" style="width: 4.7%; height:40px; text-align: center; margin-left: ; margin-top: 0.2%;">
		
</div>
	
	<!-- 1:1 채팅창 종료 -->

</div>
<!-- 0415 추가 css 끝 -->

<br><br>

	<div class="writeclass col-lg-8">
		<input type="button" id="writeBoadr" class="btn btn-primary" value="글쓰기" style="float: right; margin-top: -2%;">
	</div>
	<br>
	<br>
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
</div>
	</body>

</html>

