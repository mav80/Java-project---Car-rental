<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Panel użytkownika</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/bootstrap-material-design.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/ripples.min.css" />
<link rel="stylesheet"
	href="http://localhost:8080/EndProject-CarRental/static/css/bootstrap-material-datetimepicker.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://localhost:8080/EndProject-CarRental/static/css/style.css">

<script src="https://code.jquery.com/jquery-1.12.3.min.js"
	integrity="sha256-aaODHAgvwQW1bFOGXMeX+pC4PZIPsvn2h1sArYOhgXQ="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
<script type="text/javascript"
	src="https://rawgit.com/FezVrasta/bootstrap-material-design/master/dist/js/material.min.js"></script>
<script type="text/javascript"
	src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
<script type="text/javascript"
	src="http://localhost:8080/EndProject-CarRental/static/js/bootstrap-material-datetimepicker.js"></script>

<!-- datepicker -->

<script type="text/javascript">
	$(document).ready(function() {

		$('#date-format-begin').bootstrapMaterialDatePicker({
			weekStart : 1,
			format : 'YYYY-MM-DD', time: false
		});


		$('#date-format-end').bootstrapMaterialDatePicker({
			weekStart : 1,
			format : 'YYYY-MM-DD', time: false
		});

		$.material.init()
	});
</script>
</head>


<body>
	<h3>To jest widok panelUser.jsp</h3>
	

	<c:if test="${empty loggedUser}">
		<p>Musisz się najpierw zalogować</p>
		<a href="http://localhost:8080/EndProject-CarRental/login">strona
			logowania</a>
		<br>
		<br>

		<a href="http://localhost:8080/EndProject-CarRental/">powrót do
			strony głównej</a>
	</c:if>


	<c:if test="${not empty loggedUser}">
	
	<b>${userProfileChangedSuccessfully}</b><br><br>
	
	Oto wszystkie twoje rezerwacje:<br><br>

		<c:forEach items="${orders}" var="order">
		<div class="row">
			<list>
			<ul>
		<figure class="col-sm-1">
		</figure>
		
			<figure class="col-sm-3">
				<li>Data stworzenia rezerwacji: ${order.created}
				<li>Miejsce odbioru auta: ${order.address.name},
					${order.address.street}, ${order.address.zipCode},
					${order.address.city}</li>
			</figure>
				<figure class="col-sm-2">
				<li>Data odbioru auta: ${order.pickupDate}</li>
				<li>Data zwrotu auta: ${order.returnDate}</li>
			</figure>
			<figure class="col-sm-4">
				<li>Klasa zarezerwowanego auta: ${order.carClass.carClassDescription}</li>
			</figure>
			
		<figure class="col-sm-2">
						<a href="http://localhost:8080/EndProject-CarRental/editOrder/${order.id}">edytuj rezerwację</a><br>
				<a href="http://localhost:8080/EndProject-CarRental/deleteOrderUser/${order.id}">usuń rezerwację</a>
		</figure>

	
			</ul>
			</list>
			</div>
			<br>


		</c:forEach>


		<br>
		<br>
		
			<br> <br>
			<div class="row">
					<figure class="col-sm-1">
		</figure>
	<figure class="col-sm-2">
	<a href="http://localhost:8080/EndProject-CarRental/userEditProfile/${loggedUser.id}">edytuj swoje dane osobowe</a>
	</figure>
	</div>
<div class="row">
		<figure class="col-sm-1">
		</figure>
		<figure class="col-sm-2">
		<a href="http://localhost:8080/EndProject-CarRental/">   powrót do
			strony głównej</a>
			</figure>
</div>
	</c:if>
	




</body>
</html>