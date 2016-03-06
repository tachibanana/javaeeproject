<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="">
		<title>Wear Kapampangan</title>
		<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
		<link id="pagestyle" rel="stylesheet" type="text/css" href="assets/css/skin-1.css">
		<link href="assets/css/style.css" rel="stylesheet">
		<script src="assets/js/pace.min.js"></script>
		<script src="assets/js/pace.min.js"></script>
	</head>
	<body>
		<!-- Header Here -->
		<jsp:include page="header.jsp" />
 
 		<br />
 		<br />
	 	<!-- Features Shirt -->
	 	<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.library.Size" %>
<%@ page import="com.wear.kapampangan.project.library.InventoryProduct" %>

<div class="morePost row featuredPostContainer style2 globalPaddingTop ">
	<h3 class="section-title style2 text-center">
		<span>All SHIRT</span>
	</h3>
	<div class="container">
		<div class="row xsResponse">

		<%! DBManager manager = null; %>
		<%! int counter = 0; %>
		<%
			manager = (DBManager) request.getServletContext().getAttribute("dbmanager");		
			for(InventoryProduct product : manager.getInventoryProduct()){ 
		%>
			
			<!-- ITEM START Here -->
			<div class="item col-lg-3 col-md-3 col-sm-4 col-xs-6">
				<div class="product">
					<a class="add-fav tooltipHere" data-toggle="tooltip"
						data-original-title="Add to Wishlist" data-placement="left"> <i
						class="glyphicon glyphicon-heart" id="wishlist_button" onclick="addToWishList('<%= product.getItem().getProductCode() %>');"></i>
					</a>

					<!-- Image -->
					<div class="image">
						<div class="quickview">
							<a title="Quick View" class="btn btn-xs  btn-quickview" href="product-details.jsp?productCode=<%= product.getId()%>"
								data-target="product-details.jsp?productCode=<%= product.getId()%>" data-toggle="modal"> Quick View </a>
						</div>
						<a href="product-details.jsp?productCode=<%= product.getId()%>"><img
							src="<%= product.getItem().getImage()%>" alt="img" class="img-responsive"></a>
					</div>

					<!-- Description -->
					<div class="description">
						<h4>
							<a href="product-details.html"><%= product.getItem().getName() %></a>
						</h4>
						<p><%= product.getItem().getDescription() %></p>
						<span class="size">
						<% for(Size size : product.getAvailableSize()){ 
							if(counter < product.getAvailableSize().size() - 1){
						%>
						<%= size.getSize() +" / "%>
						<% }else{%>
						<%= size.getSize() %>
	
						<%} counter ++; }counter = 0;%>	
						</span>
					</div>

					<!-- Price -->
					<div class="price">
						<span>PHP <%= ((int) product.getItem().getPrice()) %></span> <span class="old-price"></span>
					</div>

					<div class="action-control" id="dog-dog">
					<% System.out.println("Inventory = " + manager.getInventoryDetailByProductCode(product.getItem().getProductCode()).getQuantity()); %>
						<a class="btn btn-primary" id="<%= product.getItem().getProductCode() %>"  name="<%= manager.getInventoryDetailByProductCode(product.getItem().getProductCode()).getQuantity() %>"onclick="addItem('<%= product.getItem().getProductCode() %>' , '<%= product.getAvailableColor().get(0).getColor()%>' , '<%= product.getAvailableSize().get(0).getSize()%>' , '1')"> <span class="add2cart"><i
								class="glyphicon glyphicon-shopping-cart"> </i> Add to cart </span>
						</a>
					</div>
				</div>
			</div>
		<%} %>
		</div>
		
	</div>
</div>
<script>
	function addToWishList(code_){
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			//if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//document.getElementById("cartItemID").innerHTML = xmlhttp.responseText;
			//}
		};
		xmlhttp.open("GET","/FinalWK/user/wishlist?productCode=" + code_ ,true);
		xmlhttp.send();
	}
</script>
		
		<br />
		<br />
		<br />
		
		<!-- Footer Here -->
		<jsp:include page="footer.jsp" /> 
			
		<!-- Script Here -->
		<script src="../../../../ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
		</script> <script src="assets/bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.cycle2.min.js"></script>
		<script src="assets/js/jquery.easing.1.3.js"></script>
	 	<script type="text/javascript" src="assets/js/jquery.parallax-1.1.js"></script>
		<script type="text/javascript" src="assets/js/helper-plugins/jquery.mousewheel.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.mCustomScrollbar.js"></script>
		<script type="text/javascript" src="assets/js/ion-checkRadio/ion.checkRadio.min.js"></script>
		<script src="assets/js/grids.js"></script>
		<script src="assets/js/owl.carousel.min.js"></script>
		<script src="assets/js/jquery.minimalect.min.js"></script>
		<script src="assets/js/bootstrap.touchspin.js"></script>
		<script src="assets/js/home.js"></script>
		<script src="assets/js/script.js"></script>
		
			<script>
	
		var xmlhttp = new XMLHttpRequest();
		var code = "RX7809";
		var name = "Libut Libut";
		var price = 200;
		var color = "RED";
		var size = "XL";
		var quantity = 5;
		
		function addItem(code_ , color_ , size_ , quantity_ ){
			id = "div#dog-dog a#" + code_;
			if(true){
				xmlhttp.onreadystatechange = function(){
					if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
						document.getElementById("cartItemID").innerHTML = xmlhttp.responseText;
					}
				};
				xmlhttp.open("GET","/FinalWK/add?productCode=" + code_ +"&name=" + name + "&quantity=" + quantity_ +
						"&color=" + color_ + "&size=" + size_,true);
				xmlhttp.send();
			}else{
				alert($(id).attr("name"));
			}
		}
	
</script>
		
		
	</body>
</html>
