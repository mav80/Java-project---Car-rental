<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/bootstrap-material-design.min.css" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/ripples.min.css" />
      <link rel="stylesheet" href="<%out.print(request.getContextPath());%>/static/css/bootstrap-material-datetimepicker.css" />
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <link rel="stylesheet" href="<%out.print(request.getContextPath());%>/static/css/style.css">
      
      <script src="https://code.jquery.com/jquery-1.12.3.min.js" integrity="sha256-aaODHAgvwQW1bFOGXMeX+pC4PZIPsvn2h1sArYOhgXQ=" crossorigin="anonymous"></script>
      <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
      <script type="text/javascript" src="https://rawgit.com/FezVrasta/bootstrap-material-design/master/dist/js/material.min.js"></script>
      <script type="text/javascript" src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
      <script type="text/javascript" src="<%out.print(request.getContextPath());%>/static/js/bootstrap-material-datetimepicker.js"></script>
      
            <script type="text/javascript" src="<%out.print(request.getContextPath());%>/static/js/site.js"></script>
      
      <!-- datepicker -->
		<script type="text/javascript">
			$(document).ready(function() {
		
				$('#date-format-begin').bootstrapMaterialDatePicker({
					weekStart : 1, lang : 'pl', cancelText : 'Anuluj',
					format : 'YYYY-MM-DD', time: false
				});
		
		
				$('#date-format-end').bootstrapMaterialDatePicker({
					weekStart : 1, lang : 'pl', cancelText : 'Anuluj',
					format : 'YYYY-MM-DD', time: false
				});
		
				$.material.init()
			});
		</script>
      
      <!-- Carousel Plugin -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <style>
         .carousel-inner>.item>img, .carousel-inner>.item>a>img {
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

	</div>
	</div>
   </section>
   </body>
</html>