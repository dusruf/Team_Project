<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<body>
<header class="header3" id="header3">
		<!--header-start-->
		<div class="container">
		</div>
	</header>


<div class="col-lg-3"></div>
<form action="insertResume" method="post">
<div class="col-lg-6">
<div id="mainDiv">

<div id="biDiv">
<input type="hidden" id="resumeSeq" name="resumeSeq" value="${totalResume.resumeSeq}">
<h3 class="crres" style="margin-left: 2%;">이름 : ${sessionScope.personName}</h3><br><br>
<input type="hidden" id="personName" name="personName" value="${totalResume.personName}"><br><br>
<h3 class="crres" style="margin-left: 2%;">생년월일  </h3><input type="date" class="form-control" id="birthDate" name="birthDate" style="margin-left:30%;" value="${totalResume.birthDate}"><br><br>
<h3 class="crres" style="margin-left: 2%;">성별 </h3> <input type="text" class="form-control" id="gender" name="gender" style="margin-left:30%;" value="${totalResume.gender}"><br><br>
<h3 class="crres" style="margin-left: 2%;">이메일 :${sessionScope.personEmail}</h3><br>
<input type="hidden" id="personEmail" name="personEmail" value="${totalResume.personEmail}"><br><br>

<h3 class="crres" style="margin-left: 2%; margin-top: 0.8%;">전화번호</h3><input type="text" class="form-control" style="margin-left:30%; margin-top: 0.8%;" id="personPhone" name="personPhone" value="${totalResume.personPhone}"><br>
<h3 class="crres" style="margin-left: 2%; margin-top: 0.8%;">주소</h3><input type="text"  class="form-control" style="margin-left:30%; margin-top: 0.8%;" id="personAddr" name="personAddr" value="${totalResume.personAddr}"><br>
<hr>

</div>


<div id="educationDiv"> <!-- 0421 테이블 삭제하고 인풋으로 바꿈 -->

<h3 class="crres" style="margin-left: 2%;">학력사항</h3><br><br><br>

<c:forEach var="education" items="${educationList}">
	
	<h3 class="crres" style="margin-left: 2%;">학교</h3><input type="text" class="form-control" style="margin-left:30%;" id="schoolName" name="schoolName" value="${education.schoolName}"><br><br>

	<h3 class="crres" style="margin-left: 2%;">전공</h3><input type="text" class="form-control" style="margin-left:30%;" id="major" name="major"  value="${education.major}"><br><br>
	
	<c:if test="${education.diploma ne '0'}">
	
	
	 학위<input type="text" id="diploma" name="diploma"  value="${education.diploma}">	 
	
	
	</c:if>
	
	
	<h3 class="crres" style="margin-left: 2%;">입학일</h3><input type="date" class="form-control" style="margin-left:30%;" id="eduStartDate" name="eduStartDate"  value="${education.eduStartDate}"><br><br>

	<h3 class="crres" style="margin-left: 2%;">졸업일</h3><input type="date" class="form-control" style="margin-left:30%;" id="eduEndDate" name="eduEndDate"  value="${education.eduEndDate}"><br><br>
		
	<input type="hidden" name="educationFlag" value="${education.educationFlag}">
	
		
	<c:if test="${education.diploma eq '0'}">
	
	<input type="hidden" name="diploma" value="0">
		
	</c:if>
	
	
	<br>		
	
</c:forEach>

<hr>

</div>

<div id="careerDiv">
<table><tr style="border-top: 1px;"></tr></table>
<h3 class="crres" style="margin-left: 2%;">경력사항</h3><br><br><br>
 

<c:forEach var="career" items="${careerList}">

	
	<h3 class="crres" style="margin-left: 2%;">회사 이름</h3><input type="text" class="form-control" style="margin-left:30%;" id="companyName" name="companyName" value="${career.companyName}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">회사 분류</h3><input type="text" class="form-control" style="margin-left:30%;" id="careerCategory" name="careerCategory"  value="${career.careerCategory}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">입사일</h3><input type="date" class="form-control" style="margin-left:30%;" id="careerStartDate" name="careerStartDate"  value="${career.careerStartDate}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">퇴사일</h3><input type="date" class="form-control" style="margin-left:30%;" id="careerEndDate" name="careerEndDate"  value="${career.careerEndDate}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">부서</h3><input type="text" class="form-control" style="margin-left:30%;" id="careerDepartment" name="careerDepartment"  value="${career.careerDepartment}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">직급</h3><input type="text" class="form-control" style="margin-left:30%;" id="careerPosition" name="careerPosition"  value="${career.careerPosition}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">지역</h3><input type="text" class="form-control" style="margin-left:30%;" id="careerRegion" name="careerRegion"  value="${career.careerRegion}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">연봉</h3><input type="text" class="form-control" style="margin-left:30%;" id="careerSalary" name="careerSalary"  value="${career.careerSalary}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">업무</h3><input type="text" class="form-control" style="margin-left:30%;" id="careerTask" name="careerTask"  value="${career.careerTask}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">비고</h3><input type="text" class="form-control" style="margin-left:30%;" id="careerDetails" name="careerDetails"  value="${career.careerDetails}"><br><br>

<br>
</c:forEach>

<hr>

</div>

<div id="certiDiv">

<h3 class="crres" style="margin-left: 2%;">자격증</h3><br><br><br>

<c:forEach var="certi" items="${certiList}">

	
	<h3 class="crres" style="margin-left: 2%;">자격증</h3><input type="text" class="form-control" style="margin-left:30%;" id="certiTitle" name="certiTitle" value="${certi.certiTitle}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">발급 기관</h3><input type="text" class="form-control" style="margin-left:30%;" id="certiOrg" name="certiOrg"  value="${certi.certiOrg}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">발급 날짜</h3><input type="date" class="form-control" style="margin-left:30%;" id="certiDate" name="certiDate"  value="${certi.certiDate}"><br><br>
	

</c:forEach>

<hr>

</div>

<div id="langDiv">

<h3 class="crres" style="margin-left: 2%;">언어 점수</h3><br><br><br>

<c:forEach var="language" items="${langList}">

	
	<h3 class="crres" style="margin-left: 2%;">언어</h3><input type="text" class="form-control" style="margin-left:30%;" id="languageType" name="languageType" value="${language.languageType}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">자격증</h3><input type="text" class="form-control" style="margin-left:30%;" id="languageTitle" name="languageTitle"  value="${language.languageTitle}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">점수</h3><input type="text" class="form-control" style="margin-left:30%;" id="languageScore" name="languageScore"  value="${language.languageScore}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">취득 기관</h3><input type="text" class="form-control" style="margin-left:30%;" id="languageOrg" name="languageOrg"  value="${language.languageOrg}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">취득 일자</h3><input type="date" class="form-control" style="margin-left:30%;" id="languageDate" name="languageDate"  value="${language.languageDate}"><br><br>
	

</c:forEach>

<hr>

</div>

<div id="abilityDiv">

<h3 class="crres" style="margin-left: 2%;">기술</h3><br><br><br>

<c:forEach var="ability" items="${abilityList}">

	
	<h3 class="crres" style="margin-left: 2%;">보유 능력</h3><input type="text" class="form-control" style="margin-left:30%;" id="abilityTitle" name="abilityTitle" value="${ability.abilityTitle}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">수준</h3><input type="text" class="form-control" style="margin-left:30%;" id="abilityStatus" name="abilityStatus"  value="${ability.abilityStatus}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">상세내용</h3><input type="text" class="form-control" style="margin-left:30%;" id="abilityDetails" name="abilityDetails"  value="${ability.abilityDetails}"><br><br>
	

</c:forEach>

<hr>

</div>

<div>


<h3 class="crres" style="margin-left: 2%;">대외 활동</h3><br><br><br>

<c:forEach var="activity" items="${activityList}">

	
	<h3 class="crres" style="margin-left: 2%;">대외활동</h3><input type="text" class="form-control" style="margin-left:30%;" id="activityTitle" name="activityTitle" value="${activity.activityTitle}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">대외활동 기관</h3><input type="text" class="form-control" style="margin-left:30%;" id="activityOrg" name="activityOrg"  value="${activity.activityOrg}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">상세내용</h3><input type="text" class="form-control" style="margin-left:30%;" id="activityDetails" name="activityDetails"  value="${activity.activityDetails}"><br><br>
	


</c:forEach>

<hr>

</div>
<c:forEach var="activity" items="${activityList}">
	
	<h3 class="crres" style="margin-left: 2%;">대외활동</h3><input type="text" class="form-control" style="margin-left:30%;" id="activityTitle" name="activityTitle" value="${activity.activityTitle}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">대외활동 기관</h3><input type="text" class="form-control" style="margin-left:30%;" id="activityOrg" name="activityOrg"  value="${activity.activityOrg}"><br><br>
	<h3 class="crres" style="margin-left: 2%;">상세내용</h3> <input type="text" class="form-control" style="margin-left:30%;" id="activityDetails" name="activityDetails"  value="${activity.activityDetails}"><br><br>
	

</c:forEach>

<hr>

</div>
</div>
<input type="hidden" name="updateFlag" value="1">
<input type="hidden" name="updateResumeSeq" value="${resumeSeq}">

<input type="submit" value="이력서 수정" class="btn btn-info" style="margin: 165% 0% 0% -32%;">
<!-- ↓mainDiv -->
<div></div>


</form>
<div class="col-lg-3"></div>
</body>

</html>