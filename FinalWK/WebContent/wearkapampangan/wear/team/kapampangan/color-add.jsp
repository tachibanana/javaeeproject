<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Size" %>
<%@ page import="com.wear.kapampangan.project.library.Color" %>
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
		<label>ID</label>
		<input class="form-control" type="text" value="" readonly>
		
        <label >Color</label>
        <input class="form-control"  type="text" id="color-text">
	
     
        <label for="ex2">Hex</label>
        <input class="form-control" type="text" id="hex-text">
		
      
	   
	     <button type="button" class="btn btn-success" id="btn-add">Add</button>
   </div>
    </div>
  </form>
<script>
	$(document).ready(function(){
		
		
			$("#btn-add").click(function(){
			
				if($("#size-text").val() != "" && $("#hex-text").val() != ""){
					window.location.href = "/FinalWK/color/add?color=" + $("#color-text").val() + "&hex=" + $("#hex-text").val();
				}
			});
		
	});
</script>
</div>
</body>
</html>
