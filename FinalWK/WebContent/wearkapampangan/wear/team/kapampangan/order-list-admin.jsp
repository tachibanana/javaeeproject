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
	 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Wear Kapampangan</title>

	<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="assets/css/font-import.css" />
	<link rel="stylesheet" href="assets/js/bootstrap.min.js" />
	<link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
 <script src="assets/js/jquery-2.1.4.js"></script>
</head>

<body>
	<jsp:include page="admin-header.jsp" />
	
	<div class="container col-md-12">
		<h2 class="page-header">
                    <small>CUSTOMER ORDER LIST</small>
        </h2>
			                                                                                     
		<div class="table-responsive ">          
			<table class="table table-bordered">
				<thead >
				  <tr class="success">
					<th>&nbsp;</th>
									<th data-class="expand" data-sort-initial="true"><span
										title="table sorted by this column on load">Order Number</span></th>
									<th data-hide="phone,tablet" data-sort-ignore="true">Full Name</th>
									<th data-hide="phone,tablet" data-sort-ignore="true">Email</th>
									<th data-hide="phone,tablet"><strong>Order Information</strong></th>
									<th data-hide="default">Total Price</th>
									<th data-hide="default">No. of items</th>
									<th data-hide="default" data-type="numeric">Date / Time</th>
									<th data-hide="phone" data-type="numeric">&nbsp;</th>
									<th data-hide="phone" data-type="numeric">&nbsp;</th>
				  </tr>
				</thead>
				<tbody>
				  <%
									for(OrderInfo info : manager.getAllOrderInfo()){
										int quantity = 0;
										int loop = 0;
										String statCommand = "Accept";
										
										if(info.getStatus().equals("0")){
											statCommand = "Accept";
										}else if(info.getStatus().equals("1")){
											statCommand = "Deliver";
										}else if(info.getStatus().equals("2")){
											statCommand = "Delivering ...";
										}else if(info.getStatus().equals("3")){
											statCommand = "Done";
										}else if(info.getStatus().equals("4")){
											statCommand = "Declined";
										}
										
										if(manager.getOrderViewById(info.getId()).getIsRead() == 0){
											status = "<span class='label label-danger'>new</span>";
										}else{
											status = "<span class='label label-primary'>read</span>";
										}
										
										double totalPrice = 0.0;
										
										for(Product product : info.getItemList()){
											quantity += product.getQuantity();
											totalPrice += product.getTotalPrice();
											loop ++;
										}
								%>
								<tr>
									<td><%= status %></td>
									<td><%= info.getOrderNo()  %></td>
									<td><%= info.getUser().getFirstName() %> <%= info.getUser().getLastName()  %></td>
									<td><%= info.getUser().getEmail() %></td>
								
									<td><a
										href="/FinalWK/set/read?orderId=<%=info.getOrderNo()%>&id=<%= info.getId() %>&email=<%= info.getUser().getEmail() %>"
										
										class="btn btn-success btn-sm">Open</a></td>
									<td><b>PHP</b> <span style="color:green"><%= totalPrice%>0</span></td>
									<td><%= quantity %></td>
									<td data-value="78025368997"><%=info.getDate()%></td>
									<td data-value="3"><a type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal" id="send-mail" name="<%= info.getUser().getEmail()%>">Send Mail</a></td>
									<%if(info.getStatus().equals("0")){%>
										<td data-value="3"><a type="button" class="btn btn-success btn-sm" href="/FinalWK/accept/order?order_no=<%= info.getOrderNo() %>&status=<%= info.getStatus()%>&sendTo=<%= info.getUser().getEmail() %>"><%= statCommand %></a></td>
									<%}else if(info.getStatus().equals("1")){ %>
										<td data-value="3"><a type="button" class="btn btn-warning btn-sm" href="/FinalWK/deliver/mail?order_no=<%= info.getOrderNo() %>&status=<%= info.getStatus()%>&sendTo=<%= info.getUser().getEmail() %>"><%= statCommand %></a></td>
									<%}else if(info.getStatus().equals("2")){ %>
										<td data-value="3"><a type="button" class="btn btn-warning btn-sm" href="/FinalWK/update/order/status?order_no=<%= info.getOrderNo() %>&status=<%= info.getStatus()%>"><%= statCommand %></a></td>
									<%}else if(info.getStatus().equals("3")){ %>
										<td data-value="3"><a type="button" class="btn btn-default disabled btn-sm"><%= statCommand %></a></td>
									<%}else if(info.getStatus().equals("4")){ %>
										<td data-value="3"><a type="button" class="btn btn-danger disabled btn-sm" ><%= statCommand %></a></td>
									<%} %>
									
								</tr>
								<%
									}
								%>
				</tbody>
			</table>
		</div>
	</div>
</body>
	<jsp:include page="../../../componse/compose.jsp" />
	<script>
		$(document).ready(function(){
			var email = "";
			var subject = "";
			var message = "";
			
			$("#send-mail").click(function(){
				email = $(this).attr("name");
				$("#inputTo").val(email);
			});
			
			$("#confrim-mail").click(function(){
				email = $("#inputTo").val();
				subject = $("#inputSubject").val();
				message = $("#inputBody").val();
				if((email && subject && message)){
					window.location.href = "/FinalWK/compose/mail?sendTo="+ email +"&subject=" + subject +"&message=" + message;
				}
			});
		});
	</script>
</html>
