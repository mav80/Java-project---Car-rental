<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edycja rezerwacji</title>

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
			format : 'YYYY-MM-DD HH:mm:ss',
			minDate : new Date()
		});

		var tomorrow = new Date();
		tomorrow.setDate(tomorrow.getDate() + 1);

		$('#date-format-end').bootstrapMaterialDatePicker({
			weekStart : 1,
			format : 'YYYY-MM-DD HH:mm:ss',
			minDate : tomorrow
		});

		$.material.init()
	});
</script>


<!-- Carousel Plugin -->

<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 65%;
	margin: auto;
}
</style>

<script>
	$(document).ready(function() {
		// Activate Carousel
		$("#myCarousel").carousel();

		// Enable Carousel Indicators
		$(".item1").click(function() {
			$("#myCarousel").carousel(0);
		});
		$(".item2").click(function() {
			$("#myCarousel").carousel(1);
		});
		$(".item3").click(function() {
			$("#myCarousel").carousel(2);
		});
		$(".item4").click(function() {
			$("#myCarousel").carousel(3);
		});

		// Enable Carousel Controls
		$(".left").click(function() {
			$("#myCarousel").carousel("prev");
		});
		$(".right").click(function() {
			$("#myCarousel").carousel("next");
		});
	});
</script>
</head>
<body>
	<h3>To jest widok orderEditForm</h3>

	<c:if test="${empty loggedUser}">
		<p>Musisz się najpierw zalogować</p>

		<a href="http://localhost:8080/EndProject-CarRental/">powrót do
			strony głównej</a>
	</c:if>

	<c:if test="${empty order}">
		<p>Musisz się najpierw zalogować</p>

		<a href="http://localhost:8080/EndProject-CarRental/">powrót do
			strony głównej</a>
	</c:if>




	<c:if test="${loggedUser.id != order.user.id}">
		<p>Nie masz odpowiednich uprawnień do edycji tego zamówienia</p>

		<a href="http://localhost:8080/EndProject-CarRental/">powrót do
			strony głównej</a>
	</c:if>

	<c:if test="${loggedUser.id == order.user.id}">




		<form:form modelAttribute="order" method="post">

			<p>Miejsce odbioru i zwrotu:</p>
			<form:select path="address.id" items="${addresses}" itemLabel="name"
				itemValue="id" />
			<form:errors path="address.id" />
			<br>

			<br>

			<p>Data i godzina wypożyczenia:</p>
			<form:input path="pickupDate" id="date-format-begin"
				class="form-control floating-label" placeholder="Data wypożyczenia" />
			<!-- <form:errors path="pickupDate"/><br> -->
			<b>${dateError}</b>

			<p>Data i godzina zwrotu:</p>
			<form:input path="returnDate" id="date-format-end"
				class="form-control floating-label" placeholder="Data zwrotu" />
			<!-- <form:errors path="returnDate"/><br> -->
			<b>${dateError}</b>

			<p>Klasa auta:</p>
			<form:select path="carClass.id" items="${cars}"
				itemLabel="carClassDescription" itemValue="id" />
			<form:errors path="carClass.id" />
			<br>
			<form:hidden path="user.id" />

			<br>
			<br>
			<input type="submit" value="Zmień rezerwację">
		</form:form>

	</c:if>

</body>
</html>