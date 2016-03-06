<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<%@ page import="com.wear.kapampangan.project.database.DBManager"%>
<%@ page import="com.wear.kapampangan.project.library.User"%>

<%! DBManager manager = null; %>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>

<body>
<jsp:include page="admin-header.jsp" />

<div class="container">
      <h1>UserList</h1>
	 
  <table class="table table-striped">
    <thead>
      <tr>
      <th>&nbsp </th>
      <th>&nbsp </th>
      <th>&nbsp </th>
	  <th>Id</th>
	  <th>First</th>
	  <th>Last</th>
	  <th>Email</th>
	  <th>Password</th>
	
      </tr>
	 
    </thead>
    <tbody>
    <%for(User user : manager.getAllUser()){ %>
      <tr>
      <% System.out.println("isActivate : " + manager.getUserAuthByUserId(user.getId())); %>
	<td><a href="/FinalWK/user/block?userId=<%= user.getId() %>"><%= (manager.getUserAuthByUserId(user.getId()).getIsActivated() == 1 ? "block" : "unblock" )%></a></td>
	<td><a href="/FinalWK/remove/user?userId=<%= user.getId() %>">remove</a></td>
	<% if(manager.getUserAuthByUserId(user.getId()).getAccountType().equals("user")){ %>
		<td><a href="/FinalWK/change/account/type?accountType=admin&user_id=<%= user.getId()%>" >appoint as admin</a></td>
	<%}else{ %>
		<td><a href="/FinalWK/change/account/type?accountType=user&user_id=<%= user.getId()%>" >demote</a></td>
	<%} %>
	 <td><%= user.getId() %></td>
	 <td> <%= user.getFirstName() %></td>
	 <td><%= user.getLastName() %></td>
	 <td><%= user.getEmail() %></td>
	 <td><%= user.getPassword() %></td>
	  </tr>
	<%} %>
	  </tbody>
</table>
</div>

</body>
</html>
