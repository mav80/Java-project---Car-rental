<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
		<h3 style="display:inline">Numer referencyjny rezerwacji:  </h3> <h3 style="display:inline"><b style="color: blue">${rentReferenceNumber}</b></h3><br>
		<h3 style="display:inline">Całkowity koszt wynajmu: </h3> <h3 style="display:inline"><b style="color: red">${rentCost} złotych</b></h3>
		<br>
		<br>
		
		
	<h3>Tutaj będzie można wybrać do swojej rezerwacji opcje dodatkowe
		takie jak np. nawigacja, fotelik dla dziecka czy bagażnik dachowy, a
		także zobaczyć cenę końcową do zapłaty przy odbiorze auta.</h3>
		<br>
		
		
		
		
		
		Wybierz dodatki które chcesz dodać do swojej rezerwacji:
		
		
		<form:form action="summary2" modelAttribute="order" method="post">
		
			<form:hidden path="created" value="${order.created}"/> Created: ${order.created}
			<form:errors path="created"/><br>
			<form:hidden path="pickupDate" value="${order.pickupDate}"/>
			<form:errors path="pickupDate"/><br>
			<form:hidden path="returnDate" value="${order.returnDate}"/>
			<form:errors path="returnDate"/><br>
			<form:hidden path="user" value="${order.user.id}"/>
			<form:errors path="user"/><br>
			<form:hidden path="address" value="${order.address.id}"/>
			<form:errors path="address"/><br>
			<form:hidden path="carClass" value="${order.carClass.id}"/>
			<form:errors path="carClass"/><br>
			<form:hidden path="rentLengthInDays" value="${order.rentLengthInDays}"/>
			<form:errors path="rentLengthInDays"/><br>
			<form:hidden path="orderPrice" value="${order.orderPrice}"/>
			<form:errors path="orderPrice"/><br>
			<form:hidden path="referenceNumber" value="${order.referenceNumber}"/>
			<form:errors path="referenceNumber"/><br>
			
			<form:checkboxes path="extras" items="${extras}" itemLabel="description" itemValue="id"/><br>
	
			<input type="submit" value="Dodaj">
			
		</form:form> <br>
		
		
			<form:form action="summary2" modelAttribute="order" method="post">
			
			<form:hidden path="created" value="${order.created}"/>
			<form:errors path="created"/><br>
			<form:hidden path="pickupDate" value="${order.pickupDate}"/>
			<form:errors path="pickupDate"/><br>
			<form:hidden path="returnDate" value="${order.returnDate}"/>
			<form:errors path="returnDate"/><br>
			<form:hidden path="user" value="${order.user.id}"/>
			<form:errors path="user"/><br>
			<form:hidden path="address" value="${order.address.id}"/>
			<form:errors path="address"/><br>
			<form:hidden path="carClass" value="${order.carClass.id}"/>
			<form:errors path="carClass"/><br>
			<form:hidden path="rentLengthInDays" value="${order.rentLengthInDays}"/>
			<form:errors path="rentLengthInDays"/><br>
			<form:hidden path="orderPrice" value="${order.orderPrice}"/>
			<form:errors path="orderPrice"/><br>
			<form:hidden path="referenceNumber" value="${order.referenceNumber}"/>
			<form:errors path="referenceNumber"/><br>
			
			<c:forEach items="${extras}" var="extra">
			<form:checkbox path="extras" value="${extra.id}" itemLabel="description" itemValue="id"/> ${extra.description}<br>
			</c:forEach>
			
			<input type="submit" value="Dodaj">
		</form:form> <br>
		
		
		Błędy:<br>
		
			<c:forEach items="${errors}" var="error">
			${error}<br>
			</c:forEach>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	<div class="row">
		<figure class="col-sm-1"> </figure>
		<figure class="col-sm-2"> 
	<%@ include file="fragments/footer.jsp"%> </figure>
	</div>
</body>
</html>