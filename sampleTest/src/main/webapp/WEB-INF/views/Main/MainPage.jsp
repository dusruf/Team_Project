<!doctype html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, maximum-scale=1">
	
	<!-- 홈페이지명 -->
	<title>WelCome To Perfect Ten</title>
	
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

<!-- person회원가입 처리 -->
<script>




	$(document).ready(function(){
		$("#submit").on("click", function(){
			var person = {
					"personId":$("#personId").val(),
					"personPw":$("#personPw").val(),
					"personName":$("#personName").val(),
					"personEmail":$("#personEmail").val(),
					"loginFlag":$("#loginFlag").val()
			}			
			$.ajax({
				url:"personReg",
				data:person,
				type:"post",
				success:function(data){
					if(data == "success"){
						
						alert("구직자 등록 성공");
						 
						$("#personId").val("");
						$("#personPw").val("");
						$("#personName").val("");
						$("#personEmail").val("");
						$("#personModal").modal('hide');
					}else{
						$("#personId").val(data).css("color", "red");
					}
				}
			});
		});
		
		$("#personId").focus(function(){
			$(this).css("color", "black").val("");
		});
		
		$("#close").on("click", function(){
			$("#personId").val("");
			$("#personPw").val("");
			$("#personName").val("");
			$("#personEmail").val("");
		});
	});
</script>

<!-- headhunter회원가입 처리 -->
<script>
	$(document).ready(function(){
		$("#submit1").on("click", function(){
			
			var hh = {
					"hhId":$("#hhId").val(),
					"hhPw":$("#hhPw").val(),
					"cdn":$("#cdn").val(),
					"hhName": $("#hhName").val(),
					"representative" : $("#representative").val(),
					"phone": $("#phone").val(),
					"addr" : $("#addr").val(),
					"hhEmail" : $("#hhEmail").val(),
					"loginFlag" : $("#loginFlag1").val()
			}
			
			$.ajax({
				url:"hhReg",
				data:hh,
				type:"post",
				success: function(data){
					if(data == "success"){
						
						alert("헤드헌터 가입 성공");
						
						$("#hhId").val("");
						$("#hhPw").val("");
						$("#cdn").val("");
						$("#hhName").val("");
						$("#representative").val("");
						$("#phone").val("");
						$("#addr").val("");
						$("#hhEmail").val("");
						$("#companyModal").modal('hide');
					}else{
						$("#hhId").val(data).css("color", "red");
					}
				}
			});
		});
		
		$("#hhId").focus(function(){
			$(this).css("color", "black").val("");
		});
		
		$("#close1").on("click", function(){
			$("#hhId").val(""),
			$("#hhPw").val(""),
			$("#cdn").val(""),
			$("#hhName").val(""),
			$("#representative").val(""),
			$("#phone").val(""),
			$("#addr").val(""),
			$("#hhEmail").val("")
		});
	});
</script>

<script>

/*
$(function(){
	
	$("#login-btn").on("click",login);
	
});

function login(){
	
	var loginId=$("#user").val();	
	var loginPw=$("#password").val();
	
	alert(loginId+" / "+loginPw);
	
}
*/

</script>

<body>
<!-- Modal -->
		  <div class="modal fade" id="personModal" role="dialog">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal"></button>
		          <h4 class="modal-title">Person</h4>
		        </div>
		        <div class="modal-body">
		          <br>		          
		          <input type="text" class="form-control" name="personId" placeholder="아이디를 입력하세요." id="personId"><br><br>
		          <input type="password" class="form-control" name="personPw" placeholder="비밀번호를 입력하세요." id="personPw"><br><br>		       	  
		          <input type="text" class="form-control" name="personName" placeholder="이름을 입력하세요." id="personName"><br><br>
		          <input type="text" class="form-control" name="personEmail" placeholder="E-mail을 입력하세요." id="personEmail">
		          <input type="hidden" name="loginFlag" value="2" id="loginFlag">		          		          		      
		          <br>		          
		        </div>		        
		        <div class="modal-footer">
		          <input type="button" class="btn btn-success" value="Complete" id="submit">
		          <input type="button" class="btn btn-success" data-dismiss="modal" value="Close" id="close">
		        </div>		        		        
		      </div>
		    </div>
		  </div>
	  
		  <div class="modal fade" id="companyModal" role="dialog">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal"></button>
		          <h4 class="modal-title">Company</h4>
		        </div>
		        <div class="modal-body">
		        <br>
		          <input type="text" id="hhId" name="hhId" class="form-control" placeholder="아이디를 입력하세요.">
		          <br>  <br>
		          <input type="password" id="hhPw" name="hhPw" class="form-control" placeholder="비밀번호를 입력하세요.">
		          <br>  <br>
		          <input type="text" id="cdn" name="cdn" class="form-control" placeholder="사업자등록번호를 입력하세요.">
		          <br>  <br>
		          <input type="text" id="hhName" name="hhName" class="form-control" placeholder="회사명을 입력하세요.">
		          <br>  <br>
		          <input type="text" id="representative" name="representative" class="form-control" placeholder="담당자 이름을 입력하세요.">
		          <br>  <br>
		          <input type="text" id="phone" name="phone" class="form-control" placeholder="회사대표번호를 입력하세요.">
		          <br>  <br>
		          <input type="text" id="addr" name="addr" class="form-control" placeholder="회사주소를 입력하세요.">
		          <br>  <br>
		          <input type="text" id="hhEmail" name="hhEmail" class="form-control" placeholder="회사 E-mail을 입력하세요.">
		          <br>
		          <input type="hidden" id="loginFlag1" name="loginFlag" value="1">
		        </div>
		        <div class="modal-footer">
		           <input type="submit" class="btn btn-success" value="Complete" id="submit1">
		           <input type="button" class="btn btn-success" data-dismiss="modal" value="Close" id="close1">
		        </div>
		      </div>
		    </div>
		  </div>
		  
	  	  <div class="modal fade" id="warring" role="dialog">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		        </div>
		        <div class="modal-body">
		        	<h3>Person 또는 Company 버튼을 선택한 후 진행하세요.</h3>
		        </div>
		        <div class="modal-footer">
		        </div>
		      </div>
		    </div>
		  </div>


	<header class="header" id="header">
		<!--header-start-->
		<div class="container">
			<figure class="logo animated fadeInDown delay-07s">
				<!-- 제일 큰 메인 로고 -->
				<a href="#"><img src="img/logo.png" alt=""></a>
			</figure>
			<h1 class="animated fadeInDown delay-07s">Welcome To Perfect Ten</h1>
			<ul class="we-create animated fadeInUp delay-1s">
				<li>Just Do It</li>
			</ul>
			<a class="link animated fadeInUp delay-1s servicelink " href="#loginMenu">Get Started</a>
		</div>
	</header>
	<!--header-end-->

	<nav class="main-nav-outer" id="test">
		<!--main-nav-start-->
		<div class="container">
			<ul class="main-nav">
				<li><a href="#header">HOME</a></li>
				<li><a href="#loginMenu">LOGIN</a></li>
				<li><a href="#company">COMPANY</a></li>
				<li><a href="#client">PRICE</a></li>
				<li><a href="#contact">CONTACT</a></li>
			</ul>
			<a class="res-nav_click" href="#"><i class="fa fa-bars"></i></a>
		</div>
	</nav>
	<!--main-nav-end-->

		<!--main-section-start-->
	<section class="main-section" id="loginMenu">
		<div class="container">
			<h2>LOGIN</h2>
			<h6>PERSONE MEMBER OR COMPANY MEMBER</h6>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 text-right wow fadeInLeft delay-05s" ></div>
        
    		<div id="loginbox" class="mainbox col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 wow fadeInLeft delay-05s"> 

  			<div class="panel panel-default" >
           
	            <div class="panel-heading">
	           
	                <div class="panel-title text-center">www.perfectten.website</div>
	                
	            </div>     

            <div class="panel-body" >
              	<!-- 로그인 -->
                <form action="login" name="form" id="form" class="form-horizontal" enctype="multipart/form-data" method="POST">
                                      
                    <div class="input-group">
                        <span class="input-group-addon">ID</span>
                        <input id="user" type="text" class="form-control" name="loginId" placeholder="User">                                        
                    </div>

                    <div class="input-group">
                        <span class="input-group-addon">PW</span>
                        <input id="password" type="password" class="form-control" name="loginPw" placeholder="Password">
                    </div>                                                                  
                    <div class="form-group">
                        <!-- Button -->
                        <div class="col-sm-12 controls">
                        	<input type="submit" class="btn btn-success pull-right" id="login-btn" value="Login">
                            <!-- <button type="button" class="btn btn-success pull-right" id="login-btn">Login</button>  -->
                            <button type="button" class="btn btn-success pull-right" id="sign-btn">Sign</button> 
	                        <div class="btn-group" data-toggle="buttons">
								  <label class="btn btn-success ">
								   	 <input type="radio" name="loginFlag" id="option1" value="2" autocomplete="off"> Person
								  </label>
								 
								  <label class="btn btn-success">
									    <input type="radio" name="loginFlag" id="option2" value="1" autocomplete="off"> Company
								  </label>
							</div> <!-- btn-group -->              
                        </div> <!-- col-sm-12 controls -->
                    </div> <!-- form-group -->
                </form> <!-- action="login" -->    
            </div>                     
        </div>  
    </div>
</div>

			
				
	</section>

	<section class="loginImage" id="loginImage">
	
			<ul class="client wow fadeIn delay-05s text-center">
			<li>
            	<img src="img/desk.png" alt="">
            </li>
			</ul>
	</section>
	
	    <!--main-section-end-->
	<section class="main-section paddind" id="company">
		<!--main-section-start-->
		<div class="container">
			<h2>COMPANY</h2>
			<h6>COMPANY INFO</h6>
			<div class="companyinfo">
			
				<div class="row">
					
				<div class="col-lg-4 row-lg-4 wow fadeInLeft delay-05s">
					<div class="service-list">
						<div class="service-list-col1">
							<i class="fa fa-user"></i>
						</div>
					<div class="service-list-col2">
							<h3>좋은 인재를 찾으시나요.</h3>
							<p>인재와의 매칭 이곳에서 시작하세요. </p>
						</div>
						</div>
					</div>
					
				<div class="col-lg-4 row-lg-4 wow fadeInLeft delay-05s">
					<div class="service-list">
						<div class="service-list-col1">
							<i class="fa fa-plane"></i>
						</div>
					<div class="service-list-col2">
							<h3>해외진출을 원하시나요.</h3>
							<p>해외로의 진출 이곳에서 시작하세요. </p>
						</div>
					</div>
				</div>
				
				<div class="col-lg-4 row-lg-4 wow fadeInLeft delay-05s">
					<div class="service-list">
						<div class="service-list-col1">
							<i class="fa fa-usd"></i>
						</div>
					<div class="service-list-col2">
							<h3>당신의 가격 알고있나요.</h3>
							<p>당신의 가격 이곳에서 확인하세요. </p>
						</div>
					</div>
				</div>
				
				<div class="col-lg-4 row-lg-4 wow fadeInLeft delay-05s">
					<div class="service-list">
						<div class="service-list-col1">
							<i class="fa fa-road"></i>
						</div>
					<div class="service-list-col2">
							<h3>평생직장은 없습니다.</h3>
							<p>당신의 가치를 올리세요. </p>
						</div>
					</div>
				</div>
				
				<div class="col-lg-4 row-lg-4 wow fadeInLeft delay-05s">
					<div class="service-list">
						<div class="service-list-col1">
							<i class="fa fa-cloud"></i>
						</div>
					<div class="service-list-col2">
							<h3>최고의 직장을 찾아드립니다.</h3>
							<p>당신의 포지션을 올려드립니다.</p>
						</div>
					</div>
				</div>
				
				<div class="col-lg-4 row-lg-4 wow fadeInLeft delay-05s">
					<div class="service-list">
						<div class="service-list-col1">
							<i class="fa fa-user"></i>
						</div>
					<div class="service-list-col2">
							<h3>최고의 헤드헌터 들이 관리합니다.</h3>
							<p>최고의 헤드헌터들의 케어를 받으세요.</p>
					</div>
					</div>
				</div>
					<ul class="client wow fadeIn delay-05s">
						<img src="img/working.png" alt="">
					</ul>
			
			</div>
				
		</div>
	
	</div>
	
</section>
	<!--main-section-end-->
			
						<section class="main-section price-part" id="client">
							<div class="container">
								<h2>PRICE</h2>
								<h6 class="priceh6">PRICE INFO</h6>
							</div>
						</section>
				
					<section class="priceimg-part" id="price">
						<div class="back-img">
							<ul class="pricepic wow fadeIn delay-05s">
								<li>
					            	<img src="img/price.png" alt="">
					            </li>
							</ul>
						</div>
						
					<div class="front-img">
							<div class="btn1">
						<button type="button" class="btn btn-link wow fadeIn delay-05s">GO PAYMENT</button>
							</div>
									<div class="btn2">
						<button type="button" class="btn btn-link wow fadeIn delay-05s">GO PAYMENT</button>
							</div>
									<div class="btn3">
						<button type="button" class="btn btn-link wow fadeIn delay-05s">GO PAYMENT</button>
							</div>
				  </div>
				  
	</section>
	<div class="container">
		<h2 class="contecth2">CONTECT</h2>
		<h6 class="contecth6">SEND TO EMAIL</h6>
		<section class="main-section contact" id="contact">

			<div class="row">
				<div class="col-lg-6 col-sm-7 wow fadeInLeft">
					<div class="contact-info-box address clearfix">
						<h3><i class=" icon-map-marker"></i>Address:</h3>
						<span>513, Yeongdong-daero, Gangnam-gu<br>Seoul, Republic of Korea, 06164.</span>
					</div>
					<div class="contact-info-box phone clearfix">
						<h3><i class="fa fa-phone"></i>Phone:</h3>
						<span>82-02-654-8387</span>
					</div>
					<div class="contact-info-box email clearfix">
						<h3><i class="fa fa-pencil"></i>email:</h3>
						<span>perfect@perfectten.com</span>
					</div>
					<div class="contact-info-box hours clearfix">
						<h3><i class="fa fa-clock-o"></i>Hours:</h3>
						<span><strong>Monday - Thursday:</strong> 10am - 6pm<br><strong>Friday:</strong> People work on Fridays now?<br><strong>Saturday - Sunday:</strong> Best not to ask.</span>
					</div>
			
				</div>
				<div class="col-lg-6 col-sm-5 wow fadeInUp delay-05s">
					<div class="form">

						<div id="sendmessage">Your E-maile has been sent. Thank you!</div>
						<div id="errormessage"></div>
						<form action="" method="post" role="form" class="contactForm">
							<div class="form-group">
								<input type="text" name="name" class="form-control input-text" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
								<div class="validation"></div>
							</div>
							<div class="form-group">
								<input type="email" class="form-control input-text" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
								<div class="validation"></div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control input-text" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
								<div class="validation"></div>
							</div>
							<div class="form-group">
								<textarea class="form-control input-text text-area" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
								<div class="validation"></div>
							</div>
							<div class="text-center"><button type="submit" class="input-btn">Send E-mail</button></div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
	<footer class="footer">
		<div class="container">
			<div class="footer-logo"><a href="#"><img src="img/small-logo2.png" alt=""></a></div>
			<span class="copyright">&copy; Perfect Ten. All Rights Reserved</span>
			<div class="credits">
				<!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Knight
        -->
				HeadHuntingPlatform <a href="https://www.perfectten.website.com/">Perfect Ten</a>
			</div>
		</div>
	</footer>

			  
	<script type="text/javascript">
		$(document).ready(function(e) {

			$('#test').scrollToFixed();
			$('.res-nav_click').click(function() {
				$('.main-nav').slideToggle();
				return false
			});

      $('.Portfolio-box').magnificPopup({
        delegate: 'a',
        type: 'image'
      });

		});
	</script> <!-- 상단메뉴바가 유지되게끔 해주는 메서드 -->

	<script>
		wow = new WOW({
			animateClass: 'animated',
			offset: 100
		});
		wow.init();
	</script> <!-- 와우 에니메이션 효과 -->


	<script type="text/javascript">
		$(window).load(function() {

			$('.main-nav li a, .servicelink').bind('click', function(event) {
				var $anchor = $(this);

				$('html, body').stop().animate({
					scrollTop: $($anchor.attr('href')).offset().top - 59
				}, 1500, 'easeInOutExpo');
				/*
				if you don't want to use the easing effects:
				$('html, body').stop().animate({
					scrollTop: $($anchor.attr('href')).offset().top
				}, 1000);
				*/
				if ($(window).width() < 768) {
					$('.main-nav').hide();
				}
				event.preventDefault();
			});
		})
	</script> <!-- 스무스한 스크롤 효과(에니메이션) -->

	<script type="text/javascript">
		$(window).load(function() {


			var $container = $('.portfolioContainer'),
				$body = $('body'),
				colW = 375,
				columns = null;


			$container.isotope({
				// disable window resizing
				resizable: true,
				masonry: {
					columnWidth: colW
				}
			});

			$(window).smartresize(function() {
				// check if columns has changed
				var currentColumns = Math.floor(($body.width() - 30) / colW);
				if (currentColumns !== columns) {
					// set new column count
					columns = currentColumns;
					// apply width to container manually, then trigger relayout
					$container.width(columns * colW)
						.isotope('reLayout');
				}

			}).smartresize(); // trigger resize to set container width
			$('.portfolioFilter a').click(function() {
				$('.portfolioFilter .current').removeClass('current');
				$(this).addClass('current');

				var selector = $(this).attr('data-filter');
				$container.isotope({

					filter: selector,
				});
				return false;
			});

		});
	</script> <!-- 반응형 가로폭 등등 -->
	
	<script type="text/javascript">
	 $(document).ready(function () {
	  $('#sign-btn').click(function(){
		var person =  document.getElementById("option1").checked
		var company =  document.getElementById("option2").checked
			
			if (person) {
				$('#personModal').modal({
					backdrop: 'static', keyboard: true	
				})
				
			} else if(company){
				$('#companyModal').modal({
					backdrop: 'static', keyboard: true
				});
			} else {
				$('#warring').modal({
					  keyboard: false
				});
			}
	  });
});
	 
	</script>
	<!-- <script type="text/javascript">
	 $(document).ready(function(){
		$('#login-btn').click(function(){
			
		});
	 
	 });
	 
	 </script> -->
	 
</body>
</html>