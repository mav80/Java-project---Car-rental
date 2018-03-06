<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="fragments/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin - edycja profilu użytkownika</title>
</head>
<body class="margin">

	<h3>To jest widok adminUserEditForm.jsp</h3>
	

	<c:if test="${empty loggedUser}">
		<p>Musisz się najpierw zalogować</p>
		<a href="<%out.print(request.getContextPath());%>/login">strona
			logowania</a>
		<br>
		<br>

		<a href="<%out.print(request.getContextPath());%>/">powrót do
			strony głównej</a>
	</c:if>
	
	
<c:if test="${loggedUser.isAdmin == false}">
		<p>Nie masz odpowiednich uprawnień</p>

		<a href="<%out.print(request.getContextPath());%>/">powrót do
			strony głównej</a>
</c:if>


<c:if test="${loggedUser.isAdmin == true}">
		<p>Jesteś adminem, możesz działać</p>
		
		
		
		
			<form:form method="post" modelAttribute="user">

Imię i nazwisko<br>
		<form:input path="username" placeholder="imię i nazwisko"/><br>
		<form:errors path="username"/><br>

Adres email<br>		
		<form:input path="email" placeholder="adres email"/><br>
		<form:errors path="email"/><br>

Wiek (minimum 18 lat)<br>	
		<form:input type="number" path="age"/><br>
		<form:errors path="age"/><br>

Numer telefonu komórkowego (9 cyfr)<br>
		<form:input type="number" path="phone"/><br>
		<form:errors path="phone"/><br>
Hasło<br>		
		<form:input path="password" placeholder="hasło"/><br>
		<form:errors path="password"/><br>
		
Czy użytkownik jest aktywny (brak ptaszka = zbanowany) ? <form:checkbox path="enabled" /><br>
		
		<input type="submit" value="zarejestruj">

	</form:form>
		
		
		
		
		
		
		
		

		<!-- <a href="<%out.print(request.getContextPath());%>/">powrót do strony głównej</a> -->
</c:if>
	
	


	</body>
</html>

<%@ include file="fragments/footer.jsp"%>