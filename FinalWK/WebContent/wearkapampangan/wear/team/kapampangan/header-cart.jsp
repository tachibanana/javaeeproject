<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Product" %>
<%@ page import="java.util.List" %>

<%! DBManager manager = null; %>
<%! List<Product> listOfProduct = null; %>
<%! int cartPrice = 0; %>

<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>
<% listOfProduct = (List<Product>) request.getSession().getAttribute("cartItem"); %>
<% cartPrice = 0; %>
<% for(Product product : listOfProduct) cartPrice += (product.getItem().getPrice() * product.getQuantity());%>

<div class="dropdown  cartMenu" id="cartItemID">
	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
		<i class="fa fa-shopping-cart"> </i> <span class="cartRespons">
		Cart (PHP <%= cartPrice%>)</span> <b class="caret"></b>
	</a>
	<div class="dropdown-menu col-lg-4 col-xs-12 col-md-4 ">
		<div class="w100 miniCartTable scroll-pane">
			<table>
				<tbody id="">
					<% for(Product product : listOfProduct){ %>
					<!-- Item Here -->
					<tr class="miniCartProduct" id="<%= product.getItem().getProductCode()%>">
						<td style="width: 20%" class="miniCartProductThumb">
							<div>
								<a href="product-details.jsp?productCode=<%= product.getItem().getProductCode()%>">
								<img src="<%= product.getItem().getImage()%>" alt="img">
								</a>
							</div>
						</td>

						<td style="width: 40%">
							<div class="miniCartDescription">
								<h4>
									<a href="product-details.html"><%= product.getItem().getName()%></a>
								</h4>
								<span class="size"><%= product.getSize().getSize()%></span>
								<div class="price">
									<span>PHP <%= product.getItem().getPrice()%></span>
								</div>
							</div>
						</td>

						<td style="width: 1 0%" class="miniCartQuantity"><a>X <%= product.getQuantity()%></a></td>
						<td style="width: 15%" class="miniCartSubtotal"><span>PHP <%= product.getItem().getPrice() * product.getQuantity() %></span></td>
						<td name="<%=product.getItem().getProductCode()%>" style="width: 5%" class="delete" id="product-key" onclick="removeItem()"><a> x </a></td>
					</tr>
					<%} %>
				</tbody>
			</table>
		</div>

		<div class="miniCartFooter text-right">
			<h3 class="text-right subtotal">Subtotal: PHP <%= cartPrice%></h3>
			<button class="btn btn-sm btn-danger" onclick="location.href='cart.jsp';"> <i class="fa fa-shopping-cart"></i> VIEW CART</button>
	
			<button class="btn btn-sm btn-primary" onclick="location.href='checkout-1.jsp';"> CHECKOUT </button>
			
		</div>

	</div>
</div>
<script src="assets/js/jquery-2.1.4.js"></script>
		
	<script>
	
		var xmlhttp = new XMLHttpRequest();
		var code = "RX7809";
		var name = "Libut Libut";
		var price = 200;
		var color = "RED";
		var size = "XL";
		var quantity = 5;
		
		function removeItem(){
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					document.getElementById("cartItemID").innerHTML = xmlhttp.responseText;
				}
			};
			xmlhttp.open("GET","/FinalWK/remove?productCode=" + code +"&name=" + name + "&quantity=" + quantity +
					"&color=" + color + "&size=" + size,true);
			xmlhttp.send();
		}
	
</script>