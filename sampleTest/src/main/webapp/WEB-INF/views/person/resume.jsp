<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
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

var userid = '${sessionScope.personName}';

var education_cnt=0;
var ability_cnt=0;
var activity_cnt=0;
var certi_cnt=0;
var language_cnt=0;
var career_cnt=0;

$(function(){
	
	init();
	
});


function init(){

	button();
	
	
}//function init

function button(){
	
	var totalButton="";
	
	totalButton+='<input type="button" class="addEducation" value="학력추가아아아아"><br>';
	totalButton+='<input type="button" class="addCareer" value="경력 추가아아아"><br>';
	totalButton+='<input type="button" class="addAbility" value="보유 기술 및 능력 추가아아아"><br>';
	totalButton+='<input type="button" class="addActivity" value="활동 추가아아아"><br>';
	totalButton+='<input type="button" class="addCerti" value="자격증 추가아아아"><br>';
	totalButton+='<input type="button" class="addLanguage" value="언어 점수 추가아아아"><br>';
	
	
	$("#buttonDiv").html(totalButton);
	
	$(".addEducation").on("click",addEducation);
	$(".addCareer").on("click",addCareer);
	$(".addAbility").on("click",addAbility);
	$(".addActivity").on("click",addActivity);	
	$(".addCerti").on("click",addCerti);	
	$(".addLanguage").on("click", addLanguage);
	
	
}//function button

function showEdu1(){
	
	var data="";
	data+='<br>';
	data+='<input type="hidden" name="educationFlag" value="1">';
	data+='학교명 : <input type="text" name="schoolName"><br>';
	data+='전공 계열 : <input type="text" name="major"><br>';
	data+='재학기간 : <input type="date" name="eduStartDate">~';
	data+='<input type="date" name="eduEndDate"><br>';	
	data+='<input type="button" id="addEdu1" value="＋학력추가" style="margin-left: 37.6%;">';
//	data+='<input type="button" id="test" value="test">';b 
	 
	$("#educationDiv").html(data);
	$("#addEdu1").on("click",edu1);
	
}


function showEdu2(){
	
	var data="";
	data+='<br>';
	data+='<input type="hidden" name="educationFlag" value="2">';
	data+='학교명 : <input type="text" name="schoolName"><br>';
	data+='전공 : <input type="text" name="major"><br>';
	data+='재학기간 : <input type="date" name="eduStartDate">~';
	data+='<input type="date" name="eduEndDate"><br>';	
	data+='<input type="button" id="addEdu2" value="＋학력추가" style="margin-left: 37.6%;">';
//	data+='<input type="button" id="addEdu'+2+' value="+학력추가">';
	
	$("#educationDiv").html(data);
	$("#addEdu2").on("click",edu2);

}

function showEdu3(){
	
	var data="";
	data+='<br>';
	data+='<input type="hidden" name="educationFlag" value="3">';
	data+='학교명 : <input type="text" name="schoolName"><br>';
	data+='전공 : <input type="text" name="major"><br>';
	data+='재학기간 : <input type="date" name="eduStartDate">~';
	data+='<input type="date" name="eduEndDate"><br>';	
//	data+='<input type="button" value="+학력 추가">';
	data+='<input type="button" id="addEdu3" value="＋학력추가" style="margin-left: 37.6%;">';
	
	$("#educationDiv").html(data);
	$("#addEdu3").on("click",edu3);
	
}

function showEdu4(){

	var data="";
	
//	data+='(이게 붙는게 맞나)';
	data+='<br>';
	data+='<input type="hidden" name="educationFlag" value="4">';
	data+='학교명 : <input type="text" name="schoolName"><br>';
	data+='전공 : <input type="text" name="major"><br>';
	data+='학위 :<select name="diploma">';
	data+='<option value="석사">석사</option>';
	data+='<option value="석박사">석박사</option>';
	data+='<option value="박사">박사</option></select><br>';
	data+='재학기간 : <input type="date" name="eduStartDate">~';
	data+='<input type="date" name="eduEndDate"><br>';	
	data+='<input type="button" id="addEdu4" value="＋학력추가" style="margin-left: 37.6%;">';
	
	$("#educationDiv").html(data);
	$("#addEdu4").on("click",edu4);

}

//var edu1_cnt=0;

function edu1(){
		
	var data="";
	
	education_cnt++;
	
	data+='<div id="eduDiv'+education_cnt+'">';
	data+='<br>';
	data+='<input type="hidden" name="educationFlag" value="1">';
	data+='학교명 : <input type="text" name="schoolName"><br>';
	data+='전공 계열 : <input type="text" name="major"><br>';
	data+='재학기간 : <input type="date" name="eduStartDate">~';
	data+='<input type="date" name="eduEndDate"><br>';	
	data+='<input type="button" class="deleteEdu1" del_value="eduDiv'+education_cnt+'" value="삭제">';
	data+='</div>';
	
	$("#educationDiv").append(data);
	$(".deleteEdu1").on("click",deleteDiv);

//	activityContent+='<input type="button" id="abilityty" del_value="activityDiv'+activity_cnt+'" class="deleteActivity" value="대외활동삭제">';

	
}

function edu2(){

	var data="";

	education_cnt++;
	
	data+='<div id="eduDiv'+education_cnt+'">';
	data+='<br>';
	data+='<input type="hidden" name="educationFlag" value="2">';
	data+='학교명 : <input type="text" name="schoolName"><br>';
	data+='전공 : <input type="text" name="major"><br>';
	data+='재학기간 : <input type="date" name="eduStartDate">~';
	data+='<input type="date" name="eduEndDate"><br>';	
	data+='<input type="button" id="deleteEdu1" value="삭제">';

	data+='</div>';
	
	$("#educationDiv").append(data);
	
}

function edu3(){
	
	var data="";

	education_cnt++;
	
	data+='<div id="eduDiv'+education_cnt+'">';
	data+='<br>';
	data+='<input type="hidden" name="educationFlag" value="3">';
	data+='학교명 : <input type="text" name="schoolName"><br>';
	data+='전공 : <input type="text" name="major"><br>';
	data+='재학기간 : <input type="date" name="eduStartDate">~';
	data+='<input type="date" name="eduEndDate"><br>';	
	data+='<input type="button" id="deleteEdu1" value="삭제">';

	data+='</div>';
	
	$("#educationDiv").append(data);
	
}

function edu4(){
	
	var data="";

	education_cnt++;
	
	data+='<div id="eduDiv'+education_cnt+'">';
	data+='<br>';
	data+='<input type="hidden" name="educationFlag" value="4">';
	data+='학교명 : <input type="text" name="schoolName"><br>';
	data+='전공 : <input type="text" name="major"><br>';
	data+='학위 :<select name="diploma">';
	data+='<option value="석사">석사</option>';
	data+='<option value="석박사">석박사</option>';
	data+='<option value="박사">박사</option></select><br>';
	data+='재학기간 : <input type="date" name="eduStartDate">~';
	data+='<input type="date" name="eduEndDate"><br>';	
	data+='<input type="button" id="deleteEdu1" value="삭제">';

	data+='</div>';
	
	$("#educationDiv").append(data);
	
}

function addEducation(){
	
	education_cnt++;
	
	var educationContent="";
	
	educationContent+='<div class="resumeArea">';
	educationContent+='<h2 class="title" style="text-align: left; margin-left: 1%; margin-top: 4%;">학력정보</h2>';
	educationContent+='</div>';
	educationContent+='<div class="education">';
	educationContent+='<h3 class="crres" style="margin-left: -12.5%;">최종학력선택 </h3>';
	
	educationContent+='<input type="button" id="edu1" class="btn btn-info" value="고등학교졸업">';
	educationContent+='<input type="button" id="edu2" class="btn btn-info" value="전문대학졸업">';
	educationContent+='<input type="button" id="edu3" class="btn btn-info" value="대학교졸업">';
	educationContent+='<input type="button" id="edu4" class="btn btn-info" value="대학원졸업">';
	educationContent+='</div>';
	educationContent+='<div id="educationDiv"></div>';
 
	$("#eduInfoDiv").html(educationContent);
	
	$("#edu1").on("click", showEdu1);
	$("#edu2").on("click", showEdu2);
	$("#edu3").on("click", showEdu3);
	$("#edu4").on("click", showEdu4);
	
	/*
	educationContent+='<br>학력 정보<table border="1"><tr>';
	educationContent+='<td class="edu1">고등학교 졸업</td><td class="edu2">전문대학 졸업</td><td class="edu3">대학교 졸업</td><td class="edu4">대학원 졸업</td>';
	educationContent+='</tr><tr><td colspan="4"><div class="realEduDiv"></div></td></tr>';
	educationContent+='</table>';
	educationContent+='<input type="button" class="education-btn" value="학력 추가" onclick="addEducation()">';
	educationContent+='<input type="button" class="deleteEducation" value="삭제">';
		
	$("#educationDiv").append(educationContent);
	$(".edu1").on("click", edu1);
	$(".edu2").on("click", edu2);
	$(".edu3").on("click", edu3);
	$(".edu4").on("click", edu4);
*/
}

//0414 경력백

function addCareer(){
	
	career_cnt++;
	
	var careerContent="";
	
	careerContent+='<div class="careerDiv'+career_cnt+'">';	
	careerContent+='<div class="resumeArea">';
	careerContent+='<h2 class="title" style="text-align: left; margin-left: 1%; margin-top: 4%;">경력정보</h2></div>'; 
	careerContent+='<div class="career">';
	careerContent+='<h3 class="crres">회사명 </h3><input type="text" class="form-control" id="careerName" name="companyName" value="" placeholder="회사명을 입력하세요."><br>';
	careerContent+='<h3 class="crres">분야 </h3><input type="text" class="form-control" id="careerName" name="careerCategory" value="" placeholder="분야를 입력하세요."><br>';
	careerContent+='<h3 class="crres">시작일 </h3><input type="date" class="form-control" id="careerName" name="careerStartDate" value=""><br>';
	careerContent+='<h3 class="crres">종료일 </h3><input type="date" class="form-control" id="careerName" name="careerEndDate" value=""><br>';
	careerContent+='<h3 class="crres">부서</h3><input type="text" class="form-control" id="careerName" name="careerDepartment" value="" placeholder="부서를 입력하세요."><br>';
	careerContent+='<h3 class="crres">직책</h3><input type="text" class="form-control" id="careerName" name="careerPosition" value="" placeholder="직책을 입력하세요."><br>';
	careerContent+='<h3 class="crres">지역</h3><input type="text" class="form-control" id="careerName" name="careerRegion" value="" placeholder="근무지역을 입력하세요."><br>';
	careerContent+='<h3 class="crres">연봉</h3><input type="text" class="form-control" id="careerName" name="careerSalary" value="" placeholder="연봉을 입력하세요."><br>';
	careerContent+='<h3 class="crres">담당업무 </h3>';
	careerContent+='<textarea class="form-control col-sm-5" name="careerTask" rows="4" style="margin-left:3.7%; max-width:100%; width:30%; margin-top: 0.2%;" placeholder="업종을 입력하세요."></textarea>';
	careerContent+='<br><br><br><br><br>';
	careerContent+='<h3 class="crres" style="margin-top: 1%;">특이사항</h3>';
	careerContent+='<textarea class="form-control col-sm-5" name="careerDetails" rows="4" style="margin-left:3.7%; max-width:100%; width:30%; margin-top: 1%;" placeholder="특이사항을 입력하세요."></textarea>';
	careerContent+='</div><br><br><br><br><br><br><br>';
	careerContent+='<div class="plus22">';
	careerContent+='<input type="button" id="addrerere" class="btn btn-info" value="＋경력추가" onclick="addCareer()" style="margin-left: 40.5%;">';
	careerContent+='<input type="button" id="addrerere" class="deleteCareer" del_value="careerDiv'+career_cnt+'" value="경력삭제">';
	careerContent+='</div>';
	careerContent+='</div>';

	$("#careerDiv").append(careerContent);
	$(".deleteCareer").on("click",deleteDiv);

	/*
	careerContent+='<div class="careerDiv'+career_cnt+'">';	
	careerContent+='<hr>';
	careerContent+='경력<br>';
	careerContent+='직장 이름 : <input type="text" name="companyName"><br>';
	careerContent+='분류 : <input type="text" name="careerCategory"><br>';
	careerContent+='시작일 : <input type="date" name="careerStartDate"><br>';
	careerContent+='퇴사일 : <input type="date" name="careerEndDate"><br>';
	careerContent+='부서 : <input type="text" name="careerDepartment"><br>';
	careerContent+='직책 : <input type="text" name="careerPosition"><br>';
	careerContent+='근무 지역 : <input type="text" name="careerRegion"><br>';
	careerContent+='연봉 : <input type="number" name="careerSalary"><br>';
	careerContent+='업무 내용 : <input type="text" name="careerTask"><br>';
	careerContent+='비고 : <input type="text" name="careerDetails"><br>';

	careerContent+='<input type="button" class="career-btn" value="경력 추가" onclick="addCareer()">';
	careerContent+='<input type="button" del-value="careerDiv'+career_cnt+'" class="deleteCareer" value="삭제">';
	careerContent+='</div>';
		
	*/
	
	
}//addCareer

function deleteDiv(){
	var del_value = $(this).attr("del_value");
	
//	alert(del_value);
	
	$("." + del_value).remove();
}

function addActivity(){
	
	activity_cnt++;
	var activityContent='';

	activityContent+='<div class="activityDiv'+activity_cnt+'">';	
	activityContent+='<div class="resumeArea">';
	activityContent+='<h2 class="title" style="text-align: left; margin-left: 1%; margin-top: 4%;">대외활동</h2></div>';
	activityContent+='<div class="activity1">';
	activityContent+='<h3 class="crres">대외활동 </h3><input type="text" name="activityTitle" class="form-control" id="activityty" value="" placeholder="대외활동을 입력하세요."><br>';
	activityContent+='<h3 class="crres">대외활동기관 </h3><input type="text" name="activityOrg" class="form-control" id="activityty" value="" placeholder="대외활동기관을 입력하세요."><br>';
	activityContent+='<h3 class="crres" style="margin-top: 1%;">특이사항</h3>';
	activityContent+='<textarea class="form-control name="activityDetails" col-sm-5" rows="4" style="margin-left:3.7%; max-width:100%; width:30%; margin-top: 1%;" placeholder="특이사항을 입력하세요."></textarea>';
	activityContent+='<br><br><br><br><br><br><br>';
	activityContent+='<div class="plus22">';
	activityContent+='<input type="button" id="abilityty" del_value="activityDiv'+activity_cnt+'" class="deleteActivity" value="대외활동삭제">';
	activityContent+='</div></div>';
	activityContent+='</div>';

	/* 
	activityContent+='<div class="activityDiv'+activity_cnt+'">';	
	activityContent+='<hr>';
	activityContent+='대외활동<br>';
	activityContent+='대외활동 : <input type="text" name="activityTitle"><br>';
	activityContent+='대외활동 기관 : <input type="text" name="activityOrg"><br>';
	activityContent+='상세내용 : <input type="text" name="activityDetails"><br>';
	activityContent+='<input type="button" class="activity-btn" value="활동 추가" onclick="addActivity()">';
	activityContent+='<input type="button" class="deleteActivity" value="삭제">';
	activityContent+='</div>';
	
 	*/	
 
 	$("#activityDiv").append(activityContent);
	$(".deleteActivity").on("click",deleteDiv);

//	$(".activity-btn").on("click",addActivity);	
	
	
}//addActivity

//0414 언어백

function addLanguage(){
	
	language_cnt++;
	
	var languageContent="";

		languageContent+='<div class="languageDiv'+language_cnt+'">';	
		languageContent+='<div class="resumeArea">';
		languageContent+='<h2 class="title" style="text-align: left; margin-left: 1%; margin-top: 4%;">언어 점수</h2>';
		languageContent+='</div>';
		languageContent+='<div class="language1">';
		languageContent+='<h3 class="crres">언어종류 </h3><input type="text" name="languageType" class="form-control" id="languagege" value="" placeholder="클릭해서 선택하세요."><br>';
		languageContent+='<h3 class="crres">자격증 </h3><input type="text"  name="languageTitle" class="form-control" id="languagege" value="" placeholder="클릭해서 선택하세요."><br>';
		languageContent+='<h3 class="crres">점수 </h3><input type="text" name="languageScore" class="form-control" id="languagege" value="" placeholder="점수를 입력하세요."><br>';
		languageContent+='<h3 class="crres">취득일자 </h3><input type="date" name="languageDate" class="form-control" id="languagege" value=""><br>';
		languageContent+='<h3 class="crres">발급기관 </h3><input type="text"  name="languageOrg" class="form-control" id="languagege" value="" placeholder="발급기관을 입력하세요."><br>';
		languageContent+='<h3 class="crres" style="margin-top: 1%;">특이사항</h3>';
		languageContent+='<textarea class="form-control col-sm-5" rows="4" style="margin-left:3.7%; max-width:100%; width:30%; margin-top: 1%;" placeholder="특이사항을 입력하세요."></textarea>';
		languageContent+='<br><br><br><br><br><br><br>';
		languageContent+='<div class="plus22">';
		languageContent+='<input type="button" id="abilityty" class="btn btn-info" value="＋언어점수추가" onclick="addLanguage()" style="margin-left: 37.6%;">';
		languageContent+='<input type="button" id="abilityty" class="deleteLanguageScore" del_value="languageDiv'+language_cnt+'" value="언어점수삭제"></div>';
		languageContent+='</div>';
		
		$("#languageDiv").append(languageContent);
		$(".deleteLanguageScore").on("click",deleteDiv);

		
	/*
	languageContent+='<div class="languageDiv'+language_cnt+'">';	
	languageContent+='<hr>';
	languageContent+='언어 점수<br>';
	languageContent+='언어 : <input type="text" name="languageType"><br>';
	languageContent+='자격증 : <input type="text" name="languageTitle"><br>';
	languageContent+='점수 : <input type="text" name="languageScore"><br>';
	languageContent+='취득 기관 : <input type="text" name="languageOrg"><br>';
	languageContent+='취득 일자 : <input type="date" name="languageDate"><br>';
	languageContent+='<input type="button" class="language-btn" value="언어 점수 추가" onclick="addLanguage()">';
	languageContent+='<input type="button" class="deleteLanguage" value="삭제">';
	languageContent+='</div>';
	*/
	
//	$(".language-btn").on("click",addLanguage);
	
	
}//addLanguage

//0414 자격증백

function addCerti(){
	
	certi_cnt++;
	
	var certiContent="";

	certiContent+='<div class="certificateDiv'+certi_cnt+'">';	
	certiContent+='<div class="resumeArea">';
	certiContent+='<h2 class="title" style="text-align: left; margin-left: 1%; margin-top: 4%;">자격증</h2>';
	certiContent+='</div>';
	certiContent+='<div class="certificate1">';
	certiContent+='<h3 class="crres">보유자격증 </h3><input type="text" name="certiTitle" class="form-control" id="certificatete" value="" placeholder="클릭해서 선택하세요."><br>';
	certiContent+='<h3 class="crres">발급기관 </h3><input type="text" name="certiOrg" class="form-control" id="certificatete" value="" placeholder="발급기관을 입력하세요."><br>';
	certiContent+='<h3 class="crres">취득일자 </h3><input type="date" name="certiDate" class="form-control" id="certificatete" value=""><br>';

//	certiContent+='<h3 class="crres" style="margin-top: 1%;">특이사항</h3>';
//	certiContent+='<textarea class="form-control col-sm-5" rows="4" style="margin-left:3.7%; max-width:100%; width:30%; margin-top: 1%;" placeholder="특이사항을 입력하세요."></textarea>';
	certiContent+='<br><br><br><br><br><br><br>';
	certiContent+='<div class="plus22">';
	certiContent+='<input type="button" id="abilityty" class="btn btn-info" value="＋자격증추가" onclick="addCerti()" style="margin-left: 39%;">';
	certiContent+='<input type="button" id="abilityty" class="deleteCerti" del_value="certificateDiv'+certi_cnt+'" value="자격증삭제">';
	certiContent+='</div>';
	certiContent+='</div>';
	
 	$("#certificateDiv").append(certiContent);
	$(".deleteCerti").on("click",deleteDiv);



		
/* 	
	certiContent+='<div class="certificateDiv'+certi_cnt+'">';	
	certiContent+='<hr>';
	certiContent+='자격증<br>';
	certiContent+='자격증 : <input type="text" name="certiTitle"><br>';
	certiContent+='발급 기관 : <input type="text" name="certiOrg"><br>';
	certiContent+='자격증 취득 날짜 : <input type="date" name="certiDate"><br>';
	certiContent+='<input type="button" class="certi-btn" value="자격증 추가" onclick="addCerti()">';
	certiContent+='<input type="button" class="deleteCerti" value="삭제">';
	certiContent+='</div>';
	
 */
 
//	$(".certi-btn").on("click",addCerti);	
	
}//add Certificate

//0414 활동백


//0414 기술백

function addAbility(){
	
	ability_cnt++;
	
	var abilityContent="";
	
	abilityContent+='<div class="abilityDiv'+ability_cnt+'">';		
	abilityContent+='<div class="resumeArea">';
	abilityContent+='<h2 class="title" style="text-align: left; margin-left: 1%; margin-top: 4%;">보유기술 및 능력</h2></div>';
	abilityContent+='<div class="ability1">';
	abilityContent+='<h3 class="crres">보유기술 </h3><input type="text" name="abilityTitle" class="form-control" id="abilitytitle" value="" placeholder="보유기술을 입력하세요."><br>';
	abilityContent+='<h3 class="crres">수준 </h3><input type="text" name="abilityStatus" class="form-control" id="careerName" value="" placeholder="사용능력을 입력하세요."><br>';
	abilityContent+='<h3 class="crres" style="margin-top: 1%;">특이사항</h3>';
	abilityContent+='<textarea name="abilityDetails" class="form-control col-sm-5" rows="4" style="margin-left:3.7%; max-width:100%; width:30%; margin-top: 1%;" placeholder="특이사항을 입력하세요."></textarea>';
	abilityContent+='<br><br><br><br><br><br><br>';
	abilityContent+='<div class="plus22">';
	abilityContent+='<input type="button" id="abilityty" class="btn btn-info" value="＋보유기술추가" onclick="addAbility()" style="margin-left: 37.6%;">';
	abilityContent+='<input type="button" id="abilityty" class="deleteAbility" del_value="abilityDiv'+ability_cnt+'" value="보유기술삭제">';
	abilityContent+='</div></div>';
	abilityContent+='</div>';

	$("#abilityDiv").append(abilityContent);
	$(".deleteAbility").on("click",deleteDiv);

	
/* 	
	abilityContent+='<div class="abilityDiv'+ability_cnt+'">';	
	abilityContent+='<hr>';
	abilityContent+='보유 기술 및 능력<br>';
	abilityContent+='보유 능력 : <input type="text" name="abilityTitle"><br>';
	abilityContent+='수준 : <input type="text" name="abilityStatus"><br>';
	abilityContent+='상세내용 : <input type="text" name="abilityDetails"><br>';
	abilityContent+='<input type="button" class="ability-btn" value="경력 추가" onclick="addAbility"()>';
	abilityContent+='<input type="button" class="deleteAbility" value="삭제">';
	abilityContent+='</div>';
	activityContent+='<input type="button" class="deleteActivity" value="삭제">';

	
	$("#abilityDiv").append(abilityContent);
	$(".deleteCareer").on("click",deleteCareer);
	 */
//	$(".ability-btn").on("click",addAbility);
	
}//function addAbility


</script>
<body>

<header class="header3" id="header3" style="z-index: 1050;">
		<!--header-start-->
		<div class="container">
		
		</div>
	</header>
<form action="insertResume" method="post">
<div class="formDiv" style="z-index: 1050;">
	<div id="totalDiv">
	    <div id="basicInfoDiv" style="border: 2px 2px 2px 2px;"><br>
	    	<div class="resumeArea">
	    		<h2 class="title" style="text-align: left; margin-left: 1%;">기본정보</h2>
	    	</div>
	    <h3 class="crres">이름 </h3><input type="text" class="form-control" id="resName" name="personName" value="${sessionScope.personName}" placeholder="이름을 입력하세요."><br>
	    <h3 class="crres">생년월일</h3><input type="date" class="form-control" id="resDate" name="birthDate" value=""><br>
	   
	   <!-- 성별설정 스타트-->
	    <h3 class="crres">성별</h3> 
	    	<div class="mafmale">
			  <label class="btn btn-info">
			   	 <input type="radio" name="gender" id="selbtn" value="M" autocomplete="off">Male</label>
			   <label class="btn btn-info">
			   	 <input type="radio" name="gender" id="selbtn" value="F" autocomplete="off">Female</label>
				</div>
		 <!-- 성별설정 종료-->
		<br>
		<h3 class="crres">이메일 </h3><input type="text" class="form-control" id="resName" name="personEmail" value="${sessionScope.personEmail}" placeholder="이메일을 입력하세요."><br>
		<h3 class="crres">전화번호 </h3><input type="text" class="form-control" id="personPhone" name="personPhone" value="" placeholder="전화번호를 입력하세요."><br>
		<h3 class="crres">주소 </h3><input type="text" class="form-control" id="personAddr" name="personAddr" value="" placeholder="주소를 입력하세요."><br> 
					</div><!-- basicInfoDiv -->
		
			<div id="buttonDiv"></div>
		
		<div id="totalEduDiv">
		<div id="eduInfoDiv"></div>
	
		<input type="hidden" name="updateFlag" value="0">
		
			<!-- 학력정보 스타트-->
			<!-- 
				<div class="resumeArea">
	    			<h2 class="title" style="text-align: left; margin-left: 1%; margin-top: 4%;">학력정보</h2>
	    		</div>
			<div class="education">
					 <h3 class="crres" style="margin-left: -12.5%;">최종학력선택 </h3>
				<label class="btn btn-info">
				   	 <input type="radio" name="education1" id="h" value="" autocomplete="off">고등학교졸업</label>
				<label class="btn btn-info">
				   	 <input type="radio" name="education1" id="su" value="" autocomplete="off">전문대학졸업</label>
				<label class="btn btn-info">
				   	 <input type="radio" name="education1" id="u" value="" autocomplete="off">대학교졸업</label>
				<label class="btn btn-info">
				   	 <input type="radio" name="education1" id="u2" value="" autocomplete="off">대학원졸업</label>
				</div>
			 -->
			<!-- 학력정보 종료-->
			
			<!-- 경력정보 -->
			<!-- 190414 경력프 -->
			<div id="careerDiv"></div>
			<!-- 
				<div class="resumeArea">
	    			<h2 class="title" style="text-align: left; margin-left: 1%; margin-top: 4%;">경력정보</h2>
	    		</div>
			<div class="career">
				<h3 class="crres">회사명 </h3><input type="text" class="form-control" id="careerName" value="" placeholder="회사명을 입력하세요."><br>
				<h3 class="crres">분야 </h3><input type="text" class="form-control" id="careerName" value="" placeholder="분야를 입력하세요."><br>
				<h3 class="crres">시작일 </h3><input type="date" class="form-control" id="careerName" value=""><br>
				<h3 class="crres">종료일 </h3><input type="date" class="form-control" id="careerName" value=""><br>
				<h3 class="crres">부서</h3><input type="text" class="form-control" id="careerName" value="" placeholder="부서를 입력하세요."><br>
				<h3 class="crres">직책</h3><input type="text" class="form-control" id="careerName" value="" placeholder="직책을 입력하세요."><br>
				<h3 class="crres">지역</h3><input type="text" class="form-control" id="careerName" value="" placeholder="근무지역을 입력하세요."><br>
				<h3 class="crres">연봉</h3><input type="text" class="form-control" id="careerName" value="" placeholder="연봉을 입력하세요."><br>
				<h3 class="crres">담당업무 </h3>
				<textarea class="form-control col-sm-5" rows="4" style="margin-left:3.7%; max-width:100%; width:30%; margin-top: 0.2%;" placeholder="담당업무를 입력하세요."></textarea>
				<br>
				<br>
				<br>
				<br>
				<br>
			<h3 class="crres" style="margin-top: 1%;">특이사항</h3>
				<textarea class="form-control col-sm-5" rows="4" style="margin-left:3.7%; max-width:100%; width:30%; margin-top: 1%;" placeholder="특이사항을 입력하세요."></textarea>
				</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<div class="plus22">
				<input type="button" id="addrerere" class="addCareer" value="＋경력추가" style="margin-left: 40.5%;">
				<input type="button" id="addrerere" class="btn btn-info" value="경력삭제">
				</div>
				
				 -->
			<!-- 경력정보 종료 -->
			
			<!-- 0414 기술프-->
			    <div id="abilityDiv"></div>
			
			<!-- 보유기술 스타트-->
			<!-- 
				<div class="resumeArea">
	    			<h2 class="title" style="text-align: left; margin-left: 1%; margin-top: 4%;">보유기술</h2>
	    		</div>
			<div class="ability1">
				<h3 class="crres">보유기술 </h3><input type="text" class="form-control" id="abilitytitle" value="" placeholder="보유기술을 입력하세요."><br>
				<h3 class="crres">수준 </h3><input type="text" class="form-control" id="careerName" value="" placeholder="사용능력을 입력하세요."><br>
			<h3 class="crres" style="margin-top: 1%;">특이사항</h3>
				<textarea class="form-control col-sm-5" rows="4" style="margin-left:3.7%; max-width:100%; width:30%; margin-top: 1%;" placeholder="특이사항을 입력하세요."></textarea>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
			<div class="plus22">
				<input type="button" id="abilityty" class="btn btn-info" value="＋보유기술추가" style="margin-left: 37.6%;">
				<input type="button" id="abilityty" class="btn btn-info" value="보유기술삭제">
				</div>
			</div>
			 -->
			<!-- 보유기술 종료-->
			
			<!-- 0414 활동프 -->
			
			<div id="activityDiv"></div>
			
			<!-- 대외황동 스타트-->
			<!-- 
				<div class="resumeArea">
	    			<h2 class="title" style="text-align: left; margin-left: 1%; margin-top: 4%;">대외활동</h2>
	    		</div>
			<div class="activity1">
				<h3 class="crres">대외활동 </h3><input type="text" class="form-control" id="activityty" value="" placeholder="대외활동을 입력하세요."><br>
				<h3 class="crres">대외활동기관 </h3><input type="text" class="form-control" id="activityty" value="" placeholder="대외활동기관을 입력하세요."><br>
			<h3 class="crres" style="margin-top: 1%;">특이사항</h3>
				<textarea class="form-control col-sm-5" rows="4" style="margin-left:3.7%; max-width:100%; width:30%; margin-top: 1%;" placeholder="특이사항을 입력하세요."></textarea>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
			<div class="plus22">
				<input type="button" id="abilityty" class="btn btn-info" value="＋대외활동추가" style="margin-left: 37.6%;">
				<input type="button" id="abilityty" class="btn btn-info" value="대외활동삭제">
			</div>
			</div>
			 -->
				<!-- 대외황동 종료-->
			
		
			
			<!-- 0414 자격증프 -->
			<div id="certificateDiv"></div>
			<!-- 자격증 스타트-->
			<!-- 
				<div class="resumeArea">
	    			<h2 class="title" style="text-align: left; margin-left: 1%; margin-top: 4%;">자격증</h2>
	    		</div>
			<div class="certificate1">
				<h3 class="crres">보유자격증 </h3><input type="text" class="form-control" id="certificatete" value="" placeholder="클릭해서 선택하세요."><br>
				<h3 class="crres">발급기관 </h3><input type="text" class="form-control" id="certificatete" value="" placeholder="발급기관을 입력하세요."><br>
			<h3 class="crres" style="margin-top: 1%;">특이사항</h3>
				<textarea class="form-control col-sm-5" rows="4" style="margin-left:3.7%; max-width:100%; width:30%; margin-top: 1%;" placeholder="특이사항을 입력하세요."></textarea>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
			<div class="plus22">
				<input type="button" id="abilityty" class="btn btn-info" value="＋자격증추가" style="margin-left: 39%;">
				<input type="button" id="abilityty" class="btn btn-info" value="자격증삭제">
			</div>
			 -->
				<!-- 자격증 종료-->
			
			<!-- 0414 언어프 -->
			<div id="languageDiv"></div>
			<!-- 보유언어 스타트-->
			<!-- 
				<div class="resumeArea">
	    			<h2 class="title" style="text-align: left; margin-left: 1%; margin-top: 4%;">언어 점수</h2>
	    		</div>
			<div class="language1">
				<h3 class="crres">언어종류 </h3><input type="text" class="form-control" id="languagege" value="" placeholder="클릭해서 선택하세요."><br>
				<h3 class="crres">자격증 </h3><input type="text" class="form-control" id="languagege" value="" placeholder="클릭해서 선택하세요."><br>
				<h3 class="crres">점수 </h3><input type="text" class="form-control" id="languagege" value="" placeholder="점수를 입력하세요."><br>
				<h3 class="crres">취득일자 </h3><input type="date" class="form-control" id="languagege" value=""><br>
				<h3 class="crres">발급기관 </h3><input type="text" class="form-control" id="languagege" value="" placeholder="발급기관을 입력하세요."><br>
			<h3 class="crres" style="margin-top: 1%;">특이사항</h3>
				<textarea class="form-control col-sm-5" rows="4" style="margin-left:3.7%; max-width:100%; width:30%; margin-top: 1%;" placeholder="특이사항을 입력하세요."></textarea>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
			<div class="plus22">
				<input type="button" id="abilityty" class="btn btn-info" value="＋언어점수추가" style="margin-left: 37.6%;">
				<input type="button" id="abilityty" class="btn btn-info" value="언어점수삭제">
			</div>
			 -->
				<!-- 보유언어 종료-->
		 </div><!-- totalDiv -->
		 	
		 </div><!-- formDiv -->
		<div class="plus22">
				<input type="submit" id="abilityty" class="btn btn-info" value="이력서등록" style="margin-left: 37.6%; margin-top: 10%;">
			</div>
    
			 </form>
	
	<!-- 	
		 </div>
	</div> 
	 -->
	 
			
 <%--    
    
<div id="basicInfoDiv">
 
기본 정보
이름 : ${sessionScope.personName}<br>
생년월일 : <input type="date" name="birthDate" id="birthDate"><br>
성별 : <input type="text" name="gender" id="gender"><br>
이메일 : ${sessionScope.personEmail}<br>
전화번호 : <input type="text" name="personPhone" id="personPhone"><br>
주소 : <input type="text" name="personAddr" id="personAddr"><br>

</div>    
 --%>
 
  

<hr>

<input type="submit" value="이력서 등록">

</body>
</html>