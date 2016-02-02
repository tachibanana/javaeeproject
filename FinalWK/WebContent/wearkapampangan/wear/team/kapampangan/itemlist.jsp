<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Item"%>

<%! DBManager manager = null; %>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager");%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Item (Item list)</title>
</head>
<body>
	<div>
		<table style="border:1px solid black;" cellspacing="0">
			<tr>
				<td style="border:1px solid black;"></td>
				<td style="border:1px solid black;">Product Code</td>
				<td style="border:1px solid black;">Name</td>
				<td style="border:1px solid black;">Price</td>
				<td style="border:1px solid black;">Image</td>
				<td style="border:1px solid black;">Description</td>
				<td style="border:1px solid black;">Status</td>
				
			</tr>
			<%for(Item item : manager.getItemList() ){%>
				<tr>
					<td style="border:1px solid black;"><input type="checkbox" /></td>
					<td style="border:1px solid black;"><%= item.getProductCode() %></td>
					<td style="border:1px solid black;"><%= item.getName()%></td>
					<td style="border:1px solid black;"><%= item.getPrice() %></td>
					<td style="border:1px solid black;"><%= item.getImage() %></td>
					<td style="border:1px solid black;"><%= item.getDescription() %></td>
					<td style="border:1px solid black;"><%= item.getStatus() %></td>
				</tr>
			<%}%>
		</table>
	</div>

</body>
</html>