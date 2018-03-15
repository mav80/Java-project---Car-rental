<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="fragments/header.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Panel użytkownika</title>
		<link rel="stylesheet" href="<%out.print(request.getContextPath());%>/static/css/style.css">
	</head>
	
	
	<body class="margin">
		<h3>Panel użytkownika</h3>
	
		<c:if test="${empty loggedUser}">
			<p>Musisz się najpierw zalogować.</p>
			<a href="<%out.print(request.getContextPath());%>/login">Przejdź na stronę logowania</a><br><br>
		</c:if>
	
	
		<c:if test="${not empty loggedUser}">
	
			<p style="color: red">
				<b>${param.message}</b>
			</p>
			
			
			<c:if test="${not empty orders}">
				${modelInfo}<br><br>
			</c:if>
			
			<c:if test="${empty orders}">
			 Nie masz jeszcze żadnych rezerwacji.<br><br>
			</c:if>
			
			
			<section class="mytable">
				<table>
					<c:forEach items="${orders}" var="order">
						
						<div class="row">
						
							<tr>
							
								<td>
									<list>
										<ul>
											<li>Data stworzenia rezerwacji: ${order.created}
											<li>Miejsce odbioru auta: ${order.address.name}, ${order.address.street}, ${order.address.zipCode}, ${order.address.city}</li>
										</ul>
									</list>
								</td>
								
								<td>
									<list>
										<ul>
											<li>Data odbioru auta: ${order.pickupDate}</li>
											<li>Data zwrotu auta: ${order.returnDate}</li>
										</ul>
									</list>
								</td>
								
								<td>
									<list>
										<ul>
											<li>Klasa zarezerwowanego auta: ${order.carClass.carClassDescription}</li>
										
											<c:if test="${not empty order.extras}">
												<li><b>Wybrane dodatki:</b>	
													<c:forEach items="${order.extras}" var="extra">
														${extra.description},
													</c:forEach>
												</li>
											</c:if>
					
											<li>Dni wynajmu: ${order.rentLengthInDays}, Numer referencyjny: <b style="color: blue">${order.referenceNumber}</b>, <b style="color: red">Cena: ${order.orderPrice}</b></li>
										</ul>
									</list>
								</td>
								
								
								<td>
									<c:if test="${order.active == true}">
										<list>
											<ul>				
												<li><a href="<%out.print(request.getContextPath());%>/editOrder/${order.id}">edytuj rezerwację</a></li>
												<li><a class="confirm" href="<%out.print(request.getContextPath());%>/deleteOrderUser/${order.id}">usuń rezerwację</a></li>
											</ul>
										</list>
									</c:if>
									
									<c:if test="${order.active == false}">			
										rezerwacja przeniesiona do archiwum
									</c:if>
									
								</td>
							
							</tr>
						
						</div>  <!--  koniec div "row" -->

					</c:forEach>
				
				</table>
			</section>
			
			
			<form>
				<input type="hidden" name="showAll" value="true">
				<br><input type="submit" value="Pokaż wszystkie moje rezerwacje"><br><br>
			</form>

			

			<a style="color: red" href="<%out.print(request.getContextPath());%>/userEditProfile/${loggedUser.id}"><h4>Zmień swoje dane osobowe.</h4></a>
			<!--   <a href="<%out.print(request.getContextPath());%>/">powrót do strony głównej</a> -->

		</c:if>
	</body>
</html>
<%@ include file="fragments/footer.jsp"%>