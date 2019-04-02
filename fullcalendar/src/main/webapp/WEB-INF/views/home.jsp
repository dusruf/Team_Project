<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	
	<link href="resources/fullcalendar-3.10.0/fullcalendar.css" rel="stylesheet"/>
<!-- 	<LINK HREF="RESOURCES/FULLCALENDAR-3.10.0/FULLCALENDAR.PRINT.CSS" REL="STYLESHEET" MEDIA="PRINT"/> -->
	<script type="text/javascript" src="resources/fullcalendar-3.10.0/lib/moment.min.js"></script>
	<script type="text/javascript" src="resources/fullcalendar-3.10.0/lib/jquery.min.js"></script>
	<script type="text/javascript" src="resources/fullcalendar-3.10.0/fullcalendar.js" charset="UTF-8"></script>
	
	
	
</head>
<script type="text/javascript">

$(function(){
 //alendarEvent();
 $("#calendar").fullCalendar({
	 
 });
 
});
</script>
<body>
	<div id="calendar"></div>
</body>
</html>
