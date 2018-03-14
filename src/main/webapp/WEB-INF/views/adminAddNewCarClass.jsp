<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="fragments/header.jsp"%>
<html>
	<head>
		<script src="<%out.print(request.getContextPath());%>/static/js/panelAdmin.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Panel administracyjny</title>
	</head>
	
	<body class="margin">
	
		<!-- <h3>Dodawanie nowej klasy auta</h3> -->
		
		<c:if test="${empty loggedUser}">
			<p>Nie masz odpowiednich uprawnień.</p>	
		</c:if>
		
		<c:if test="${loggedUser.admin == false}">
			<p>Nie masz odpowiednich uprawnień.</p>
		</c:if>
		
		<c:if test="${loggedUser.admin == true}">
			<!--   <p>Masz odpowiednie uprawnienia</p> -->
			
			<form:form method="post" modelAttribute="carClass">
		
				Klasa auta<br>
				<form:input path="carClassa" placeholder="klasa auta"/> 			<form:errors path="carClassa" style="font-weight: bold; font-style: italic; color: red"/><br><br>
				
				Opis (widoczny przy tworzeniu nowego zamówienia)<br>		
				<form:input path="carClassDescription" placeholder="opis"/>			<form:errors path="carClassDescription" style="font-weight: bold; font-style: italic; color: red"/><br><br>
				
				Cena za dzień<br>	
				<form:input type="number" path="pricePerDay"/>						<form:errors path="pricePerDay" style="font-weight: bold; font-style: italic; color: red"/><br><br>
						
				Czy klasa jest aktywna (brak ptaszka = niewidoczna dla użytkowników) ?  <form:checkbox path="active" /><br>
				
				<br><input type="submit" value="${buttonMessage}">
		
			</form:form>
	
		</c:if>
		
	</body>
</html>
<%@ include file="fragments/footer.jsp"%>