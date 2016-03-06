<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.library.Admin" %>
<%! DBManager manager = null; %>
<%! String searchName = "";%>
<%! Admin currentAdmin = null; %>

<% searchName = (request.getParameter("searchName") != null ? request.getParameter("searchName") : "");%>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager");%>

<% if(session.getAttribute("currentadmin") != null) currentAdmin = (Admin) session.getAttribute("currentAdmin");%>
<% if(session.getAttribute("currentadmin") == null) response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/admin-login.jsp");%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <!--  
  <link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  -->
  <script src="assets/js/jquery-2.1.4.js"></script>
</head>
<body>

<jsp:include page="admin-header.jsp" />
<div class="container">
      <h1>T-Shirt list</h1>
	<div class="col-xs-3">
	<input type="text" class="form-control" id="usr" placeholder="search item name">
	</div>
	<button   type="button" class="btn btn-success" id="search-ok">Okay</button>
	 <p align="right">  
	  <button type="button" class="btn btn-success" id="remove-button">Remove</button>
	  <button type="button" class="btn btn-success">Update</button>
	  </p>
  <table class="table" id="item-table">
    <thead>
      <tr>
       <th>&nbsp;</th>
        <th>&nbsp;</th>
		<th>&nbsp;</th>
		<th>Product Code</th>
		<th>Name</th>
		<th>Price</th>
		<th>Image</th>
		<th>Status</th>
		<th>Quantity</th>
      </tr>
	 
    </thead>
    <tbody>
    <% if(searchName.equals("")){ %>
    <% for(Item item : manager.getItemList()){%>
    	<% if((manager.getInventoryDetailByProductCode(item.getProductCode()).getQuantity()) == 0){%>
    		<tr class="danger">
    	<%}else{ %>
	      <tr>
	      <%} %>
			  <td><input type="checkbox" name="<%= item.getProductCode() %>" value="<%= item.getProductCode() %>"></td>	
			  <td><a href="/FinalWK/wearkapampangan/wear/team/kapampangan/item-update.jsp?productCode=<%= item.getProductCode() %>">Update</td>
			  <td><a href="/FinalWK/item/remove?productCode=<%= item.getProductCode() %>">Remove</td>
			  <td> <%= item.getProductCode() %> </td>
			  <td><a href="/FinalWK/wearkapampangan/wear/team/kapampangan/item-info.jsp?productCode=<%= item.getProductCode() %>"><%= item.getName() %></td>
			  <td><%= item.getPrice() %></td>
			  <td><%= item.getImage() %></td>
			  <td><%= item.getStatus() %></td>
			  <td><%= (manager.getInventoryDetailByProductCode(item.getProductCode()).getQuantity()) %></td>	  
		  </tr>
	 <%}}else{ 
	 	for(Item item : manager.getItemByNameQuery(searchName)){%>
	 		<tr>
			  <td><input type="checkbox" name="check" value="<%= item.getProductCode() %>"></td>	
			  <td><a href="/FinalWK/wearkapampangan/wear/team/kapampangan/item-update.jsp?productCode=<%= item.getProductCode() %>">Update</td>
			  <td><a href="/FinalWK/item/remove?productCode=<%= item.getProductCode() %>">Remove</td>
			  <td> <%= item.getProductCode() %> </td>
			  <td><a href="/FinalWK/wearkapampangan/wear/team/kapampangan/item-info.jsp?productCode=<%= item.getProductCode() %>"><%= item.getName() %></td>
			  <td><%= item.getPrice() %></td>
			  <td><%= item.getImage() %></td>
			  <td><%= item.getStatus() %></td>
			  <td>Quantity</td>	  
		  </tr>
	 <%}} %>
	
	 </tbody>
	  </table>
</div>
<script>
	$(document).ready(function(){
		$("#search-ok").click(function(){
			if($("#usr").val() != ""){
				window.location.href = "/FinalWK/wearkapampangan/wear/team/kapampangan/item-list.jsp?searchName=" + $("#usr").val();
			}
		});
		
		$("#remove-button").click(function(){
			var productCodes = "";
			
			$("#item-table").find('input').each(function(){
				if($(this).prop("checked") == true){
					productCodes += ($(this).val() + ":");
				}
				
			});
			
			window.location.href = "/FinalWK/item/remove/manny?productCodes=" + productCodes;
		});
	});
</script>
</body>
</html>
