<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UserRegistrationForm</title>
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
	<h1>To jest widok userRegistrationForm.jsp</h1>

	<form:form method="post" modelAttribute="user">

Imię i nazwisko<br>
		<form:input path="username" placeholder="imię i nazwisko"/><br>
		<form:errors path="username"/><br>

Adres email<br>		
		<form:input path="email" placeholder="adres email"/><br>
		<form:errors path="email"/><br>

Wiek (minimum 18 lat)<br>	
		<form:input path="age"/><br>
		<form:errors path="age"/><br>

Numer telefonu komórkowego (9 cyfr)<br>
		<form:input path="phone"/><br>
		<form:errors path="phone"/><br>
Hasło<br>		
		<form:password path="password" placeholder="hasło"/><br>
		<form:errors path="password"/><br>
		
		<input type="submit" value="zarejestruj">

	</form:form>
	
			<br>
	<div class="row">
		<figure class="col-sm-1"> </figure>
		<figure class="col-sm-2"> <a
			href="http://localhost:8080/EndProject-CarRental/"> powrót do
			strony głównej</a> </figure>
	</div>



</body>
</html>