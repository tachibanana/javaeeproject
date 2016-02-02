<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.wear.kapampangan.project.database.DBManager"%>
<%@ page import="com.wear.kapampangan.project.library.Item"%>

<%! String productCode = ""; %>
<%! DBManager manager = null; %>
<%! Item item = null; %>
<% productCode = (request.getParameter("productCode") != null ? request.getParameter("productCode") : ""); %>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>
<% item = manager.getItemByProductCode(productCode);%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div id="picture-container">
			<img src = "<%= item.getImage()%>" />
		</div>
		<form action="/FinalWK/image/upload?productCode=<%= item.getProductCode() %>" method="post" enctype="multipart/form-data" name="form1">
			<input type="file" name="file"/>
			<input type="submit" />
		</form>
	</div>

</body>
</html>