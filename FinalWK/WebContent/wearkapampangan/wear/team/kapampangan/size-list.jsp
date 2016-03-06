<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Size" %>
<%@ page import="com.wear.kapampangan.project.library.Color" %>

<%! DBManager manager = null; %>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>

<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="admin-header.jsp" />
<div class="container">
      <h1>Size</h1>
	 
  <table class="table table-striped">
    <thead>
	     <tr>
		     <th>&nbsp </th>
		     <th>&nbsp </th>
		     <th>&nbsp </th>
		     <th>ID</th>
		     <th>Size</th>
	     </tr>
	 </thead>
    <tbody>
    <% for(Size size : manager.getSizeList()){%>
      <tr>
      	<td><input type="checkbox" name=""></td>
      	<td><a link="href="">Update</a></td>
      	<td><a href="/FinalWK/size/remove?size=<%= size.getSize()%>">Remove</a></td>
		<td><%= size.getId() %></td>
		<td><%= size.getSize() %></td>	 

	  </tr>
	<%} %>
	  </tbody>
	  
	  
	  
	  
	  </table>
</div>

</body>
</html>
