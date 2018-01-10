<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movis Car rental</title>

<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/bootstrap-material-design.min.css" />
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/ripples.min.css" />
<link rel="stylesheet"	href="static/css/bootstrap-material-datetimepicker.css" />

<link rel="stylesheet"  href="static/css/style.css">

<script src="https://code.jquery.com/jquery-1.12.3.min.js"	integrity="sha256-aaODHAgvwQW1bFOGXMeX+pC4PZIPsvn2h1sArYOhgXQ="	crossorigin="anonymous"></script>
<script type="text/javascript"	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
<script type="text/javascript"	src="https://rawgit.com/FezVrasta/bootstrap-material-design/master/dist/js/material.min.js"></script>
<script type="text/javascript"	src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
<script type="text/javascript"	src="static/js/bootstrap-material-datetimepicker.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$('#date-format-begin').bootstrapMaterialDatePicker({
			format : 'YYYY-MM-DD HH:mm:ss'
		});
		
		$('#date-format-end').bootstrapMaterialDatePicker({
			format : 'YYYY-MM-DD HH:mm:ss'
		});


		$.material.init()
	});
</script>

</head>







<body>

	<header class="container">
	<div class="row">
		<h1 class="col-sm-4">Movis - rent a car</h1>
		<nav class="col-sm-8 text-right"> 
		<c:if test="${not empty info}">
			<p>${info}</p>
			<p>
				<a href="logout">wyloguj się</a>
			</p>
		</c:if> 
		
		<c:if test="${loggedUser.isAdmin == true}">
			<p>
				<a href="panelAdmin">panel administracyjny</a>
			</p>
		</c:if>
		
		
		<c:if test="${loggedUser.isAdmin == false}">
			<p>
				<a href="panelUser">panel użytkownika</a>
			</p>
		</c:if>
		
		<c:if test="${empty info}">
			<p>
				<a href="login">zaloguj się</a>
			</p>
			<p>
				<a href="register">zarejestruj się</a>
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
			<h2>Wypożyczalnia aut</h2>
			<h3>najlepsza na świecie</h3>
			<!--  <a class="btn btn-primary" href="#" role="button">See all</a> -->
		</div>
	</div>
	</section>
	<section class="container">
	<div class="row">
		<figure class="col-sm-6">
		<p><b>Zarezerwuj swój samochód:</b></p>
		
		
		
		
		
		
		<form:form modelAttribute="order" method="post">
		<p>Miejsce odbioru i zwrotu:</p>
		<form:select path="address.id" items="${addresses}" itemLabel="name" itemValue="id"/>
		<form:errors path="address.id"/><br>
		
		<br>

		<p>Data i godzina wypożyczenia:</p>
		<form:input path="pickupDate" id="date-format-begin" class="form-control floating-label" placeholder="Data wypożyczenia"/>
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
				<input type="submit" value="Wypożycz">
			</p>
		</c:if>
		
		<c:if test="${empty info}">
			<p>
				<a href="login">zaloguj się aby przejść dalej</a>
			</p>

		</c:if>
		</form:form>
		
		
		
		
		</figure>
		<figure class="col-sm-6">
		<p>galeria</p>
		<img
			src="static/images/MustangCaliforniaSpecial.jpg">
		</figure>
	</div>
	<!--   <div class="row">
		<figure class="col-sm-6">
		<p>gifts</p>
		<img
			src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/gifts.jpg">
		</figure>
		<figure class="col-sm-6">
		<p>antiques</p>
		<img
			src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/antique.jpg">
		</figure>
	</div> -->
	</section>
	<footer class="container">
	<div class="row">
		<p class="col-sm-4">&copy; 2016 Skillfair</p>
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