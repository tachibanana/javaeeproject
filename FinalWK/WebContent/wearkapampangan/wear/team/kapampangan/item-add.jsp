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
<%! int counter = 0; %>
<%! Admin currentAdmin = null; %>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager");	%>

<% if(session.getAttribute("currentadmin") != null) currentAdmin = (Admin) session.getAttribute("currentAdmin");%>
<% if(session.getAttribute("currentadmin") == null) response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/admin-login.jsp");%>
			
<body>
<jsp:include page="admin-header.jsp" />
<div class="container" style="max-width:100%;">
  <form role="form">
	<div class="row" >
		<div class="col-lg-8 col-md-8 ">	
			<div class="form-group">
			  <label for="code">Product Code</label>
			  <input type="code" class="form-control" id="product-code" placeholder="enter product code">
			</div>
			<div class="form-group">
			  <label for="name">Product Name</label>
			  <input type="name" class="form-control" id="product-name" placeholder="enter product name">
			</div>
			<div class="form-group">
			  <label for="price">Price</label>
			  <input type="price" class="form-control" id="product-price" placeholder="enter price">
			</div>
			<div class="form-group">
				<label for="name">Status</label> </br>
				<div class="btn-group" id = "divdd"> <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#" id="product-status">Select <span class="caret"></span></a>
		            <ul class="dropdown-menu">
		                <li><a href="#">Features</a></li>
		                <li><a href="#">New</a></li>
		                <!-- <li class="divider"></li> -->
		            </ul>
        		</div>
			</div>
			<div class="controls">
								<label>Description:</label>
								<textarea rows="5" cols="100" class="form-control" id="product-description" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
			</div>
			<div class="row" style="text-align:center; padding-top: 15px;">
			 <a href="#" class="btn btn-success btn-lg" id="add-item">
			<span class="glyphicon glyphicon-plus-sign"></span> Add </a>
			<a href="#" class="btn btn-success btn-lg">
			<span class="glyphicon glyphicon-floppy-save" > </span> Save </a>
			</div>
		
		</div>
		
		<div class="col-lg-4 col-md-4 ">	
		<div id="container" style="margin-left:30px;">
			<label for="name" >Color</label> </br>
				<div class="checkbox" class="col-lg-6" id="checkbox-color">
				<% for(Color color : manager.getColorList()){%>
				  	<label><input type="checkbox" value="<%= color.getColor() %>"><%= color.getColor() %></label> </br>
				 <%} %>
				</div>
		<div id="container">
			<label for="name"> Size</label> </br>
				<div class="checkbox" class="col-lg-6" id="checkbox-size">
				 <% for(Size size : manager.getSizeList()){%>
				  	<label><input type="checkbox" value="<%= size.getSize() %>" /><%= size.getSize() %></label> </br>
				 <%} %>
				</div>
		</div>
		</div>
		
	</div>
	
	</form>
</div>
<script>
	$(document).ready(function(){
		var selectedIT = "Select";
		
		$(".dropdown-menu li a").click(function(){
			 var selText = $(this).text();
			
			  $(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
			});
		
		
		$('#product-status').click(function(){
			selectedIT = $('#product-status').text();
		});
		
		$("#add-item").click(function(){
			
			var productCode = $("#product-code").val();
			var name = $("#product-name").val();
			var price = $("#product-price").val();
			var description = $("#product-description").val();
			var checkcount = 0;
			var checksize = 0;
			
			
			
			
		   $('#checkbox-color label input').each(function(){
					
				
					if($(this).prop('checked') == true){
						checkcount++;
					}
					
				});
				
				$('#checkbox-size label input').each(function(){
					
					if($(this).prop('checked') == true){
						checksize++;
					}
					
				}); 
			
			 	//validation
				if(productCode != "" && name != "" && (price != "" && $.isNumeric(price)) && (selectedIT != "Select" && selectedIT != "") && checksize != 0 && checkcount != 0 ){
			//status
			var status = "";
			if($("#product-status").html() == "New <span class=\"caret\"></span>"){
				status = "new";
			}else if($("#product-status").html() == "Features <span class=\"caret\"></span>"){
				status = "features";
			}
			
			//size list
			var sizeList = "";
			$('#checkbox-size').children('label').each(function () {
				if($(this).children().prop("checked")==true){
					//alert($(this).children().val() );
					sizeList += ($(this).children().val() + ":");
				}
			});
			
			//color list
			var colorList = "";
			$('#checkbox-color').children('label').each(function () {
				if($(this).children().prop("checked")==true){
					//alert($(this).children().val() );
					colorList += ($(this).children().val() + ":");
					
				}
			});
			
			window.location.href = "/FinalWK/item/add?productCode=" + productCode + "&name=" + name + "&price=" + price + "&description=" + description + "&status=" + status + "&sizeList=" + sizeList + "&colorList=" + colorList;
				}else{
					alert("Please check your inputs");
				}    
		});
			
	});
</script>
</body>
</html>
