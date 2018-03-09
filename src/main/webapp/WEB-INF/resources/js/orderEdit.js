document.addEventListener("DOMContentLoaded", function(){
	

	//alert('Działam');
	//console.log("Działam!\n\n");
	
	var totalCost = document.getElementById("totalCost");
	console.log(totalCost);
	
	var allRowsWithCheckboxes = document.getElementsByClassName("extrasCheckboxRow");
	console.log(allRowsWithCheckboxes);
	
	
	for (i = 0; i < allRowsWithCheckboxes.length; i++) {
        //console.log(i);
		allRowsWithCheckboxes[i].firstElementChild.firstElementChild.addEventListener("click",
            function () {

                if (this.checked) {
                    //console.log('Zaznaczono mnie!');
                    //console.log(this.parentElement.nextElementSibling.nextElementSibling.innerText);
                   totalCost.innerText = Math.floor(parseFloat(totalCost.innerText)) + Math.floor(parseFloat(this.parentElement.nextElementSibling.nextElementSibling.innerText));
                    
                   // console.log(this.lastElementChild.innerText)
                   // console.log(this.children[2].innerText)
                    
                }else {
                	//console.log('Odznaczono mnie!');
                	totalCost.innerText = Math.floor(parseFloat(totalCost.innerText)) - Math.floor(parseFloat(this.parentElement.nextElementSibling.nextElementSibling.innerText));
                    
                }
            }); //koniec event listenera
    } //koniec pętli for
	
	

});