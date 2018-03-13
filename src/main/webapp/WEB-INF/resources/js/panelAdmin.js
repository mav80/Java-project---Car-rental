document.addEventListener("DOMContentLoaded", function(){
	//alert('Działam!');

	var ordersButton = document.getElementById("ordersButton");
	var usersButton = document.getElementById("usersButton");
	var extrasButton = document.getElementById("extrasButton");
	var addressButton = document.getElementById("addressButton");
	var carClassButton = document.getElementById("carClassButton");
	
	var ordersDiv = document.getElementById("ordersDiv");
	var usersDiv = document.getElementById("usersDiv");
	var extrasDiv = document.getElementById("extrasDiv");
	var addressDiv = document.getElementById("addressDiv");
	var carClassDiv = document.getElementById("carClassDiv");
	
	
	
	console.log(ordersButton);
	console.log(usersButton);
	console.log(extrasButton);
	console.log(ordersDiv);
	console.log(usersDiv);
	console.log(extrasDiv);
	
	
	
	ordersButton.addEventListener("click",
	        function () {
		
			console.log(ordersDiv.style.display);
			
				if (ordersDiv.style.display == "none") {
					ordersDiv.style.display = "block";
					usersDiv.style.display = "none";
					extrasDiv.style.display = "none";
					addressDiv.style.display = "none";
					carClassDiv.style.display = "none";
				} else {
					ordersDiv.style.display = "none";
				}
	   
	}); //koniec event listenera
	
	
	usersButton.addEventListener("click",
	        function () {
		
			console.log(usersDiv.style.display);
			
				if (usersDiv.style.display == "none") {
					usersDiv.style.display = "block";
					ordersDiv.style.display = "none";
					extrasDiv.style.display = "none";
					addressDiv.style.display = "none";
					carClassDiv.style.display = "none";
				} else {
					usersDiv.style.display = "none";
				}
	            
	}); //koniec event listenera
	
	extrasButton.addEventListener("click",
	        function () {
		
			console.log(extrasDiv.style.display);
			
				if (extrasDiv.style.display == "none") {
					extrasDiv.style.display = "block";
					ordersDiv.style.display = "none";
					usersDiv.style.display = "none";
					addressDiv.style.display = "none";
					carClassDiv.style.display = "none";
				} else {
					extrasDiv.style.display = "none";
				}
	            
	}); //koniec event listenera
	
	addressButton.addEventListener("click",
	        function () {
		
			console.log(addressDiv.style.display);
			
				if (addressDiv.style.display == "none") {
					addressDiv.style.display = "block";
					ordersDiv.style.display = "none";
					usersDiv.style.display = "none";
					extrasDiv.style.display = "none";
					carClassDiv.style.display = "none";
				} else {
					addressDiv.style.display = "none";
				}
	            
	}); //koniec event listenera
	
	carClassButton.addEventListener("click",
	        function () {
		
			console.log(carClassDiv.style.display);
			
				if (carClassDiv.style.display == "none") {
					carClassDiv.style.display = "block";
					ordersDiv.style.display = "none";
					usersDiv.style.display = "none";
					addressDiv.style.display = "none";
					extrasDiv.style.display = "none";
				} else {
					carClassDiv.style.display = "none";
				}
	            
	}); //koniec event listenera


});