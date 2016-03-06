<!DOCTYPE html>
<html lang="en">
<head>
  <title>Add Item</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  
  <link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
  <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.js"></script>
  <script src="assets/js/jquery-2.1.4.js"></script>
</head>

<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.library.Admin" %>
<%@ page import="com.wear.kapampangan.project.library.Size" %>
<%@ page import="com.wear.kapampangan.project.library.Color" %>


<%! DBManager manager = null; %>
<%! String productCode = "";%>
<%! Item item = null;%>
<%! Admin currentAdmin = null; %>

<% if(session.getAttribute("currentadmin") != null) currentAdmin = (Admin) session.getAttribute("currentAdmin");%>
<% if(session.getAttribute("currentadmin") == null) response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/admin-login.jsp");%>

<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager");	%>
<% productCode = (request.getParameter("productCode") != null ? request.getParameter("productCode") : "");%>
<% item = manager.getItemByProductCode(productCode); %>

<body>
<jsp:include page="admin-header.jsp" />
<div class="container" style="max-width:100%;">
  <form role="form">
	<div class="row" >
		<div class="col-lg-8 col-md-8 ">	
			<div class="form-group">
			  <label for="code">Product Code</label>
			  <input type="code" class="form-control" id="product-code" placeholder="enter product code" value='<%= (item != null ? item.getProductCode() : "")%>' readonly>
			</div>
			<div class="form-group">
			  <label for="name">Product Name</label>
			  <input type="name" class="form-control" id="product-name" placeholder="enter product name" value='<%= (item != null ? item.getName() : "")%>'>
			</div>
			<div class="form-group">
			  <label for="price">Price</label>
			  <input type="price" class="form-control" id="product-price" placeholder="enter price" value='<%= (item != null ? item.getPrice() : 0.0)%>'>
			</div>
			<div class="form-group">
				<label for="name">Status</label> </br>
				<div class="btn-group"> <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#" id="product-status">
				<%= (item != null ? item.getStatus().replace(item.getStatus().charAt(0), String.valueOf(item.getStatus().charAt(0)).toUpperCase().charAt(0)) : "Select")%> <span class="caret"></span></a>
		            <ul class="dropdown-menu">
		                <li><a href="#">Features</a></li>
		                <li><a href="#">New</a></li>
		                <!-- <li class="divider"></li> -->
		            </ul>
        		</div>
			</div>
			<div class="controls">
				<label>Description:</label>
				<textarea rows="5" cols="100" class="form-control" id="product-description" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none" value='<%= (item != null ? item.getDescription() : "")%>'><%= (item != null ? item.getDescription() : "")%></textarea>
			</div>
			<div class="row" style="text-align:center; padding-top: 15px;">
			<a href="#" class="btn btn-success btn-lg" id="update-item">
			<span class="glyphicon glyphicon-floppy-save" > </span> Save </a>
			 <a href="#" class="btn btn-success btn-lg" id="add-item">
			<span class="glyphicon glyphicon-plus-sign"></span> Add </a>
			
			</div>
		
		</div>
	
	</form>
</div>
<script>
	$(document).ready(function(){
	
		
		$(".dropdown-menu li a").click(function(){
			  var selText = $(this).text();
			  $(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
			});
		
	
		
		$("#update-item").click(function(){
			
			
			var productCode = $("#product-code").val();
			var name = $("#product-name").val();
			var price = $("#product-price").val();
			var description = $("#product-description").val();
			//validation
			if(productCode != "" && name != "" && (price != "" && $.isNumeric(price))){
			//status
			var status = "";
			if($("#product-status").html() == "New <span class=\"caret\"></span>"){
				status = "new";
			}else{
				status = "features";
			}
			
			if($("#product-code").val() != ""){
				if($("#product-name").val() != ""){
					if($("#product-price").val() != ""){
						if($("#product-description").val() != ""){
							if($("#product-status").html() != "Select <span class=\"caret\"></span>"){
								window.location.href = "/FinalWK/item/update?productCode=" + productCode + "&name=" + name + "&price=" + price + "&description=" + description + "&status=" + status;}
						}
						
					}
				}
			}
			}else{
				alert("Please check your inputs");
			}
		});
			
	});
</script>
</body>
</html>
