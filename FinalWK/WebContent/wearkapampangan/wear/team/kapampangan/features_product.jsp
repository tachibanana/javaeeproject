<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.library.Size" %>
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
			for(Item item : manager.getItemList()){ 
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
							<a title="Quick View" class="btn btn-xs  btn-quickview" href="product-details.jsp?productCode=<%= item.getProductCode()%>"
								data-target="product-details.jsp?productCode=<%= item.getProductCode()%>" data-toggle="modal"> Quick View </a>
						</div>
						<a href="product-details.jsp?productCode=<%= item.getProductCode()%>"><img
							src="<%= item.getImage()%>" alt="img" class="img-responsive"></a>
					</div>

					<!-- Description -->
					<div class="description">
						<h4>
							<a href="product-details.html"><%= item.getName() %></a>
						</h4>
						<p><%= item.getDescription() %></p>
						<span class="size"> M /
						<% for(Size size : item.getListOfSize()){ 
							if(counter < item.getListOfSize().size() - 1){
						%>
						<%= size.getSize() +" / "%>
						<% }else{%>
						<%= size.getSize()%>
	
						<%} counter ++; }%>	
						</span>
					</div>

					<!-- Price -->
					<div class="price">
						<span>PHP <%= ((int) item.getPrice()) %></span> <span class="old-price"></span>
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

