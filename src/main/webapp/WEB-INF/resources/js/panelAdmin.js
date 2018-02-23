document.addEventListener("DOMContentLoaded", function(){
	//alert('Działam!');

	var ordersButton = document.getElementById("ordersButton");
	var usersButton = document.getElementById("usersButton");
	
	var ordersDiv = document.getElementById("ordersDiv");
	var usersDiv = document.getElementById("usersDiv");
	
	console.log(ordersButton);
	console.log(usersButton);
	console.log(ordersDiv);
	console.log(usersDiv);
	
	
	ordersButton.addEventListener("click",
	        function () {
		
			console.log(ordersDiv.style.display);
			
				if (ordersDiv.style.display == "none") {
					ordersDiv.style.display = "block";
				} else {
					ordersDiv.style.display = "none";
				}
	   
	}); //koniec event listenera
	
	
	usersButton.addEventListener("click",
	        function () {
		
			console.log(usersDiv.style.display);
			
				if (usersDiv.style.display == "none") {
					usersDiv.style.display = "block";
				} else {
					usersDiv.style.display = "none";
				}
	            
	}); //koniec event listenera


});