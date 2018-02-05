<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Panel administracyjny</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/bootstrap-material-design.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/ripples.min.css" />
<link rel="stylesheet"
	href="<%out.print(request.getContextPath());%>/static/css/bootstrap-material-datetimepicker.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%out.print(request.getContextPath());%>/static/css/style.css">

<script src="https://code.jquery.com/jquery-1.12.3.min.js"
	integrity="sha256-aaODHAgvwQW1bFOGXMeX+pC4PZIPsvn2h1sArYOhgXQ="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
<script type="text/javascript"
	src="https://rawgit.com/FezVrasta/bootstrap-material-design/master/dist/js/material.min.js"></script>
<script type="text/javascript"
	src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
<script type="text/javascript"
	src="<%out.print(request.getContextPath());%>/static/js/bootstrap-material-datetimepicker.js"></script>

<!-- datepicker -->

<script type="text/javascript">
	$(document).ready(function() {

		$('#date-format-begin').bootstrapMaterialDatePicker({
			weekStart : 1,
			format : 'YYYY-MM-DD', time: false
		});


		$('#date-format-end').bootstrapMaterialDatePicker({
			weekStart : 1,
			format : 'YYYY-MM-DD', time: false
		});

		$.material.init()
	});
</script>
</head>


<body>
	<h3>Panel administracyjny</h3>
	
	<c:if test="${empty loggedUser}">
		<p>Nie masz odpowiednich uprawnień</p>

		<a href="<%out.print(request.getContextPath());%>/">powrót do
			strony głównej</a>
	</c:if>

	<c:if test="${loggedUser.isAdmin == false}">
		<p>Nie masz odpowiednich uprawnień</p>

		<a href="<%out.print(request.getContextPath());%>/">powrót do
			strony głównej</a>
	</c:if>

	<c:if test="${loggedUser.isAdmin == true}">
		<p>Masz odpowiednie uprawnienia</p>
		
			<b>${userProfileChangedSuccessfully}</b><br>
			
			<p><b>Zarządzanie zamówieniami</b></p>
		
		<div class="row">
		
		<figure class="col-sm-1">
		</figure>
		
			<figure class="col-sm-3">

			<form>
			Podaj id użytkownika którego rezerwacje chcesz odnaleźć:<br> 
			<input type="number" name="userId" min="1" placeholder="Podaj id"><br>
			<input type="submit" value="Wyszukaj"> <br>
			<br> 
			</form>
			
			<form>
			<br>Pokaż wszystkie rezerwacje znajdujące się w bazie<br>
			<input type="hidden" name="showAll" value="true">
			<input type="submit" value="Pokaż"><br>
			</form>
			

			</figure>

			
			<figure class="col-sm-4">
			<form>
			Podaj email użytkownika którego rezerwacje chcesz odnaleźć:<br>
			<input type="text" name="email" placeholder="Podaj email"><br>
			<input type="submit" value="Wyszukaj"> <br>
			<br> 
			</form>
			
			
			<form>
			Podaj imię użytkownika którego rezerwacje chcesz odnaleźć:<br>
			<input type="text" name="name" placeholder="Podaj imię"><br>
			<input type="submit" value="Wyszukaj"> <br>
			<br> 
			</form>
			
			</figure>
			
			<figure class="col-sm-3">
			<form>
			Wyszukaj rezerwacje utworzone pomiędzy określonymi datami:<br>
			<input type="text" name="startDate" id="date-format-begin" class="form-control floating-label" placeholder="Data początkowa" />
			<input type="text" name="endDate" id="date-format-end" class="form-control floating-label" placeholder="Data końcowa" />
			<input type="submit" value="Wyszukaj"><br>
			</form>
			</figure>
			
			<figure class="col-sm-1">
			</figure>
			
			</div>
			

<p><b>Zarządzanie użytkownikami</b></p>
		

		<!-- <p>Oto rezerwacje które wyszukałeś:</p>  -->
		<br>${searchResultMessage}<br><br>

	<table>


		<c:forEach items="${orders}" var="order">
		

		
	<div class="row">
				
		
		<tr>

				<td>
				
					<list>
						<ul>
							<li>ID rezerwacji: ${order.id}</li>
							<li>ID użytkownika: ${order.user.id}</li>
							<li>Imię użytkownika: ${order.user.username}</li>
						</ul>
					</list>
				

				</td>
				
				<td>
				
					<list>
						<ul>
							<li>Email użytkownika: ${order.user.email}</li>
							<li>Data stworzenia rezerwacji: ${order.created}
							<li>Miejsce odbioru auta: ${order.address.name},
								${order.address.street}, ${order.address.zipCode},
								${order.address.city}</li>
						</ul>
					</list>

				</td>
				
				<td>
					<list>
						<ul>

							<li>Data odbioru auta: ${order.pickupDate}</li>
							<li>Data zwrotu auta: ${order.returnDate}</li>
							<li>Klasa zarezerwowanego auta:
								${order.carClass.carClassDescription}</li>

				</td>
						</ul>
					</list>

			

			
			<td>
				<list>
					<ul>

						<li><a	href="<%out.print(request.getContextPath());%>/adminEditOrder/${order.id}">edytuj	rezerwację</a></li>

						<li><a	href="<%out.print(request.getContextPath());%>/deleteOrderAdmin/${order.id}">usuń	rezerwację</a></li>

						<li><a	href="<%out.print(request.getContextPath());%>/adminEditUser/${order.user.id}">edytuj	użytkownika</a></li>
			
					</ul>
				</list>
			</td>
		
		</tr>

	</div> <!--  koniec div "row" -->

		</c:forEach>
		
		
		</table>

		<br>
		<br>


		<a href="<%out.print(request.getContextPath());%>/">powrót do
			strony głównej</a>
	</c:if>



	</body>
</html>