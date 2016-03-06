
var colorParam = "";
$color = "";
$size = "";
$quantity = "";

$(document).ready(function(){
         
		if($("#inventory-stock").attr("name") == "in"){
			$("#addToCart").click(function(){
				var quantity;
				if($("#quantity-id-select option:selected").val() == "Quantity") {
					quantity = 1;
				}else{
					quantity = $("#quantity-id-select option:selected").val();
				}
				
				if(parseInt(quantity) <= parseInt($("#inventory-item-detail").html())){
					var productCode = "";
					
					productCode = $("#productCode").attr("name");
					
					//selected color
					var colorParam = $("li.selected #color").attr("name");
					
					//select size
					var sizeParam = "";
					
					if($("#sizelist select option:selected").val() == "Size"){
						sizeParam = $("#firstAvailableSize").val();
					}else{
						sizeParam = $("#sizelist select option:selected").val();
					}
					
					//select quantity
					var quantityParam = "";
					
					if($("#quantitylist select option:selected").val() == "Quantity"){
						quantityParam = "1";
					}else{
						quantityParam = $("#quantitylist select option:selected").val();
					}
					
					window.location.href = "/FinalWK/product-detail/cart/add?productCode=" + productCode + "&color=" + colorParam + "&size=" + sizeParam +"&quantity=" + quantityParam;
					
					}else{ alert(" " +$("#inventory-item-detail").html() + " stocks remain.")}
			});	
		}else if($("#inventory-stock").attr("name") == "out"){
			$("#quantity-id-select").prop("disabled", true);
	         $("#size-list-option").prop("disabled", true);
	         $("#addToCart").click(function(){
	        	 alert("Out of stock.");
	         });
			
		}
	
	
	$("#addToWishlist").click(function(){
		var productCode = "";
		productCode = $("#productCode").attr("name");
		window.location.href = "/FinalWK/product-detail/wishlist/add?productCode=" + productCode;
	});
})

function addToCartFromProductDetail(code_ , color_){
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			//if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//document.getElementById("cartItemID").innerHTML = xmlhttp.responseText;
			//}
		};
		xmlhttp.open("GET","/FinalWK/user/wishlist?productCode=" + code_ ,true);
		xmlhttp.send();
}