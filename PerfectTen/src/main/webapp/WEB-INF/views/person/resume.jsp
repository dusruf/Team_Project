<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>		

</head>
<script>

var userid = '${sessionScope.personName}';

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
	
	totalButton+='<input type="button" class="addCareer" value="경력 추가아아아"><br>';
	totalButton+='<input type="button" class="addAbility" value="보유 기술 및 능력 추가아아아"><br>';
	totalButton+='<input type="button" class="addActivity" value="활동 추가아아아"><br>';
	totalButton+='<input type="button" class="addCerti" value="자격증 추가아아아"><br>';
	totalButton+='<input type="button" class="addLanguage" value="언어 점수 추가아아아"><br>';
	
	
	$("#buttonDiv").html(totalButton);
	
	$(".addCareer").on("click",addCareer);
	$(".addAbility").on("click",addAbility);
	$(".addActivity").on("click",addActivity);	
	$(".addCerti").on("click",addCerti);	
	$(".addLanguage").on("click", addLanguage);
	
	
}//function button


function addCareer(){
	
	career_cnt++;
	
	var careerContent="";

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
	careerContent+='<input type="button" class="deleteCareer" value="삭제">';
	careerContent+='</div>';
		
	$("#careerDiv").append(careerContent);

	
}//addCareer

function addLanguage(){
	
	language_cnt++;
	
	var languageContent="";

	languageContent+='<div class="languageDiv'+language_cnt+'">';	
	languageContent+='<hr>';
	languageContent+='언어 점수<br>';
	languageContent+='언어 : <input type="text" name="languageType"><br>';
	languageContent+='자격증 이름 : <input type="text" name="languageTitle"><br>';
	languageContent+='점수 : <input type="text" name="languageScore"><br>';
	languageContent+='취득 기관 : <input type="text" name="languageOrg"><br>';
	languageContent+='취득 일자 : <input type="date" name="languageDate"><br>';
	languageContent+='<input type="button" class="language-btn" value="언어 점수 추가" onclick="addLanguage()">';
	languageContent+='<input type="button" class="deleteLanguage" value="삭제">';
	languageContent+='</div>';
	
	$("#languageDiv").append(languageContent);
//	$(".language-btn").on("click",addLanguage);
	
	
}//addLanguage


function addCerti(){
	
	certi_cnt++;
	
	var certiContent="";
	
	certiContent+='<div class="certificateDiv'+certi_cnt+'">';	
	certiContent+='<hr>';
	certiContent+='자격증<br>';
	certiContent+='자격증 이름 : <input type="text" name="certiTitle"><br>';
	certiContent+='자격증 기관 : <input type="text" name="certiOrg"><br>';
	certiContent+='자격증 취득 날짜 : <input type="date" name="certiDate"><br>';
	certiContent+='<input type="button" class="certi-btn" value="자격증 추가" onclick="addCerti()">';
	certiContent+='<input type="button" class="deleteCerti" value="삭제">';
	certiContent+='</div>';
	
	$("#certificateDiv").append(certiContent);
//	$(".certi-btn").on("click",addCerti);	
	
}//add Certificate

function addActivity(){
	
	
	activity_cnt++;

//	alert("test"+activity_cnt);
	
	var activityContent='';
	activityContent+='<div class="activityDiv'+activity_cnt+'">';	
	activityContent+='<hr>';
	activityContent+='대외활동<br>';
	activityContent+='대외활동 이름 : <input type="text" name="activityTitle"><br>';
	activityContent+='대외활동 기관 : <input type="text" name="activityOrg"><br>';
	activityContent+='상세내용 : <input type="text" name="activityDetails"><br>';
	activityContent+='<input type="button" class="activity-btn" value="활동 추가" onclick="addActivity()">';
	activityContent+='<input type="button" class="deleteActivity" value="삭제">';
	activityContent+='</div>';
	
	$("#activityDiv").append(activityContent);
//	$(".activity-btn").on("click",addActivity);	
	
	
}//addActivity


function addAbility(){
	
	ability_cnt++;
	
	var abilityContent="";
	abilityContent+='<div class="abilityDiv'+ability_cnt+'">';	
	abilityContent+='<hr>';
	abilityContent+='보유 기술 및 능력<br>';
	abilityContent+='보유 능력 : <input type="text" name="abilityTitle"><br>';
	abilityContent+='수준 : <input type="text" name="abilityStatus"><br>';
	abilityContent+='상세내용 : <input type="text" name="abilityDetails"><br>';
	abilityContent+='<input type="button" class="ability-btn" value="경력 추가" onclick="addAbility"()>';
	abilityContent+='<input type="button" class="deleteAbility" value="삭제">';
	abilityContent+='</div>';
	
	$("#abilityDiv").append(abilityContent);
//	$(".ability-btn").on("click",addAbility);
	
}//function addAbility

</script>
<body>

이력서 페이지
<br>
<form action="insertResume" method="post">
<div id="totalDiv">
    
<div id="basicInfoDiv">

이름 : ${sessionScope.personName}<br>
생년월일 : <input type="date" name="birthDate" id="birthDate"><br>
성별 : <input type="text" name="gender" id="gender"><br>
이메일 : ${sessionScope.personEmail}<br>
전화번호 : <input type="text" name="personPhone" id="personPhone"><br>
주소 : <input type="text" name="personAddr" id="personAddr"><br>

</div>    

<div id="buttonDiv">
</div>    

<div id="careerDiv">
</div>
    
<div id="abilityDiv">
</div>

<div id="activityDiv">
</div>

<div id="certificateDiv">
</div>

<div id="languageDiv">
</div>

<hr>

<input type="submit" value="이력서 등록">
</div>
</form>
</body>
</html>