<%@ page import="com.wear.kapampangan.project.library.OrderInfo"%>
<%@ page import="com.wear.kapampangan.project.library.UserInfo"%>
<%@ page import="com.wear.kapampangan.project.library.User"%>
<%@ page import="com.wear.kapampangan.project.library.Item"%>
<%@ page import="com.wear.kapampangan.project.library.Product"%>
<%@ page import="com.wear.kapampangan.project.library.Color"%>
<%@ page import="com.wear.kapampangan.project.library.Size"%>
<%@ page import="com.wear.kapampangan.project.database.DBManager"%>
<%@ page import="com.wear.kapampangan.project.library.Admin" %>
<%@ page import="java.util.List"%>
<%! DBManager manager = null; %>
<%! String searchName = "";%>
<%! Admin currentAdmin = null; %>
<%! String status = ""; %>

<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager");%>

<% if(session.getAttribute("currentadmin") != null) currentAdmin = (Admin) session.getAttribute("currentAdmin");%>
<% if(session.getAttribute("currentadmin") == null) response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/admin-login.jsp");%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Wear Kapampangan</title>

	<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="assets/css/font-import.css" />
	<link rel="stylesheet" href="assets/js/bootstrap.min.js" />
	<link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div class="container col-md-8">
		<h1><i class="fa fa-list-alt"></i>Order List
                    
        </h1>
		<h2 class="page-header">
                    <small>YOUR ORDER LIST</small>
        </h2>
			                                                                                     
		<div class="table-responsive ">          
			<table class="table table-bordered">
				<thead >
				  <tr class="success">
					<th></th>
					<th>Full Name</th>
					<th>Email</th>
					<th>Order Information</th>
					<th>Total Price</th>
					<th>No. of Items</th>
					<th>Date/ Time</th>
					<th>No. of Items</th>
					<th></th>
				  </tr>
				</thead>
				<tbody>
				  <tr>
					<td><span class="label label-danger">New</span></td>
					<td>165160</td>
					<td>Rafael Manuel</td>
					<td>rafaelanuel00@gmail.com</td>
					<td><button type="button" class="btn btn-success btn-md">View Status</button></td>
					<td>350.00</td>
					<td>1</td>
					<td>2016/18/02</td>
					<td><button type="button" class="btn btn-success btn-md">Deliver</button></td>
				  </tr>
				</tbody>
			</table>
		</div>
	</div>


	
</body>
</html>
