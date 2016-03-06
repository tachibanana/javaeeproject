<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.library.Size" %>
<%@ page import="com.wear.kapampangan.project.library.Color" %>
<%@ page import="com.wear.kapampangan.project.library.InventoryProduct" %>


<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
<link id="pagestyle" rel="stylesheet" type="text/css" href="assets/css/skin-1.css">
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/home-v7.css" rel="stylesheet">
<link href="assets/css/cart-nav.css" rel="stylesheet">
<link href="assets/css/product-details-5.css" rel="stylesheet">
<link href="assets/plugins/magnific/magnific-popup.css" rel="stylesheet">


<div class="hero-section-header ">


		<%! DBManager manager = null; %>
		<%! int counter = 0; %>
		<%
			manager = (DBManager) request.getServletContext().getAttribute("dbmanager");		
			for(InventoryProduct product : manager.getInventoryProduct()) if(product.getItem().getStatus().equalsIgnoreCase("new")){{ %>
				<div class="product-item item-flat col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12">
					<div class="product product-item-inner">
						<a data-placement="left" data-original-title="Add to Wishlist" data-toggle="tooltip" class="add-fav wisthlist-flat tooltipHere">
							<i class="glyphicon glyphicon-heart"></i>
						</a>
						<div class="imageHover hasCart">
							<a href="product-details.html">
								<img class="img-responsive primaryImage" alt="img" src="<%= product.getItem().getImage() %>">
								<img class="img-responsive secondaryImage" alt="img" src="<%= product.getItem().getImage() %>"></a>
								<div class="product-btn-box">
								<a class="btn btn-product-flat btn-primary">
								<span class="add2cart"><i class="glyphicon glyphicon-shopping-cart" onclick="addItem('<%= product.getItem().getProductCode() %>' , '<%= product.getAvailableColor().get(0).getColor()%>' , '<%= product.getAvailableSize().get(0).getSize()%>' , '1')"> </i> Add to cart </span>
							</a>
						</div>
						</div>
						<div class="prod-details">
							<p class="title">
								<a href="product-details-style5-4.1-with-zoom.html" title=""><%= product.getItem().getName() %></a>
							</p>
							<p class="product-flat-info">
							<span class="product-curreent-price">
								PHP <%= product.getItem().getPrice() %>
							</span>
							&nbsp;|&nbsp;
							<span class="product-model">New</span></p>
							<div class="product-color">
								<%for(Color color : product.getAvailableColor()){ %>
									<a style="background-color:<%= color.getHex() %>"> </a>
								<%} %>
							</div>
						</div>
				</div>
			</div>
				
				
				
		<%	}}
		%>
		
		<!-- Item start here -->

		

</div>




<script src="assets/plugins/intense-images-master/intense.js"></script>
<script src="assets/js/wow.min.js"></script>
