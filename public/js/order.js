Order = {

	verifyBeerQuantity: function(){
		
		var beerId =  document.getElementById("beer_id").value;
		
		xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET","/beers/" + beerId + ".json",true);
		xmlhttp.onreadystatechange = function() {
  			var rText = xmlhttp.responseText;
			if (rText && rText.trim() !== '') {
				var beer = JSON.parse(rText);
				var q = document.getElementById("available");
				q.textContent = beer.available_quantity;				
			}
		};
		xmlhttp.send();
	},

	updatePrice: function(){
		var quantityElement = document.getElementById("order[quantity]");
		var singlePriceElement = document.getElementById("beer_price");
		var totalPriceElement = document.getElementById("total_price");

		singlePriceElement = singlePriceElement.innerHTML.replace('R$', '').trim();
		
		var quantity, singlePrice, totalPrice;
		quantity = Number.parseFloat(quantityElement.value);
		singlePrice = Number.parseFloat(singlePriceElement);
		totalPrice = quantity * singlePrice;

		totalPriceElement.innerHTML = totalPrice.toFixed(2);
	},
	
	submitForm: function() {
		var myForm = document.getElementById('new_order');
		if (myForm) {
			myForm.onsubmit = function() {
				return Order.checkFieldsForm();
			};
		}
	},
	
	checkFieldsForm: function() {
		var idInputFields = ['order_customer_name', 'order_email', 'order_phone_number'],
			i = null,
			max = idInputFields.length;
			
		for (i = 0; i < max; i++) {
			var input = document.getElementById(idInputFields[i]);
			if (input.value.trim() === '') {
				alert('Por favor, preencha todos os campos!');
				return false;
			}
		}
		
		return true;
	}
};
