<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	
	$.ajax({
		
		url:"http://openapi.q-net.or.kr/api/service/rest/InquiryListNationalQualifcationSVC/getList?serviceKey=FTUzdDaKUoZ4WlcoyhC1K%2FOWrBCZx2kZn1yBaEFA5yloKtrqiKt27GzRWTpz07fm78iz0VydVPhtyw1xODs2Vw%3D%3D",
		type:'get',
		contentType : 'application/xml',
		success:function(data){
			
			console.log(data);
			
			var context = '';
			
			$.each($(data).find('item'),function(index,item){
				context += 'jmcd : '+$(item).find('jmcd').text()+'<br>';
				context += 'jmfldnm : '+$(item).find('jmfldnm').text()+'<br>';
				context += 'mdobligfldcd : ' +$(item).find('mdobligfldcd').text()+'<br>';
				context += 'mdobligfldnm : ' +$(item).find('mdobligfldnm').text()+'<br>';
				context += 'obligfldcd : ' +$(item).find('obligfldcd').text()+'<br>';
				context += 'obligfldnm : ' + $(item).find('obligfldnm').text() +'<br>';
				context += 'qualgbcd : ' + $(item).find('qualgbcd').text() +'<br>';
				context += 'qualgbnm : ' + $(item).find('qualgbnm').text() +'<br>';
				context += 'seriescd : ' + $(item).find('seriescd').text() +'<br>';
				context += 'seriesnm : ' + $(item).find('seriesnm').text() +'<br><br>';
				
			});
			
			$("#contextDiv").html(context);
		}
		
	});
	
	
	</script>
</head>
<body>
	<div id="contextDiv">
	
	
	</div>
</body>
</html>
