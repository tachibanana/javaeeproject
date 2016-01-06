<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.library.Size" %>
<%@ page import="com.wear.kapampangan.project.library.InventoryProduct" %>
<div class="morePost row featuredPostContainer style2 globalPaddingTop ">
	<h3 class="section-title style2 text-center">
		<span>FEATURES SHIRT</span>
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
						class="glyphicon glyphicon-heart"></i>
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
						<span class="size"> M /
						<% for(Size size : product.getAvailableSize()){ 
							if(counter < product.getAvailableSize().size() - 1){
						%>
						<%= size.getSize() +" / "%>
						<% }else{%>
						<%= size.getSize()%>
	
						<%} counter ++; }%>	
						</span>
					</div>

					<!-- Price -->
					<div class="price">
						<span>PHP <%= ((int) product.getItem().getPrice()) %></span> <span class="old-price"></span>
					</div>

					<div class="action-control">
						<a class="btn btn-primary" href=""> <span class="add2cart"><i
								class="glyphicon glyphicon-shopping-cart"> </i> Add to cart </span>
						</a>
					</div>
				</div>
			</div>
		<%} %>
		</div>
		<div class="row">
			<div class="load-more-block text-center">
				<a class="btn btn-thin" href="#"> <i class="fa fa-plus-sign">+</i>
					load more products
				</a>
			</div>
		</div>
	</div>
</div>
