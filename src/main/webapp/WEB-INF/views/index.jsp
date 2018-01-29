<%@ page language="java" contentType="text/html; charset=8859_2"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2">
<title>Movis Car rental</title>

<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/bootstrap-material-design.min.css" />
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/ripples.min.css" />
<link rel="stylesheet"	href="static/css/bootstrap-material-datetimepicker.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet"  href="static/css/style.css">

<script src="https://code.jquery.com/jquery-1.12.3.min.js"	integrity="sha256-aaODHAgvwQW1bFOGXMeX+pC4PZIPsvn2h1sArYOhgXQ="	crossorigin="anonymous"></script>
<script type="text/javascript"	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
<script type="text/javascript"	src="https://rawgit.com/FezVrasta/bootstrap-material-design/master/dist/js/material.min.js"></script>
<script type="text/javascript"	src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
<script type="text/javascript"	src="static/js/bootstrap-material-datetimepicker.js"></script>

<!-- datepicker -->

<script type="text/javascript">
	$(document).ready(function() {

		$('#date-format-begin').bootstrapMaterialDatePicker({
			weekStart : 1, format : 'YYYY-MM-DD HH:mm:ss', minDate : new Date()
		});
		
		var tomorrow = new Date();
		tomorrow.setDate(tomorrow.getDate() + 1);
		
		$('#date-format-end').bootstrapMaterialDatePicker({
			weekStart : 1, format : 'YYYY-MM-DD HH:mm:ss', minDate : tomorrow
		});


		$.material.init()
	});
</script>


<!-- Carousel Plugin -->

  <meta name="viewport" content="width=device-width, initial-scale=1">
 
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 60%;
      margin: auto;
  }
  </style>

<script>
$(document).ready(function(){
    // Activate Carousel
    $("#myCarousel").carousel();
    
    // Enable Carousel Indicators
    $(".item1").click(function(){
        $("#myCarousel").carousel(0);
    });
    $(".item2").click(function(){
        $("#myCarousel").carousel(1);
    });
    $(".item3").click(function(){
        $("#myCarousel").carousel(2);
    });
    $(".item4").click(function(){
        $("#myCarousel").carousel(3);
    });
    
    // Enable Carousel Controls
    $(".left").click(function(){
        $("#myCarousel").carousel("prev");
    });
    $(".right").click(function(){
        $("#myCarousel").carousel("next");
    });
});
</script>



</head>







<body>

	<header class="container">
	<div class="row">
		<h1 class="col-sm-4">Movis - rent a car</h1>
		<nav class="col-sm-8 text-right"> 
		<c:if test="${not empty info}">
			<p><b>${info}</b></p>
			<p>
				<a href="logout">wyloguj si�</a>
			</p>
		</c:if> 
		
		<c:if test="${loggedUser.isAdmin == true}">
			<p>
				<a href="panelAdmin">panel administracyjny</a>
			</p>
		</c:if>
		
		
		<c:if test="${loggedUser.isAdmin == false}">
			<p>
				<a href="panelUser">panel u�ytkownika</a>
			</p>
		</c:if>
		
		<c:if test="${empty info}">
			<p>
				<a href="login">logowanie</a>
			</p>
			<p>
				<a href="register">rejestracja</a>
			</p>
		</c:if>
		<p>nasze auta</p>
		<p>kontakt</p>
		</nav>
	</div>
	</header>
	
	
	
	
	<section class="jumbotron">
	<div class="container">
		<div class="row text-center">
			<h2>Wypo�yczalnia aut</h2>
			<h3>najlepsza na �wiecie</h3>
			<!--  <a class="btn btn-primary" href="#" role="button">See all</a> -->
		</div>
	</div>
	</section>
	
	
	
	<section class="containerr">
	<div class="row">
	<figure class="col-sm-1">
	</figure>
		<figure class="col-sm-4">
		<p><b>Zarezerwuj sw�j samoch�d:</b></p>
		
		
		
		<form:form modelAttribute="order" method="post">
		<p>Miejsce odbioru i zwrotu:</p>
		<form:select path="address.id" items="${addresses}" itemLabel="name" itemValue="id"/>
		<form:errors path="address.id"/><br>
		
		<br>

		<p>Data i godzina wypo�yczenia:</p>
		<form:input path="pickupDate" id="date-format-begin" class="form-control floating-label" placeholder="Data wypo�yczenia"/>
		<!-- <form:errors path="pickupDate"/><br> -->
		<b>${dateError}</b>
			
		<p>Data i godzina zwrotu:</p>
		<form:input path="returnDate" id="date-format-end" class="form-control floating-label" placeholder="Data zwrotu"/>
		<!-- <form:errors path="returnDate"/><br> -->
		<b>${dateError}</b>
		
		<p>Klasa auta:</p>
		<form:select path="carClass.id" items="${cars}" itemLabel="carClassDescription" itemValue="id" />
		<form:errors path="carClass.id"/><br>
		
		
		<br><br>
		
		<c:if test="${not empty info}">
			<p>
				<input type="submit" value="Rezerwuj">
			</p>
		</c:if>
		
		<c:if test="${empty info}">
			<p>
				<a href="login">zaloguj si� aby przej�� dalej</a>
			</p>

		</c:if>
		</form:form>
		
		
		</figure>
		
		
		
		<figure class="col-sm-4">
		<!-- <p>galeria</p>  -->
			
			<div class="container">
  <div id="myCarousel" class="carousel slide">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li class="item1 active"></li>
      <li class="item2"></li>
      <li class="item3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="static/images/MustangCaliforniaSpecial.jpg" alt="Mustang" width="400" height="345">
        <div class="carousel-caption">
          <h3>Do ka�dego auta darmowe ubezpieczenie</h3>
          <p>od zgniecenia przez fortepian</p>
        </div>
      </div>

      <div class="item">
        <img src="static/images/audir8.jpg" alt="Audi" width="400" height="345">
        <div class="carousel-caption">
          <h3>Oferujemy pi�te ko�o</h3>
          <p>do ka�dego z naszych woz�w</p>
        </div>
      </div>
    
      <div class="item">
        <img src="static/images/lambo.jpg" alt="Lambo" width="400" height="345">
        <div class="carousel-caption">
          <h3>Promocja na limuzyny</h3>
          <p>przy wynajmie na 365 dni 366. dzie� gratis!</p>
        </div>
      </div>

  
    </div>
		</figure>
		
			<figure class="col-sm-1">
	</figure>
	</div>

	</section>
	<footer class="container">
	<div class="row">
		<p class="col-sm-4">&copy; 2017 Mav</p>
		<ul class="col-sm-8">
			<li class="col-sm-1">...</li>
			<li class="col-sm-1"><img
				src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/twitter.svg"></li>
			<li class="col-sm-1"><img
				src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/facebook.svg"></li>
			<li class="col-sm-1"><img
				src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/instagram.svg"></li>
			<li class="col-sm-1"><img
				src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/medium.svg"></li>
		</ul>
	</div>
	</footer>
</body>
</html>