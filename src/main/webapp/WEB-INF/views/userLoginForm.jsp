<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="fragments/header.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Logowanie</title>
	</head>
	
	<body class="margin">
		${info}<h3 style="color: blue">${param.success}</h3>
		<h3>Zaloguj się:</h3>
		
		<form method="post">
		
			Email<br> 
			<input type="text" name="email" placeholder="email"><br>
			
			Hasło<br>
			<input type="password" name="password" placeholder="hasło"><br>
			
			<input type="submit" value="zaloguj">
	
		</form>
		
		<br>
	 	<!-- <a href="<%out.print(request.getContextPath());%>/">powrót do strony głównej</a> </figure> -->
	
	
	</body>
</html>
<%@ include file="fragments/footer.jsp"%>