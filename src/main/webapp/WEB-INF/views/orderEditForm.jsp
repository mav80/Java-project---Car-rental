<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="fragments/header.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Edycja rezerwacji</title>
	</head>
	
	<body class="margin">
			
		<c:if test="${empty loggedUser}">
			<p>Musisz się najpierw zalogować</p>
	
			<a href="<%out.print(request.getContextPath());%>/login">Zaloguj się</a><br><br>
		</c:if>
	
		<c:if test="${empty order}">
			<p>Taka rezerwacja nie istnieje.</p>
		</c:if>
	
	
	
	
		<c:if test="${loggedUser.id != order.user.id || order.active == false}">
			<p>Nie masz odpowiednich uprawnień do edycji tej rezerwacji.</p>
		</c:if>
	
		<c:if test="${loggedUser.id == order.user.id && order.active == true}">
	
			<h3>Edycja rezerwacji <b>${order.referenceNumber}</b>. Nowa cena końcowa będzie widoczna w panelu użytkownika.</h3>
	
	
			<form:form modelAttribute="order" method="post">
	
				<div style="display: inline-block">
					<p>Miejsce odbioru i zwrotu:</p>
					<form:select path="address.id" items="${addresses}" itemLabel="name" itemValue="id" />
					<form:errors path="address.id" />
				</div>
				
				<div style="display: inline-block; padding: 10px 100px">
					<p>Klasa auta:</p>
					<form:select path="carClass.id" items="${cars}" itemLabel="carClassDescription" itemValue="id" />
					<form:errors path="carClass.id"/>
				</div>
	
				<br>
	
				<div style="display: inline-block">
					<p>Data i godzina wypożyczenia:</p>
					<form:input path="pickupDate" id="date-format-begin" class="form-control floating-label" placeholder="Data wypożyczenia" />
					<form:errors path="pickupDate"/><br>
				</div>
				
				<div style="display: inline-block; padding: 10px 325px">
					<p>Data i godzina zwrotu:</p>
					<form:input path="returnDate" id="date-format-end" class="form-control floating-label" placeholder="Data zwrotu" />
					<form:errors path="returnDate"/><br>
					<b style="color: red">${dateError}</b>
				</div>
				
				
				<form:hidden path="user.id" />
				<form:hidden path="referenceNumber" />
				<form:hidden path="active"/>
	

				
				<table>
					
					<tr>
						<td></td>
						<td>Nazwa dodatku</td>
						<td>Cena (złotych/dzień)</td>
					</tr>
				
					<c:forEach items="${extras}" var="extra">
						<tr class="extrasCheckboxRow">
							<td><img src="<%out.print(request.getContextPath());%>/static/images/extras/${extra.image}"></td>
							<td id="extrasNo${extra.id}"><form:checkbox path="extras" value="${extra}" itemLabel="description"/> ${extra.description}<br></td>
							<td>${extra.pricePerDay} zł</td>
						</tr>
					</c:forEach>
			
				</table>
				<br>
				<input type="submit" value="Zmień rezerwację">
			</form:form>
	
		</c:if>
	
	</body>
	<%@ include file="fragments/footer.jsp"%>
</html>