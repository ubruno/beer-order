Order = {

	verifyBeerQuantity: function(){
		
		var beerId =  document.getElementById("beer_id").value;
		
		xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET","/beers/" + beerId + ".json",true);
		xmlhttp.onreadystatechange = function() {
  			var rText = xmlhttp.responseText;
			var beer = JSON.parse(rText);
			var q = document.getElementById("available");
			q.textContent = beer.available_quantity;			
		};
		xmlhttp.send();
	}
};
