<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>userForm</title>
</head>
<body>
	<h1>To jest widok userForm.jsp</h1>

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



</body>
</html>