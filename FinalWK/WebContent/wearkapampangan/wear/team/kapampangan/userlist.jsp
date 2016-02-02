<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.User"%>

<%! DBManager manager = null; %>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager");%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User</title>
</head>
<body>
	<div>
		<table style="border:1px solid black;" cellspacing="0">
			<tr>
				<td style="border:1px solid black;"></td>
				<td style="border:1px solid black;">ID</td>
				<td style="border:1px solid black;">FullName</td>
				<td style="border:1px solid black;">Email</td>
				<td style="border:1px solid black;">Password</td>
				<td style="border:1px solid black;">IsActivated</td>
			</tr>
			<%for(User user : manager.getAllUser()){%>
				<tr>
					<td style="border:1px solid black;"><input type="checkbox" /></td>
					<td style="border:1px solid black;"><%= user.getId() %></td>
					<td style="border:1px solid black;"><%= user.getFirstName() %> <%= user.getLastName() %></td>
					<td style="border:1px solid black;"><%= user.getEmail() %></td>
					<td style="border:1px solid black;"><%= user.getPassword() %></td>
					<td style="border:1px solid black;"></td>
				</tr>
			<%}%>
		</table>
	</div>
</body>
</html>