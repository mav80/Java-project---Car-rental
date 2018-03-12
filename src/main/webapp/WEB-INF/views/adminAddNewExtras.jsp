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
	
		<!-- <h3>Dodawanie nowego dodatku</h3> -->
		
		<c:if test="${empty loggedUser}">
			<p>Nie masz odpowiednich uprawnień.</p>	
		</c:if>
		
		<c:if test="${loggedUser.admin == false}">
			<p>Nie masz odpowiednich uprawnień.</p>
		</c:if>
		
		<c:if test="${loggedUser.admin == true}">
			<!--   <p>Masz odpowiednie uprawnienia</p> -->
			
			<form:form method="post" modelAttribute="extras">
		
				Nazwa (niewidoczne dla użytkownika)<br>
				<form:input path="name" placeholder="nazwa"/> 				<form:errors path="name" style="font-weight: bold; font-style: italic; color: red"/><br><br>
				
				Opis (widoczne dla użytkownika)<br>		
				<form:input path="description" placeholder="opis"/>		<form:errors path="description" style="font-weight: bold; font-style: italic; color: red"/><br><br>
				
				Cena (zł) za dzień<br>	
				<form:input type="number" path="pricePerDay"/>			<form:errors path="pricePerDay" style="font-weight: bold; font-style: italic; color: red"/><br><br>
				
				Nazwa obrazka z katalogu images/extras (widoczne dla użytkownika - np. test01.png)<br>		
				<form:input path="image" placeholder="nazwa obrazka"/> <form:errors path="image" style="font-weight: bold; font-style: italic; color: red"/><br><br>
				
						
				Czy dodatek jest aktywny (brak ptaszka = niewidoczny dla użytkowników) ? <form:checkbox path="active" /><br>
				
				<br><input type="submit" value="${buttonMessage}">
		
			</form:form>
			
			
			
			
			
		</c:if>
		
	</body>
</html>
<%@ include file="fragments/footer.jsp"%>