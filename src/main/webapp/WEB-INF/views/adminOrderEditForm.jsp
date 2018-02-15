<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="fragments/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin - edycja rezerwacji</title>
</head>

<body>
	<h3>WAŻNE! Jako admin masz możliwość dowolnego ustawienia dat w zamówieniu, np. data początkowa może być późniejsza niż końcowa - uważaj aby nie narobić błędów!</h3>

	<c:if test="${empty loggedUser}">
		<p>Musisz się najpierw zalogować</p>

		<a href="<%out.print(request.getContextPath());%>/">powrót do
			strony głównej</a>
	</c:if>

	<c:if test="${empty order}">
		<p>Musisz się najpierw zalogować</p>

		<a href="<%out.print(request.getContextPath());%>/">powrót do
			strony głównej</a>
	</c:if>




	<c:if test="${loggedUser.isAdmin == false}">
		<p>Nie masz odpowiednich uprawnień do edycji tego zamówienia</p>

		<a href="<%out.print(request.getContextPath());%>/">powrót do
			strony głównej</a>
	</c:if>

	<c:if test="${loggedUser.isAdmin == true}">




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
			<br><br>
			
			<p>Kod referencyjny:</p>
			<form:input path="referenceNumber" />	<form:errors path="referenceNumber" style="font-weight: bold; font-style: italic; color: red"/>
			<form:hidden path="user.id" />

			<br>
			<br>
			<input type="submit" value="Zmień rezerwację">
		</form:form>

	</c:if>

</body>
<%@ include file="fragments/footer.jsp"%>
</html>