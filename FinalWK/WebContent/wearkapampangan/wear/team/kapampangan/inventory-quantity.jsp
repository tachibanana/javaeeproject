<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>

<%! DBManager manager = null; %>
<%! String productCode = ""; %>
<%! String command = ""; %>
<%! int quantity = 0; %>


<% command = (request.getParameter("command") != null ? request.getParameter("command") : "");%>
<% productCode = (request.getParameter("productCode") != null ? request.getParameter("productCode") : "");%>
<% quantity = (request.getParameter("quantity") != null ? Integer.parseInt(request.getParameter("quantity")) : 0);%>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager");%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="admin-header.jsp" />
<div class="container">
  
  <form role="form">
    <div class="form-group">

      <div class="col-xs-4">
        <label >Product Code </label>
        <input class="form-control"  type="text" value="<%= productCode %>" readonly id="product-code">
	
     
        <label for="ex2">Quantity</label>
        <input class="form-control" type="text" value="<%= quantity %>" readonly>
      
	  <label id="command"><%= command %></label>
	   <input class="form-control"  type="text" id="new-quantity">
	   
	     <button type="button" class="btn btn-success" id="ok">okay</button>
   </div>
    </div>
  </form>

</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#ok").click(function(){
			if($("new-quantity") != null){
				if($("#command").html() == "How many Quantity do you want to add?")
					window.location.href = "/FinalWK/inventory/update/quantity?productCode=" + $("#product-code").val() + "&quantity=" + $("#new-quantity").val() + "&command=add";
				else{
					window.location.href = "/FinalWK/inventory/update/quantity?productCode=" + $("#product-code").val() + "&quantity=" + $("#new-quantity").val() + "&command=remove";
				}
			}
		});
	});
</script>
</body>
</html>
