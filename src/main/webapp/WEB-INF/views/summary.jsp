<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="fragments/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Summary</title>
</head>

<body>
	<h1>To jest widok summary.jsp</h1>
	<h3>Rezerwację dodano do bazy.</h3>
	
			
		<h3>Długość wynajmu w dniach: ${rentLengthInDays}</h3>
		<!--  <h3>Długość wynajmu w godzinach: ${rentLengthInHours}</h3> -->
		<h3 style="display:inline">Całkowity koszt wynajmu: </h3> <h3 style="display:inline"><b style="color: red">${rentCost} złotych</b></h3>
		<br><br>
		
		
	<h3>Tutaj będzie można wybrać do swojej rezerwacji opcje dodatkowe
		takie jak np. nawigacja, fotelik dla dziecka czy bagażnik dachowy, a
		także zobaczyć cenę końcową do zapłaty przy odbiorze auta.</h3>
		<br>

	<div class="row">
		<figure class="col-sm-1"> </figure>
		<figure class="col-sm-2"> <a
			href="<%out.print(request.getContextPath());%>/"> powrót do
			strony głównej</a> </figure>
	</div>
</body>
</html>