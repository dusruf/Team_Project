<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이력서 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>		

</head>

<script>

</script>

<body>
<form action="insertResume" method="post">

<div id="mainDiv">

<div id="biDiv">
<input type="hidden" id="resumeSeq" name="resumeSeq" value="${totalResume.resumeSeq}">
이름 : ${sessionScope.personName}<br>
<input type="hidden" id="personName" name="personName" value="${totalResume.personName}">
생년월일 : <input type="date" id="birthDate" name="birthDate" value="${totalResume.birthDate}"><br>
성별 : <input type="text" id="gender" name="gender" value="${totalResume.gender}"><br>
이메일 : ${sessionScope.personEmail}<br>
<input type="hidden" id="personEmail" name="personEmail" value="${totalResume.personEmail}">
전화번호 : <input type="text" id="personPhone" name="personPhone" value="${totalResume.personPhone}"><br>
주소 : <input type="text" id="personAddr" name="personAddr" value="${totalResume.personAddr}"><br>
<hr>

</div>

<div id="careerDiv">

<h3>경력사항</h3>

<c:if test="${careerList}!=null">

까꿍

</c:if>

 
<c:forEach var="career" items="${careerList}">

<table>
	<tr>
	
	<td>회사 이름</td><td><input type="text" id="companyName" name="companyName" value="${career.companyName}"></td>
	</tr><tr>
	<td>회사 분류</td><td><input type="text" id="careerCategory" name="careerCategory"  value="${career.careerCategory}"></td>
	</tr><tr>
	<td>입사일</td><td><input type="date" id="careerStartDate" name="careerStartDate"  value="${career.careerStartDate}"></td>
	</tr><tr>
	<td>퇴사일</td><td><input type="date" id="careerEndDate" name="careerEndDate"  value="${career.careerEndDate}"></td>
	</tr><tr>
	<td>부서</td><td><input type="text" id="careerDepartment" name="careerDepartment"  value="${career.careerDepartment}"></td>
	</tr><tr>
	<td>직급</td><td><input type="text" id="careerPosition" name="careerPosition"  value="${career.careerPosition}"></td>
	</tr><tr>
	<td>지역</td><td><input type="text" id="careerRegion" name="careerRegion"  value="${career.careerRegion}"></td>
	</tr><tr>
	<td>연봉</td><td><input type="text" id="careerSalary" name="careerSalary"  value="${career.careerSalary}"></td>
	</tr><tr>
	<td>업무</td><td><input type="text" id="careerTask" name="careerTask"  value="${career.careerTask}"></td>
	</tr><tr>
	<td>비고</td><td><input type="text" id="careerDetails" name="careerDetails"  value="${career.careerDetails}"></td>

	</tr>

</table>
<br>
</c:forEach>

<hr>

</div>

<div id="certiDiv">

<h3>자격증</h3>

<c:forEach var="certi" items="${certiList}">

<table>
	<tr>
	
	<td>자격증</td><td><input type="text" id="certiTitle" name="certiTitle" value="${certi.certiTitle}"></td>
	</tr><tr>
	<td>발급 기관</td><td><input type="text" id="certiOrg" name="certiOrg"  value="${certi.certiOrg}"></td>
	</tr><tr>
	<td>발급 날짜</td><td><input type="date" id="certiDate" name="certiDate"  value="${certi.certiDate}"></td>
	
	</tr>

</table>
<br>

</c:forEach>

<hr>

</div>

<div id="langDiv">

<h3>언어 점수</h3>

<c:forEach var="language" items="${langList}">

<table>
	<tr>
	
	<td>언어</td><td><input type="text" id="languageType" name="languageType" value="${language.languageType}"></td>
	</tr><tr>
	<td>자격증</td><td><input type="text" id="languageTitle" name="languageTitle"  value="${language.languageTitle}"></td>
	</tr><tr>
	<td>점수</td><td><input type="text" id="languageScore" name="languageScore"  value="${language.languageScore}"></td>
	</tr><tr>
	<td>취득 기관</td><td><input type="text" id="languageOrg" name="languageOrg"  value="${language.languageOrg}"></td>
	</tr><tr>
	<td>취득 일자</td><td><input type="date" id="languageDate" name="languageDate"  value="${language.languageDate}"></td>
	
	</tr>

</table>
<br>

</c:forEach>

<hr>

</div>

<div id="abilityDiv">

<h3>기술</h3>

<c:forEach var="ability" items="${abilityList}">

<table>
	<tr>
	
	<td>보유 능력</td><td><input type="text" id="abilityTitle" name="abilityTitle" value="${ability.abilityTitle}"></td>
	</tr><tr>
	<td>수준</td><td><input type="text" id="abilityStatus" name="abilityStatus"  value="${ability.abilityStatus}"></td>
	</tr><tr>
	<td>상세내용</td><td><input type="text" id="abilityDetails" name="abilityDetails"  value="${ability.abilityDetails}"></td>
	
	</tr>

</table>
<br>

</c:forEach>

<hr>

</div>

<div>


<h3>대외 활동</h3>

<c:forEach var="activity" items="${activityList}">

<table>
	<tr>
	
	<td>대외활동</td><td><input type="text" id="activityTitle" name="activityTitle" value="${activity.activityTitle}"></td>
	</tr><tr>
	<td>대외활동 기관</td><td><input type="text" id="activityOrg" name="activityOrg"  value="${activity.activityOrg}"></td>
	</tr><tr>
	<td>상세내용</td><td><input type="text" id="activityDetails" name="activityDetails"  value="${activity.activityDetails}"></td>
	
	</tr>

</table>
<br>

</c:forEach>

<hr>

</div>

<!-- ↓mainDiv -->
</div>

<input type="submit" value="이력서 수정">

</form>

</body>
</html>