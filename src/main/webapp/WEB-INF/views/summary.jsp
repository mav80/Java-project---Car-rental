<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="fragments/header.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Summary</title>
		<script src="<%out.print(request.getContextPath());%>/static/js/summary.js"></script>
	</head>

	<body class="margin">
	${errors}
		<h1>Oto Twoja rezerwacja</h1>
				
		<h3>Długość wynajmu w dniach: ${rentLengthInDays}</h3>
		<!--  <h3>Długość wynajmu w godzinach: ${rentLengthInHours}</h3> -->
		<h3 style="display:inline">Koszt wynajmu (cena auta * liczba dni): </h3> <h3 style="display:inline"><b style="color: red">${rentCost} złotych</b></h3>
		<br>
		<br>
			
		
		<h3>Czy chcesz dodać coś do swojego zamówienia?</h3>
			
		<form:form action="summary2" modelAttribute="order" method="post">
		
			<form:hidden path="created" value="${order.created}"/>
			<form:errors path="created"/>
			<form:hidden path="pickupDate" value="${order.pickupDate}"/>
			<form:errors path="pickupDate"/>
			<form:hidden path="returnDate" value="${order.returnDate}"/>
			<form:errors path="returnDate"/>
			<form:hidden path="user" value="${order.user.id}"/>
			<form:errors path="user"/>
			<form:hidden path="address" value="${order.address.id}"/>
			<form:errors path="address"/>
			<form:hidden path="carClass" value="${order.carClass.id}"/>
			<form:errors path="carClass"/>
			<form:hidden path="rentLengthInDays" value="${order.rentLengthInDays}"/>
			<form:errors path="rentLengthInDays"/>
			<form:hidden path="orderPrice" value="${order.orderPrice}"/>
			<form:errors path="orderPrice"/>
			<form:hidden path="referenceNumber" value="${order.referenceNumber}"/>
			<form:errors path="referenceNumber"/>
			
			<table>
			
				<tr>
					<td></td>
					<td>Nazwa dodatku</td>
					<td>Cena (złotych/dzień)</td>
					<td>Cena zamówienia zwiększy się o (złotych)</td>
				</tr>
			
				<c:forEach items="${extras}" var="extra">
					<tr class="extrasCheckboxRow">
						<td><img src="${pageContext.request.contextPath}/static/images/extras/${extra.image}"></td>
						<td id="extrasNo${extra.id}"><form:checkbox path="extras" value="${extra}" itemLabel="description" itemValue="id" class="checkboxes"/> ${extra.description}<br></td>
						<td>${extra.pricePerDay} zł</td>
						<td id="extrasNo${extra.id}TotalPrice"class="extrasTotalPrice">${extra.pricePerDay * order.rentLengthInDays}</td>
					</tr>
				</c:forEach>
			
			</table>
			<br>
			
			<h3 style="display:inline">Całkowity koszt wynajmu (z wybranymi dodatkami): </h3> <h3 style="display:inline"><b id="totalCost" style="color: red">${rentCost}</b> złotych</h3><br><br>
			
			<input type="submit" value="Dodaj wybrane dodatki i złóż zamówienie">
		</form:form> <br>
			
			
			
	
		<div class="row">
			<figure class="col-sm-1"> </figure>
			<figure class="col-sm-2"> 
	
		</div>
	</body>
	<%@ include file="fragments/footer.jsp"%> </figure>
</html>