<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>My Web Diary - Niee - WEB DEV NIEE</title>
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!-- <meta name="author" content="niee@naver.com"> -->
<!-- <meta name="description" content="IndexedDB, Fullcalendar를 사용한 web diary"> -->
<!-- <meta name="keywords" content="niee,  IndexedDB, Fullcalendar, diary "> -->

<!-- <meta property="og:type" content="article"> -->
<!-- <meta property="og:title" content="My Web Diary - Niee - WEB DEV NIEE"> -->
<!-- <meta property="og:url" content="http://parkminkyu.github.io/diary"> -->
<!-- <meta property="og:site_name" content="My Web Diary - Niee - WEB DEV NIEE"> -->
<!-- <meta property="og:description" content="IndexedDB, Fullcalendar를 사용한 web diary"> -->
<!-- <meta property="og:image" content="http://parkminkyu.github.io/Blog/favicon.png"> -->
<!-- <meta property="og:updated_time" content="2017-10-25 17:00:00 +0000"> -->

<!-- <meta name="twitter:card" content="summary"> -->
<!-- <meta name="twitter:title" content="My Web Diary - Niee - WEB DEV NIEE"> -->
<!-- <meta name="twitter:description" content="IndexedDB, Fullcalendar를 사용한 web diary"> -->
<!-- <meta name="twitter:image" content="http://parkminkyu.github.io/Blog/favicon.png"> -->
<!-- <meta name="twitter:creator" content="niee@naver.com"> -->

<!-- <link rel="icon" href="/Blog/favicon.png"> -->
<link rel='stylesheet' href='resources/diaryResources/fullcalendar/dist/fullcalendar.css' />
<link rel='stylesheet' href='resources/diaryResources/bootstrap/dist/css/bootstrap.min.css' />
<style type="text/css">
.git-group{
	text-align: center;
}
.btn.btn-update{
	background-color: blue;
	float: left;
}

</style>
<script src='resources/diaryResources/jquery/dist/jquery.min.js'></script>
<script src='resources/diaryResources/moment/min/moment.min.js'></script>
<script src='resources/diaryResources/bootstrap/dist/js/bootstrap.min.js'></script>
<script src='resources/diaryResources/fullcalendar/dist/fullcalendar.js'></script>
<script src='resources/diaryResources/js/IndexedDB.js'></script>
<script type="text/javascript">
$(document).ready(function() {
	
	//IndexedDB.checkDB();
	
	//IndexedDB.createSchema('id');
	
	$('#calendar').fullCalendar({
		themeSystem: 'bootstrap3',
		defaultView: 'month',
		editable: true, // enable draggable events
		weekNumbers: true,
		timeFormat: 'HH:mm',
		weekNumbersWithinDays: true,
		allDayText:'하루 종일',
		slotDuration:'00:15',
		scrollTime: moment().format('HH:mm:ss'),
		slotLabelFormat: 'HH:mm',
		customButtons:{
			add_event:{
				text: 'Back',
				click: function(){										
					location.href = "login";
				}
			}
		},
		header: {
			left: 'today prev,next',
			center: 'title',
			right: 'month,agendaWeek,listWeek,add_event'
		},
		views: {
	        month: { // name of view
	            titleFormat: 'YYYY년 MM월'
	        },
	        agendaWeek: {
	        	titleFormat: 'YYYY년 MM월 DD일'
	        },
	        listWeek: {
	        	titleFormat: 'YYYY년 MM월 DD일'
	        }
	    },
		bootstrapGlyphicons: {
		    close: 'glyphicon-remove',
		    prev: 'glyphicon-chevron-left',
		    next: 'glyphicon-chevron-right',
		    prevYear: 'glyphicon-backward',
		    nextYear: 'glyphicon-forward'
		},
		events:function(start, end, timezone, callback){
			$.ajax({
				url: "selectAll",
				type:"get",
				success:function(list){
					var events = [];
					$.each(list, function(index,item){
						events.push(item);
					});
					callback(events);
				}
			});
			
// 			IndexedDB.selectAll(function(data){// DB에서 이벤트 가져오기
// 				var events = [];
// 				for(var i = 0 ; i < data.length ; i ++){
// 					events.push(data[i]);
// 				}
				
// 				callback(events);
// 			});			
		},
		
		dayClick: function(date, jsEvent, view) {
			$('#start').val(date.format('YYYY-MM-DD'))
			$('#shour').val(date.format('HH'))
			$('#smin').val(date.format('mm'))
			$('#end').val(date.format('YYYY-MM-DD'))
			$('#ehour').val(date.format('HH'))
			$('#emin').val(date.format('mm'))
			$('#title').val("");
			$('#saveBtn').html('Save');
			$('#subject').html('Diary Event Add');
			$('#writeModal').modal('show')
		},
		
        eventClick: function(calEvent, jsEvent, view) {
        	$('#id').val(calEvent.diaryseq);
        	$('#title').val(calEvent.title);
        	$('#start').val(calEvent.start.format('YYYY-MM-DD'));
        	$('#shour').val(calEvent.start.format('HH'));
        	$('#smin').val(calEvent.start.format('mm'));        	
        	if(calEvent.end != null && (calEvent.start.format('YYYY년 MM월 DD일 HH:mm') != calEvent.end.format('YYYY년 MM월 DD일 HH:mm'))){
        		$('#end').val(calEvent.end.format('YYYY-MM-DD'));
        		$('#ehour').val(calEvent.end.format('HH'));
        		$('#emin').val(calEvent.end.format('mm'));
        	}else{
        		$('#end').val(calEvent.start.format('YYYY-MM-DD'));
        		$('#ehour').val(calEvent.start.format('HH'));
    			$('#emin').val(calEvent.start.format('mm'));
        	}
        	$('#selectColor').css(calEvent.color);
        	$('#viewModalBody').text(calEvent.title);        	
        	$('#eventDate').text(calEvent.start.format('YYYY년 MM월 DD일 HH:mm'));
        	if( calEvent.end != null && (calEvent.start.format('YYYY년 MM월 DD일 HH:mm') != calEvent.end.format('YYYY년 MM월 DD일 HH:mm')) ){
        		$('#eventDate').text($('#eventDate').text() + ' ~ ' + calEvent.end.format('YYYY년 MM월 DD일 HH:mm'));
        	}
        	$('#viewModal').modal('show')
        },
//         eventResize: function(event, delta, revertFunc) {
//         	alert("test");
// //           	event = mappingEvent(event);
// //            	IndexedDB.insert(event,function(data){
// //    				if(data == 1){
// //    					console.log(event);
// //    				}
// //    			});
//         },
        eventDrop: function(event, delta, revertFunc) {        	
        	event = mappingEvent(event);

        	$.ajax({
				url:"updateTestDB",
				data:{"diaryseq":event.id, "title":event.title, "start":event.start, "end":event.end, "color":event.color},
				type:"post",
				success: function(data){
					$('#calendar').fullCalendar( 'refetchEvents' );
				}			
			});
//            	IndexedDB.insert(event,function(data){
//    				if(data == 1){
//    					console.log(event);
//    				}
//    			});
        }
 	});
	
	function mappingEvent(event){
		return { 
			     id : event.diaryseq,
				 start : event.start.format('YYYY-MM-DD HH:mm'),
				 end : event.end ? event.end.format('YYYY-MM-DD HH:mm') : null,
				 title:event.title,
				 allDay: event.allDay,
				 color:event.color
			   };
	}
	
	$('#saveBtn').click(function(){
		
		if($('#saveBtn').html() == 'Save'){
			
			if($('#title').val() == ''){
				alert('title reqierd');
				return;
			}
			
			var title = $('#title').val();
			var start = $('#start').val();
			var end = $('#end').val();
			var color = $('#selectColor').css('background-color');
			
			if(!$('#allDay').is(":checked")){ // 체크박스가 체크가 되어있으면 참을 반환,
				start += " " + $('#shour').val() + ":" + $('#smin').val();
				end += " " + $('#ehour').val() + ":" + $('#emin').val()	
			}else{
				end = moment($('#end').val()).add(1,'days').format('YYYY-MM-DD');
			}
			
			$.ajax({
				url:"insertTestDB",
				data:{"title":title, "start":start, "end":end, "color":color},
				type:"get",
				success: function(data){
					$('#calendar').fullCalendar( 'refetchEvents' );
				}			
			});
			$('#writeModal').modal('hide');
			
		}else{
			
			var diaryseq = $('#id').val();
			var title = $('#title').val();
			var start = $('#start').val();
			var end = $('#end').val();
			var color = $('#selectColor').css('background-color');
			
			if(!$('#allDay').is(":checked")){ // 체크박스가 체크가 되어있으면 참을 반환,
				start += " " + $('#shour').val() + ":" + $('#smin').val();
				end += " " + $('#ehour').val() + ":" + $('#emin').val()	
			}else{
				end = moment($('#end').val()).add(1,'days').format('YYYY-MM-DD');
			}
			
			$.ajax({
				url:"updateTestDB",
				data:{"diaryseq":diaryseq, "title":title, "start":start, "end":end, "color":color},
				type:"post",
				success: function(data){
					$('#calendar').fullCalendar( 'refetchEvents' );
				}			
			});
			$('#writeModal').modal('hide');
		}		
		//////////////////////////////////////////////////////////////////////////

// 		IndexedDB.selectMaxValue('keyIndex',function(data){
// 			var id = 0;
// 			if(data)
// 				id = data.id + 1;
			
// 			var start = $('#start').val()
// 			var end = $('#end').val();
// 			var color = $('#selectColor').css('background-color');
			
// 			if(!$('#allDay').is(":checked")){ // 체크박스가 체크가 되어있으면 참을 반환,
// 				start += " " + $('#shour').val() + ":" + $('#smin').val();
// 				end += " " + $('#ehour').val() + ":" + $('#emin').val()	
// 			}else{
// 				end = moment($('#end').val()).add(1,'days').format('YYYY-MM-DD');
// 			}
			
// 			var event = {id:id, start: start, end: (end == start) ? null : end, title: $('#title').val(), allDay : $('#allDay').is(":checked"), color:color };
			
// 			IndexedDB.insert(event,function(data){
// 				if(data == 1){
// 					$('#calendar').fullCalendar( 'refetchEvents' );
// 				}
// 			});
				
// 			$('#writeModal').modal('hide');
// 		});
	});
	$('#update').click(function(){
		$('#viewModal').modal('hide');
		$('#subject').html('Diary Event Update');
		$('#saveBtn').html('Update');
		$('#writeModal').modal('show');
	});
	
	$('#deleteBtn').click(function(){
		if(confirm("Delete Okay?")){
			
			$.ajax({
				url:"deleteTestDB",
				data:{"diaryseq": $("#id").val()},
				type:"POST",
				success: function(data){
					//$('#calendar').fullCalendar('refetchEvents');
					$('#calendar').fullCalendar('refetchEvents');
					$('#viewModal').modal('hide');
				}
			});
			
			
// 			IndexedDB.delete(parseInt($('#id').val(),10),function(data){
// 				if(data == 1){
// 					$('#calendar').fullCalendar( 'removeEvents' , $('#id').val())
// 					$('#viewModal').modal('hide')
// 				}
// 			});
		}
	});
	
	$('#default, #red, #navy, #gray, #purple, #orange').click(function(){
		$('#selectColor').css('background-color',$(this).css('background-color'));
	});
});
</script>

</head>
<body>
<!-- <input type="button" value="Home"> -->
<div class="container">
<div id="calendar"></div>

<!-- Event View Modal -->
<div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="viewModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="viewModalLabel">
        	<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> <span id="eventDate"></span><br>
        	<input type="hidden" id="id"/>
        </h4>
      </div>
      <div class="modal-body" id="viewModalBody">
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-update" id="update">Update</button>
      	<button type="button" class="btn btn-warning" id="deleteBtn">Delete</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Event Write Modal -->
<div class="modal fade" id="writeModal" tabindex="-1" role="dialog" aria-labelledby="writeModalLabel">
  <div class="modal-dialog" role="document"> <!-- role속성: 해당태그에 대한 정의 -->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><!-- &times; 곱 연산 표시 -->
        <h4 class="modal-title" id="subject"></h4>
      </div>
      <div class="modal-body">
	    <label class="sr-only" for="title">title</label>
	    <div class="input-group">
	      <div class="input-group-addon"><span class="glyphicon glyphicon glyphicon-pencil" aria-hidden="true"></span></div>
	      <input type="text" class="form-control" id="title" placeholder="title">
	    </div>
	    <br>
	    <div class="input-group">
	      <div class="input-group-addon" style="vertical-align: super;"><span class="glyphicon glyphicon-time" aria-hidden="true"></span></div>
	      <input type="checkbox" id="allDay" value="allDay"><label for="allDay" style="vertical-align: middle">하루 종일</label>
	    </div>
		<br>
	    <div class="form-inline">
		    <label class="sr-only" for="start">start</label>
		    <div class="input-group">
		      <div class="input-group-addon"><span class="glyphicon glyphicon glyphicon-calendar" aria-hidden="true"></span></div>
		      <input type="text" class="form-control" id="start" placeholder="start">
		    </div>
		    <label class="sr-only" for="shour">shour</label>
		    <div class="input-group">
		      <select id="shour" class="form-control">
		      	<option value="00">00
		      	<option value="01">01
		      	<option value="02">02
		      	<option value="03">03
		      	<option value="04">04
		      	<option value="05">05
		      	<option value="06">06
		      	<option value="07">07
		      	<option value="08">08
		      	<option value="09">09
		      	<option value="10">10
		      	<option value="11">11
		      	<option value="12">12
		      	<option value="13">13
		      	<option value="14">14
		      	<option value="15">15
		      	<option value="16">16
		      	<option value="17">17
		      	<option value="18">18
		      	<option value="19">19
		      	<option value="20">20
		      	<option value="21">21
		      	<option value="22">22
		      	<option value="23">23
		      </select>
		    </div>
		    <label class="sr-only" for="smin">smin</label>
		    <div class="input-group">
		      <select id="smin" class="form-control">
		      	<option value="00">00
		      	<option value="15">15
		      	<option value="30">30
		      	<option value="45">45
		      </select>
		    </div>
	    </div>
	    <br>
	    <div class="form-inline">
		    <label class="sr-only" for="end">end</label>
		    <div class="input-group">
		      <div class="input-group-addon"><span class="glyphicon glyphicon glyphicon-calendar" aria-hidden="true"></span></div>
		      <input type="text" class="form-control" id="end" placeholder="end">
		    </div>
		    <label class="sr-only" for="ehour">ehour</label>
	    	<div class="input-group">
		      <select id="ehour" class="form-control">
		      	<option value="00">00
		      	<option value="01">01
		      	<option value="02">02
		      	<option value="03">03
		      	<option value="04">04
		      	<option value="05">05
		      	<option value="06">06
		      	<option value="07">07
		      	<option value="08">08
		      	<option value="09">09
		      	<option value="10">10
		      	<option value="11">11
		      	<option value="12">12
		      	<option value="13">13
		      	<option value="14">14
		      	<option value="15">15
		      	<option value="16">16
		      	<option value="17">17
		      	<option value="18">18
		      	<option value="19">19
		      	<option value="20">20
		      	<option value="21">21
		      	<option value="22">22
		      	<option value="23">23
		      </select>
		    </div>
		    <label class="sr-only" for="emin">emin</label>
		    <div class="input-group">
		      <select id="emin" class="form-control">
		      	<option value="00">00
		      	<option value="15">15
		      	<option value="30">30
		      	<option value="45">45
		      </select>
		    </div>
      </div>
      <br>
      <div class="row">
      	<div class="col-xs-4">
      		<span class="glyphicon glyphicon-eye-open"> 배경색 -> </span>
      	</div>
      	<div class="col-xs-8" id="selectColor" style="background-color: #3a87ad; height: 30px;"></div>
      </div>
      <br>
      <div class="row">
      	<div class="col-xs-4" id="default" data-color="#3a87ad" style="background-color: #3a87ad; height: 30px;">Click</div>
      	<div class="col-xs-4" id="gray" data-color="gray" style="background-color: gray; height: 30px;">Click</div>
      	<div class="col-xs-4" id="navy" data-color="navy" style="background-color: navy; height: 30px;">Click</div>
      </div>
      <div class="row">
      	<div class="col-xs-4" id="red" data-color="red" style="background-color: red; height: 30px;">Click</div>
      	<div class="col-xs-4" id="orange" data-color="orange" style="background-color: orange; height: 30px;">Click</div>
      	<div class="col-xs-4" id="purple" data-color="purple" style="background-color: purple; height: 30px;">Click</div>
      </div>
      <br>
      <div class="modal-footer">
      	<input type="hidden" id="check">      
      	<button type="button" class="btn btn-warning" id="saveBtn"></button>      	
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</div>
</div>
</body>
</html>
