<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="fragments/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Panel użytkownika</title>
</head>


<body>
	<h3>To jest widok panelUser.jsp</h3>


	<c:if test="${empty loggedUser}">
		<p>Musisz się najpierw zalogować</p>
		<a href="<%out.print(request.getContextPath());%>/login">strona
			logowania</a>
		<br>
		<br>

		<a href="<%out.print(request.getContextPath());%>/">powrót do
			strony głównej</a>
	</c:if>


	<c:if test="${not empty loggedUser}">

		<p style="color: red">
			<b>${param.message}</b>
		</p>
	
	Oto wszystkie twoje rezerwacje:<br>
		<br>

		<c:forEach items="${orders}" var="order">
			<div class="row">
				<list>
				<ul>
					<figure class="col-sm-1"> </figure>

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
					<li>Klasa zarezerwowanego auta:
						${order.carClass.carClassDescription}</li>
						<li>Dni wynajmu: ${order.rentLengthInDays}, <b style="color: red">Cena: ${order.orderPrice}</b></li>
					</figure>

					<figure class="col-sm-2"> <a
						href="<%out.print(request.getContextPath());%>/editOrder/${order.id}">edytuj
						rezerwację</a>
					<br>
					<a
						href="<%out.print(request.getContextPath());%>/deleteOrderUser/${order.id}">usuń
						rezerwację</a> </figure>


				</ul>
				</list>
			</div>
			<br>
		</c:forEach>


		<br>
		<br>

		<br>
		<br>
		<div class="row">
			<figure class="col-sm-1"> </figure>
			<figure class="col-sm-2"> <a style="color: red"
				href="<%out.print(request.getContextPath());%>/userEditProfile/${loggedUser.id}"><h4>edytuj
					swoje dane osobowe</h4></a> </figure>
		</div>
		<div class="row">
			<figure class="col-sm-1"> </figure>
			<figure class="col-sm-2"> <a
				href="<%out.print(request.getContextPath());%>/"> powrót do	strony głównej</a> </figure>
		</div>
	</c:if>





</body>
</html>