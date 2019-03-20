<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	$.ajax({
		url:"http://openapi.q-net.or.kr/api/service/rest/InquiryListNationalQualifcationSVC/getList?serviceKey=FTUzdDaKUoZ4WlcoyhC1K%2FOWrBCZx2kZn1yBaEFA5yloKtrqiKt27GzRWTpz07fm78iz0VydVPhtyw1xODs2Vw%3D%3D",
		type:'get',
		contentType : 'application/xml',
		success:function(data){
			var num = 0;
			var availableCity = new Array();
			
			$.each($(data).find('item'),function(index,item){
				availableCity[num] = $(item).find('jmfldnm').text();
				num++;
			});
						
			$("#city").autocomplete({
				        source: availableCity,
				        select: function(event, ui) {
				            console.log(ui.item);
				        },
				        focus: function(event, ui) {
				            return false;
				            //event.preventDefault();
				        }
			});
		}
	});
});
	
</script>

</head>
<body>
	<div class="ui-widget">
		<label for="city">도시</label>
		<form action="test">
		<input id="city" name="temp">
		<input type="submit" value="전송">
		</form>		
	</div>
</body>
</html>
