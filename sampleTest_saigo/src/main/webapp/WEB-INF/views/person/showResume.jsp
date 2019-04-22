<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, maximum-scale=1">
	
	<!-- 홈페이지명 -->
	<title>Have a Good day</title>
	
	<!-- 구글 웹폰트 -->
	<link href=}https://fonts.googleapis.com/css?family=Montserrat:400,700} rel=}stylesheet} type=}text/css}>
	<link href=}https://fonts.googleapis.com/css?family=Open+Sans:400,300,800italic,700italic,600italic,400italic,300italic,800,700,600} rel=}stylesheet} type=}text/css}>
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

</script>

<body>

<header class="header3" id="header3">
		<!--header-start-->
		<div class="container">
		</div>
	</header>

<div id="totalDiv">

<c:if test="${resumeSeq==0}">

<div id="nullDiv">

<h3 class="crres" style="margin-left:37%;">등록된 이력서가 없습니다.</h3>


 <input type="button" class="btn btn-primary" value="이력서 등록" style="width: 100px;margin-left: 20px;" onClick="location.href ='regResume';">


</div>

</c:if>

<c:if test="${resumeSeq!=0}">

<div class="col-lg-3"></div>
<div class="col-lg-6">
<div id="basicInfoDiv">

	<h3 class="crres" style="margin-left:0%;">기본 정보</h3>
	<table border="0px;" class="table table-boarded" style="border-top: 1px; border-bottom: 1px;"><tr>
	<td style="width: 20%; font-size: 20px;">이름</td><td style="font-size: 20px;">${bi.personName}</td>
	</tr><tr>
	<td style="width: 20%; font-size: 20px;">생년월일</td><td style="font-size: 20px;">${bi.birthDate}</td>
	</tr><tr>
	<td style="width: 20%; font-size: 20px;">성별</td><td style="font-size: 20px;">${bi.gender}</td>
	</tr><tr>
	<td style="width: 20%; font-size: 20px;">이메일</td><td style="font-size: 20px;">${bi.personEmail}</td>
	</tr><tr>
	<td style="width: 20%; font-size: 20px;">주소</td><td style="font-size: 20px;">${bi.personAddr}</td>
	</tr>
	</table>
	<hr>	
</div><!-- basicInfoDiv -->


<div id="educationDiv">

<h3 class="crres" style="margin-left:0%;">학력</h3>
<c:forEach var="education" items="${educationList}">

	<table border="0px;" class="table table-boarded" style="border-top: 1px; border-bottom: 1px;">								
	<tr>
	<td style="width: 20%; font-size: 20px;">학교</td><td style="font-size: 20px;">${education.schoolName}</td>
	</tr><tr>
	<td style="width: 20%; font-size: 20px;">전공</td><td style="font-size: 20px;">${education.major}</td>
	</tr><tr>
	<td style="width: 20%; font-size: 20px;">입학일</td><td style="font-size: 20px;">${education.eduStartDate}</td>
	</tr><tr>
	<td style="width: 20%; font-size: 20px;">졸업일</td><td style="font-size: 20px;">${education.eduEndDate}</td>
	</tr>
	</table>
	<br>		
	
</c:forEach>


</div>

<div id="careerDiv">
	<h3 class="crres" style="margin-left:0%;">경력</h3>

<c:forEach var="career" items="${careerList}">

	<table border="0px;" class="table table-boarded" style="border-top: 1px; border-bottom: 1px;">								
	<tr>
	<td style="width: 20%; font-size: 20px;">회사 이름</td><td style="font-size: 20px;">${career.companyName}</td>
	</tr><tr>
	<td style="width: 20%; font-size: 20px;">분야</td><td style="font-size: 20px;">${career.careerCategory}</td>
	</tr><tr>
	<td style="width: 20%; font-size: 20px;">시작일</td><td style="font-size: 20px;">${career.careerStartDate}</td>
	</tr><tr>
	<td style="width: 20%; font-size: 20px;">종료일</td><td style="font-size: 20px;">${career.careerEndDate}</td>
	</tr><tr>
	<td style="width: 20%; font-size: 20px;">부서</td><td style="font-size: 20px;">${career.careerDepartment}</td>
	</tr><tr>
	<td style="width: 20%; font-size: 20px;">직책</td><td style="font-size: 20px;">${career.careerPosition}</td>
	</tr><tr>
	<td style="width: 20%; font-size: 20px;">근무 지역</td><td style="font-size: 20px;">${career.careerRegion}</td>
	</tr><tr>
	<td style="width: 20%; font-size: 20px;">연봉</td><td style="font-size: 20px;">${career.careerSalary}</td>
	</tr><tr>
	<td style="width: 20%; font-size: 20px;">담당 업무</td><td style="font-size: 20px;">${career.careerTask}</td>
	</tr><tr>
	<td style="width: 20%; font-size: 20px;">상세 설명</td><td style="font-size: 20px;">${career.careerDetails}</td>
	</tr>
	</table>
	<br>		
	
</c:forEach>
	
</div><!-- careerDiv -->

<div id="abilityDiv">

<h3 class="crres" style="margin-left:0%;">기술</h3>

<c:forEach var="ability" items="${abilityList}">

<table border="0px;" class="table table-boarded" style="border-top: 1px; border-bottom: 1px;"><tr>
<td style="width: 20%; font-size: 20px;">기술</td><td style="font-size: 20px;">${ability.abilityTitle}</td>
</tr><tr>
<td style="width: 20%; font-size: 20px;">기술 정도</td><td style="font-size: 20px;">${ability.abilityStatus}</td>
</tr><tr>
<td style="width: 20%; font-size: 20px;">기술 상세</td><td style="font-size: 20px;">${ability.abilityDetails}</td>
</tr></table><br>	

</c:forEach>

</div><!-- abilityDiv -->

<div id="activityDiv">

<h3 class="crres" style="margin-left:0%;">대외 활동</h3>

<c:forEach var="activity" items="${activityList}">

<table border="0px;" class="table table-boarded" style="border-top: 1px; border-bottom: 1px;"><tr>
<td style="width: 20%; font-size: 20px;">대외활동</td><td style="font-size: 20px;">${activity.activityTitle}</td>
</tr><tr>
<td style="width: 20%; font-size: 20px;">대외활동 기관</td><td style="font-size: 20px;">${activity.activityOrg}</td>
</tr><tr>
<td style="width: 20%; font-size: 20px;">상세</td><td style="font-size: 20px;">${activity.activityDetails}</td>
</tr></table><br>																
																		
</c:forEach>

</div><!-- activityDiv -->

<div id="certiDiv">

<h3 class="crres" style="margin-left:0%;">자격증</h3>

<c:forEach var="certi" items="${certiList}">

<table border="0px;" class="table table-boarded" style="border-top: 1px; border-bottom: 1px;">
<tr>
<td style="width: 20%; font-size: 20px;">자격증</td><td style="font-size: 20px;">${certi.certiTitle}</td>
</tr><tr>
<td style="width: 20%; font-size: 20px;">발행 기관</td><td style="font-size: 20px;">${certi.certiOrg}</td>
</tr><tr>
<td style="width: 20%; font-size: 20px;">취득 날짜</td><td style="font-size: 20px;">${certi.certiDate}</td>
</tr></table><br>		

</c:forEach>

</div><!-- certiDiv -->

<div id="languageScoreDiv">


</div><!-- languageScoreDiv  -->


</div><!-- totalDiv -->
</div>

<form action="updateResume" method="get">
<input type="hidden" name="resumeSeq" value="${bi.resumeSeq}">
<input type="submit" value="이력서 수정" class="btn btn-info" style="margin: 78% 0% 0% -30%;">
</form>

</c:if>
<div class="col-lg-3"></div>

</body>
</html>