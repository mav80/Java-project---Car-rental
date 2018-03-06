<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="fragments/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="margin">

<h1>Zamówienie pomyślnie dodano do bazy</h1>

<h3 style="display:inline">Numer referencyjny Twojej rezerwacji:  </h3> <h3 style="display:inline"><b style="color: blue">${rentReferenceNumber}</b></h3><br>

<br><a href="<%out.print(request.getContextPath());%>/panelUser">przejdź do panelu użytkownika</a>
</body>

<%@ include file="fragments/footer.jsp"%>
</html>