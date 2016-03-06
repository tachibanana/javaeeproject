<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%! DBManager thisManager = null; %>
<% thisManager =  (DBManager) request.getServletContext().getAttribute("dbmanager"); %>
<div class="row recommended">
	<h1> YOU MAY ALSO LIKE </h1>
	<div id="SimilarProductSlider">
		<% for(int ctr = 0 ; ctr < 5 ; ctr ++){ %>
		<% int array[] = new int[5]; %>
		<% int random = ((int) Math.floor(Math.random() * (thisManager.getItemList().size() - 1)));%>
		<%Item thisItem = thisManager.getItemList().get(random); %>
		
			<div class="item">
				<div class="product"><a class="product-image" href="product-details.jsp?productCode=<%= thisItem.getProductCode()%>"> <img src="<%= thisItem.getImage() %>" alt="img"> </a>
					<div class="description">
						<h4><a href=""><%= thisItem.getName() %></a></h4>
						<div class="price">PHP <span><%= thisItem.getPrice() %>0</span></div>
					</div>
				</div>
			</div>			
		
		<%} %>
		</div>
</div>
