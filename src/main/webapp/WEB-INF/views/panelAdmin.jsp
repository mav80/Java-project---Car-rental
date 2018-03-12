<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="fragments/headerAdmin.jsp"%>
<html>
	<head>
		<script src="<%out.print(request.getContextPath());%>/static/js/panelAdmin.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Panel administracyjny</title>
	</head>


	<body class="margin">
	
		<!-- <h3>Panel administracyjny</h3> -->
		
		<c:if test="${empty loggedUser}">
			<p>Nie masz odpowiednich uprawnień.</p>	
		</c:if>
		
		<c:if test="${loggedUser.admin == false}">
			<p>Nie masz odpowiednich uprawnień.</p>
		</c:if>
		
		<c:if test="${loggedUser.admin == true}">
			<!-- <p>Masz odpowiednie uprawnienia</p> -->
			
			<b>${userProfileChangedSuccessfully}</b><br>
			
			<p>
				<b>Zarządzanie rezerwacjami</b>
			</p>
			
			<div class="row">
			
				<figure class="col-sm-1"><input id="ordersButton" type="submit" value="Pokaż/ukryj"> </figure>
				
				<div id="ordersDiv" style="display: none">
					<table style="color: blue">
						<tr style="background-color: #e9e9e9">
						
						<td>
						
						
							<form>
								Podaj id użytkownika którego rezerwacje chcesz odnaleźć:<br>
								<input type="number" name="userId" min="1" placeholder="Podaj id"><br>
								<input type="submit" value="Wyszukaj"> <br> <br>
							</form>
							
							<form>
								Podaj numer referencyjny rezerwacji którą chcesz odnaleźć:<br>
								<input type="text" name="referenceNumber" placeholder="Podaj kod rezerwacji"><br>
								<input type="submit" value="Wyszukaj"> <br>
							</form>
							
							<form>
								<br>Pokaż wszystkie rezerwacje znajdujące się w bazie<br>
								<input type="hidden" name="showAll" value="true">
								<input type="submit" value="Pokaż"><br><br>
							</form>
							
						</td>
						
						
						<td>
						
							<form>
								Podaj email użytkownika którego rezerwacje chcesz odnaleźć:<br>
								<input type="text" name="email" placeholder="Podaj email"><br>
								<input type="submit" value="Wyszukaj"> <br> <br>
							</form>
							
							
							<form>
								Podaj imię użytkownika którego rezerwacje chcesz odnaleźć:<br>
								<input type="text" name="name" placeholder="Podaj imię"><br>
								<input type="submit" value="Wyszukaj"> <br> <br>
							</form>
							
						</td>
						
						
						
						<td>
						
						<form>
							Wyszukaj rezerwacje utworzone pomiędzy określonymi datami:<br>
							<input type="text" name="startDate" id="date-format-begin" class="form-control floating-label" placeholder="Data początkowa" /> 
							<input type="text" name="endDate" id="date-format-end" class="form-control floating-label" placeholder="Data końcowa" />
							<input type="submit" value="Wyszukaj"><br>
						</form>
						
						</td>
						
						</tr>
						
						
					
					</table>
						
				</div>
				
				
				<figure class="col-sm-1"> </figure>
			
			</div>
			
			
			
			
			
			
			
			<br>
			<p>	
				<b>Zarządzanie użytkownikami</b>
			</p>
			
			
			
			<div class="row">
			
				<figure class="col-sm-1"><input id="usersButton" type="submit" value="Pokaż/ukryj"> </figure>
				
				<div id="usersDiv"  style="display: none">
					<table style="color: blue">
						<tr style="background-color: #e9e9e9">
							<td>
								<figure class="col-bg-4">
								
									<form>
										Znajdź użytkownika po ID<br> 
										<input type="number" name="userUserId" min="1" placeholder="Podaj id"><br>
										<input type="submit" value="Wyszukaj"> <br> <br>
									</form>
									
									<form>
										<br>Znajdź użytkownika po wieku<br> 
										<input	type="number" name="userUserUserAge" min="1" placeholder="Podaj wiek"><br>
										<input type="submit" value="Pokaż"><br>
									</form>
								
								</figure>
							</td>
							
							<td>
								<figure class="col-bg-4">
								
									<form>
										Znajdź użytkownika po numerze telefonu<br> 
										<input type="number" name="userUserPhone" placeholder="Podaj numer"><br>
										<input type="submit" value="Wyszukaj"> <br> <br>
									</form>
								
								</figure>
							</td>
							
							
							<td>
							
								<figure class="col-bg-4">
									<form>
										Pokaż użytkowników zbanowanych<br> 
										<input type="hidden" name="userShowBannedUsers" value="true">
										<input type="submit" value="Wyszukaj"> <br> <br>
									</form>
									
									<form>
										Pokaż wszystkich użytkowników<br> 
										<input type="hidden" name="userShowAllUsers" value="true"> 
										<input type="submit" value="Wyszukaj"> <br>		
									</form>
								</figure>
							</td>
						</tr>
					</table>
						
				</div>
				
				
				<figure class="col-sm-1"> </figure>
			
			</div>
			
			
			
			
			
			
			<br>
			<p>	
				<b>Zarządzanie dodatkami do rezerwacji</b>
			</p>
			
			
			
			<div class="row">
			
				<figure class="col-sm-1"><input id="extrasButton" type="submit" value="Pokaż/ukryj"> </figure>
				
				<div id="extrasDiv"  style="display: none">
					<table style="color: blue">
						<tr style="background-color: #e9e9e9">
							<td>
								<figure class="col-bg-4">
								
									<form>
										Znajdź dodatek po ID<br> 
										<input type="number" name="extrasExtrasId" min="1" placeholder="Podaj id"><br>
										<input type="submit" value="Wyszukaj"> <br> <br>
									</form>
									
									<form>
										<a style="color: blue" href="<%out.print(request.getContextPath());%>/adminAddNewExtras">Utwórz nowy dodatek</a>
									</form>
								
								</figure>
							</td>
							
							
							<td>
							
								<figure class="col-bg-4">
									<form>
										Pokaż aktywne dodatki<br> 
										<input type="hidden" name="extrasShowActiveExtras" value="true">
										<input type="submit" value="Wyszukaj"> <br> <br>
									</form>
									
									<form>
										Pokaż wyłączone dodatki<br> 
										<input type="hidden" name="extrasShowDisabledExtras" value="true">
										<input type="submit" value="Wyszukaj"> <br> <br>
									</form>
									
									<form>
										Pokaż wszystkie dodatki<br> 
										<input type="hidden" name="extrasShowAllExtras" value="true"> 
										<input type="submit" value="Wyszukaj"> <br>		
									</form>
								</figure>
							</td>
						</tr>
					</table>
						
				</div>
				
				
				<figure class="col-sm-1"> </figure>
			
			</div>
			
			
			
			
			
			
			
			
			<!-- tu wyświetlamy informację typu "oto wyniki wyszukiwania" lub "edycja powiodła się"  -->
			
			<br>
			
			<p style="color: magenta">
				<b>${param.searchResultMessage}</b>
			</p>
		
			<c:if test="${not empty orders}">
				<p style="color: red">
					<b>${searchResultMessage}</b>
				</p>
			</c:if>
			
			<c:if test="${empty orders}">
				<p style="color: red">
			 		<b>Wyszukiwanie nie zwróciło żadnych wyników.</b><br><br>
			 	</p>
			</c:if>
			
			
			
			

			
			
			
			
			
			
			
			
			
			<!-- REZERWACJE  -->
			
			
			<c:if test="${searchResultMessage != 'Oto wyniki wyszukiwania użytkowników:' && searchResultMessage != 'Oto wyniki wyszukiwania dodatków:'}">
			
				<section class="mytable">
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
												<li>Dni wynajmu: ${order.rentLengthInDays}, <b style="color: red">Cena: ${order.orderPrice}</b></li>
												<li>Numer referencyjny: <b style="color: blue">${order.referenceNumber}</b></li>
											</ul>
										</list>
									</td>
									
									<td>
										<list>
											<ul>
												<li>Email użytkownika: ${order.user.email}</li>
												<li>Data stworzenia rezerwacji: ${order.created}</li>
												<li>Miejsce odbioru auta: ${order.address.name}, ${order.address.street}, ${order.address.zipCode}, ${order.address.city}</li>
												<c:if test="${not empty order.extras}">
												
													<li>
														<b>Wybrane dodatki:</b>
														
														<c:forEach items="${order.extras}" var="extra">
															${extra.description},
														</c:forEach>
													
													</li>
												
												</c:if>
											</ul>
										</list>
									</td>
									
									<td>
										<list>
											<ul>
												<li>Data odbioru auta: ${order.pickupDate}</li>
												<li>Data zwrotu auta: ${order.returnDate}</li>
												<li>Klasa zarezerwowanego auta:	${order.carClass.carClassDescription}</li>
												<li>Czy aktywne? 												
													<c:if test="${order.active == true}">
														<img src="<%out.print(request.getContextPath());%>/static/images/tick.png">
													</c:if>
		
													<c:if test="${order.active == false}">
														<img src="<%out.print(request.getContextPath());%>/static/images/cross.png">
													</c:if>
												</li>
											</ul>
										</list>
									</td>
									
									
									<td>
										<list>
											<ul>				
												<li><a href="<%out.print(request.getContextPath());%>/adminEditOrder/${order.id}">edytuj</a></li>
												<li><a href="<%out.print(request.getContextPath());%>/deleteOrderAdmin/${order.id}">usuń</a></li>
												<li><a href="<%out.print(request.getContextPath());%>/adminEditUser/${order.user.id}">edytuj użytkownika</a></li>
											</ul>
										</list>
									</td>
								
								</tr>
							
							</div>  <!--  koniec div "row" -->
	
						</c:forEach>
					
					
					</table>
				</section>
			
			</c:if>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			<!-- UŻYTKOWNICY  -->
			
			<section class="mytable">
				<table>
					<c:forEach items="${users}" var="user">		
						<div class="row">	
							<tr>
							
								<td>
									<list>
										<ul>
											<li>ID: ${user.id}</li>
											<li>Imię: ${user.username}</li>
											<li>Wiek: ${user.age}</li>
										</ul>
									</list>
								</td>
							
							
							
								<td>
									<list>
										<ul>
											<li>Email: ${user.email}</li>
											<li>Telefon: ${user.phone}</li>
											<li>Czy aktywny:
											
											<c:if test="${user.enabled == true}">
												<img src="<%out.print(request.getContextPath());%>/static/images/tick.png">
											</c:if>

											<c:if test="${user.enabled == false}">
												<img src="<%out.print(request.getContextPath());%>/static/images/cross.png">
											</c:if>
											
											</li>								
										</ul>
									</list>
								</td>
								
								
								
								
								<td>
									<list>
										<ul>
											<li> <a href="<%out.print(request.getContextPath());%>/panelAdmin?userId=${user.id}">pokaż wszystkie rezerwacje tego użytkownika</a></li>
											<li><a href="<%out.print(request.getContextPath());%>/adminEditUser/${user.id}">edytuj użytkownika</a></li>
											<li><a href="<%out.print(request.getContextPath());%>/deleteUserAdmin/${user.id}">usuń użytkownika i wszystkie jego rezerwacje</a></li>
										</ul>
									</list>
								</td>
							
							</tr>
						
						</div>
					<!--  koniec div "row" -->
				
					</c:forEach>
				
				</table>
			</section>
			
			
			
			
			
			
			<!-- EXTRASY  -->
			
			<section class="mytable">
				<table>
					<c:forEach items="${extras}" var="extra">		
						<div class="row">	
							<tr>
							
								<td>
									<list>
										<ul>
											<li>ID: ${extra.id}</li>
											<li>Nazwa: ${extra.name}</li>
											<li>Opis: ${extra.description}</li>
										</ul>
									</list>
								</td>
							
							
							
								<td>
									<list>
										<ul>
											<li>Cena za dzień: ${extra.pricePerDay}</li>
											<li>Czy aktywny:
											
											<c:if test="${extra.active == true}">
												<img src="<%out.print(request.getContextPath());%>/static/images/tick.png">
											</c:if>

											<c:if test="${extra.active == false}">
												<img src="<%out.print(request.getContextPath());%>/static/images/cross.png">
											</c:if>
											
											</li>								
										</ul>
									</list>
								</td>
								
								
								<td>
									Obrazek: <img src="<%out.print(request.getContextPath());%>/static/images/extras/${extra.image}">							
								</td>
								
								
								
								<td>

									<a href="<%out.print(request.getContextPath());%>/adminEditExtras/${extra.id}">edytuj dodatek</a>								

								</td>
							
							</tr>
						
						</div>
					<!--  koniec div "row" -->
				
					</c:forEach>
				
				</table>
			</section>
			
			<br><b>Liczba zamówień w bazie: ${howManyOrdersInDatabase}, z czego aktywnych: ${howManyActiveOrdersInDatabase}</b></b><br><br>
			
			<!--  <a href="<%out.print(request.getContextPath());%>/">powrót do strony głównej</a> -->
		</c:if>
		
	</body>
</html>
<%@ include file="fragments/footer.jsp"%>