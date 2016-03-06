<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Size" %>
<%@ page import="com.wear.kapampangan.project.library.Color" %>

<%! DBManager manager = null; %>
<%! String s = ""; %>
<%! Size size = null; %>

<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>
<% s = request.getParameter("size"); %>
<% size = manager.getSizeByName(s); %>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Size add</title>
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
		<label>ID</label>
		<input class="form-control" type="text" readonly>
        <label >Size</label>
        <input class="form-control"  type="text" id="size-text" >
	 
	     <button type="button" class="btn btn-success" id="btn-add">Add</button>
   </div>
    </div>
  </form>

</div>
<script>
	$(document).ready(function(){
		
		
			$("#btn-add").click(function(){
			
				if($("#size-text").val() != ""){
					window.location.href = "/FinalWK/size/add?size=" + $("#size-text").val();
				}
			});
		
	});
</script>
</body>
</html>
