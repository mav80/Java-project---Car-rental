<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="fragments/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movis Car rental</title>
</head>







<body>

	<header class="container">
	<div class="row">
		<h1 class="col-sm-4">Movis - rent a car</h1>
		<nav class="col-sm-8 text-right"> 
		<c:if test="${not empty info}">
			<p><b>${info}</b></p>
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
			<h2>Wypożyczalnia aut</h2>
			<h3>najlepsza na świecie</h3>
			<!--  <a class="btn btn-primary" href="#" role="button">See all</a> -->
		</div>
	</div>
	</section>
	
	
	
	<section class="containerr">
	<div class="row">
	<figure class="col-sm-1">
	</figure>
		<figure class="col-sm-4">
		<p><b>Zarezerwuj swój samochód:</b></p>
		
		
		
		<form:form modelAttribute="order" method="post">
		<p>Miejsce odbioru i zwrotu:</p>
		<form:select path="address.id" items="${addresses}" itemLabel="name" itemValue="id"/>
		<form:errors path="address.id"/><br>
		
		<br>

		<p>Data i godzina wypożyczenia:</p>
		<form:input path="pickupDate" id="date-format-begin" class="form-control floating-label" placeholder="Data wypożyczenia"/>
		 <!--<form:errors path="pickupDate"/><br> -->
		<!--<b style="color: red">${dateError}</b> -->
			
		<p>Data i godzina zwrotu:</p>
		<form:input path="returnDate" id="date-format-end" class="form-control floating-label" placeholder="Data zwrotu"/>
		<!--<form:errors path="returnDate"/><br> -->
		<b style="color: red">${dateError}</b>
		
		<p>Klasa auta:</p>
		<form:select path="carClass.id" items="${cars}" itemLabel="carClassDescription" itemValue="id" />
		<form:errors path="carClass.id"/><br>
		
		<form:hidden path="referenceNumber" value="new"/>
		<form:errors path="referenceNumber"/>
		
		
		<br><br>
		
		<c:if test="${not empty info}">
			<p>
				<input type="submit" value="Rezerwuj">
			</p>
		</c:if>
		
		<c:if test="${empty info}">
			<p>
				<a href="login">zaloguj się aby przejść dalej</a>
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
          <h3>Do każdego auta darmowe ubezpieczenie</h3>
          <p>od zgniecenia przez fortepian</p>
        </div>
      </div>

      <div class="item">
        <img src="static/images/audir8.jpg" alt="Audi" width="400" height="345">
        <div class="carousel-caption">
          <h3>Oferujemy piąte koło</h3>
          <p>do każdego z naszych wozów</p>
        </div>
      </div>
    
      <div class="item">
        <img src="static/images/lambo.jpg" alt="Lambo" width="400" height="345">
        <div class="carousel-caption">
          <h3>Promocja na limuzyny</h3>
          <p>przy wynajmie na 365 dni 366. dzień gratis!</p>
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
		<p class="col-sm-4">&copy; 2018 Mav</p>
		<ul class="col-sm-8">
	<!-- 		<li class="col-sm-1">...</li>  -->
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