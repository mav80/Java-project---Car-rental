document.addEventListener("DOMContentLoaded", function(){
	//Script for scrolling page up to top upon click
	
	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};
	
	function scrollFunction() {
	    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	        document.getElementById("myBtn").style.display = "block";
	    } else {
	        document.getElementById("myBtn").style.display = "none";
	    }
	}
	
	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
	    document.body.scrollTop = 0; // For Safari
	    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
	}
	
	
	// here we ask user for confirmation before deleting something
	var confirms = document.getElementsByClassName('confirm');
	console.log(confirms);
	
	var confirmIt = function (e) {
	    if (!confirm('Jesteś pewien?')) e.preventDefault();
	};
	for (var i = 0, l = confirms.length; i < l; i++) {
		confirms[i].addEventListener('click', confirmIt, false);
	}


});