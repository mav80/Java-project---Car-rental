<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body class="margin">
		<h3>To jest widok testCarClass</h3>
		
		<c:forEach items="${carclasses}" var="carclass">
			Klasa: ${carclass.carClass}<br>
			Opis: ${carclass.carClassDescription}<br>
			Cena za dobę: ${carclass.pricePerDay}
			<br>
			<br>
		</c:forEach>	
		
	</body>
</html>
<%@ include file="fragments/footer.jsp"%>