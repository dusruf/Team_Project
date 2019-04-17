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

<h3>등록된 이력서가 없습니다.</h3>

<input type="button" value="이력서 등록" onClick="location.href ='regResume';">

</form>

</div>

</c:if>

<c:if test="${resumeSeq!=0}">


<div id="basicInfoDiv">

	<h3>기본 정보</h3>
	<table border="1"><tr>
	<td>이름</td><td>${bi.personName}</td>
	</tr><tr>
	<td>생년월일</td><td>${bi.birthDate}</td>
	</tr><tr>
	<td>성별</td><td>${bi.gender}</td>
	</tr><tr>
	<td>이메일</td><td>${bi.personEmail}</td>
	</tr><tr>
	<td>주소</td><td>${bi.personAddr}</td>
	</tr>
	</table>
	<hr>	
					
</div><!-- basicInfoDiv -->

<div id="careerDiv">
	<h3>경력</h3>

<c:forEach var="career" items="${careerList}">

	<table border="1">								
	<tr>
	<td>회사 이름</td><td>${career.companyName}</td>
	</tr><tr>
	<td>분야</td><td>${career.careerCategory}</td>
	</tr><tr>
	<td>시작일</td><td>${career.careerStartDate}</td>
	</tr><tr>
	<td>종료일</td><td>${career.careerEndDate}</td>
	</tr><tr>
	<td>부서</td><td>${career.careerDepartment}</td>
	</tr><tr>
	<td>직책</td><td>${career.careerPosition}</td>
	</tr><tr>
	<td>근무 지역</td><td>${career.careerRegion}</td>
	</tr><tr>
	<td>연봉</td><td>${career.careerSalary}</td>
	</tr><tr>
	<td>담당 업무</td><td>${career.careerTask}</td>
	</tr><tr>
	<td>상세 설명</td><td>${career.careerDetails}</td>
	</tr>
	</table>
	<br>		
	
</c:forEach>
	
</div><!-- careerDiv -->

<div id="abilityDiv">

<h3>기술</h3>

<c:forEach var="ability" items="${abilityList}">

<table border="1"><tr>
<td>기술</td><td>${ability.abilityTitle}</td>
</tr><tr>
<td>기술 정도</td><td>${ability.abilityStatus}</td>
</tr><tr>
<td>기술 상세</td><td>${ability.abilityDetails}</td>
</tr></table><br>	

</c:forEach>

</div><!-- abilityDiv -->

<div id="activityDiv">

<h3>대외 활동</h3>

<c:forEach var="activity" items="${activityList}">

<table border="1"><tr>
<td>대외활동</td><td>${activity.activityTitle}</td>
</tr><tr>
<td>대외활동 기관</td><td>${activity.activityOrg}</td>
</tr><tr>
<td>상세</td><td>${activity.activityDetails}</td>
</tr></table><br>																
																		
</c:forEach>

</div><!-- activityDiv -->

<div id="certiDiv">

<h3>자격증</h3>

<c:forEach var="certi" items="${certiList}">

<table border="1">
<tr>
<td>자격증</td><td>${certi.certiTitle}</td>
</tr><tr>
<td>발행 기관</td><td>${certi.certiOrg}</td>
</tr><tr>
<td>취득 날짜</td><td>${certi.certiDate}</td>
</tr></table><br>		

</c:forEach>

</div><!-- certiDiv -->

<div id="languageScoreDiv">



</div><!-- languageScoreDiv  -->


</div><!-- totalDiv -->

<form action="updateResume" method="get">
<input type="hidden" name="resumeSeq" value="${bi.resumeSeq}">
<input type="submit" value="이력서 수정">
</form>

</c:if>

</body>
</html>