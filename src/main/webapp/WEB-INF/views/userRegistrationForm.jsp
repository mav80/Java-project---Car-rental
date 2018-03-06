<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="fragments/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rejestrowanie nowego użytkownika</title>
</head>

<body class="margin">

	<c:if test="${empty user.username}">
	  	<h1>Rejestrowanie nowego użytkownika</h1>
	</c:if>
			
	
	<h3>Wszystkie pola są konieczne. Do późniejszego logowania użyte będą email oraz hasło.</h3>

	<form:form method="post" modelAttribute="user">

Imię i nazwisko<br>
		<form:input path="username" placeholder="imię i nazwisko"/> <form:errors path="username"  style="font-weight: bold; font-style: italic; color: red"/><br><br>
		
Adres email (potrzebne do logowania)<br>		
		<form:input path="email" placeholder="adres email"/> <form:errors path="email" style="font-weight: bold; font-style: italic; color: red"/><br> <br>	 

Wiek (minimum 18 lat)<br>	
		<form:input path="age" type="number"/> <form:errors path="age"  style="font-weight: bold; font-style: italic; color: red"/><br><br>
		
Numer telefonu komórkowego (9 cyfr)<br>
		<form:input path="phone" type="number"/> <form:errors path="phone"  style="font-weight: bold; font-style: italic; color: red"/><br><br>
		
Hasło<br>		
		<form:password path="password" placeholder="hasło"/> <form:errors path="password"  style="font-weight: bold; font-style: italic; color: red"/><br><br>
		
		
		<input type="submit" value="zarejestruj">

	</form:form>
	
			<br>
 <!-- <a href="<%out.print(request.getContextPath());%>/"> powrót do	strony głównej</a> </figure> -->




</body>
</html>
<%@ include file="fragments/footer.jsp"%>