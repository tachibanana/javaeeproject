<%@ page import="com.wear.kapampangan.project.library.OrderInfo"%>
<%@ page import="com.wear.kapampangan.project.library.UserInfo"%>
<%@ page import="com.wear.kapampangan.project.library.User"%>
<%@ page import="com.wear.kapampangan.project.library.Item"%>
<%@ page import="com.wear.kapampangan.project.library.Product"%>
<%@ page import="com.wear.kapampangan.project.library.Color"%>
<%@ page import="com.wear.kapampangan.project.library.Size"%>
<%@ page import="com.wear.kapampangan.project.database.DBManager"%>
<%@ page import="java.util.List"%>
<%!User currentUser = null;%>
<%!DBManager manager = null;%>
<%
	if(session.getAttribute("currentuser") != null) currentUser = (User) session.getAttribute("currentuser");
%>
<%
	if(session.getAttribute("currentuser") == null) response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/login1.jsp");
%>
<%
	manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wear Kapampangan</title>

<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">

<link id="pagestyle" rel="stylesheet" type="text/css"
	href="assets/css/skin-1.css">

<link href="assets/css/style.css" rel="stylesheet">

<link href="assets/css/footable-0.1.css" rel="stylesheet"
	type="text/css" />
<link href="assets/css/footable.sortable-0.1.css" rel="stylesheet"
	type="text/css" />

<script src="assets/js/pace.min.js"></script>
<script src="assets/js/pace.min.js"></script>

</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container main-container headerOffset">
		<div class="row">
			<div class="breadcrumbDiv col-lg-12">
				<ul class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li><a href="account.html">My Account</a></li>
					<li class="active">Order List</li>
				</ul>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-9 col-md-9 col-sm-7">
				<h1 class="section-title-inner">
					<span><i class="fa fa-list-alt"></i> Order List </span>
				</h1>
				<div class="row userInfo">
					<div class="col-lg-12">
						<h2 class="block-title-2">Your Order List</h2>
					</div>
					<div style="clear: both"></div>
					<div class="col-xs-12 col-sm-12">
						<table class="footable">
							<thead>
								<tr>
									<th data-class="expand" data-sort-initial="true"><span
										title="table sorted by this column on load">Order ID</span></th>
									<th data-hide="phone,tablet" data-sort-ignore="true">No.
										of items</th>
									<th data-hide="phone,tablet"><strong></strong></th>
									<th data-hide="default">Price</th>
									<th data-hide="default" data-type="numeric">Date</th>
									<th data-hide="phone" data-type="numeric">Status</th>
								</tr>
							</thead>
							<tbody>
								<%
									for(OrderInfo info : manager.getOrderInfoByUserId(manager.getUserIdByEmail(currentUser.getEmail()))){
										int quantity = 0;
										int loop = 0;
										double totalPrice = 0.0;
										
										String statCommand = "Waiting";
										
										if(info.getStatus().equals("0")){
											statCommand = "Waiting";
										}else if(info.getStatus().equals("1")){
											statCommand = "Pending";
										}else if(info.getStatus().equals("2")){
											statCommand = "Delivering ...";
										}else if(info.getStatus().equals("3")){
											statCommand = "Finish";
										}else if(info.getStatus().equals("4")){
											statCommand = "Declined";
										}
										
										for(Product product : info.getItemList()){
									quantity += product.getQuantity();
									totalPrice += product.getTotalPrice();
									loop ++;
										}
								%>
								<tr>
									<td><%=info.getOrderNo()%></td>
									<td><%=(quantity * loop)%> <small>item(s)</small></td>
									<td><a
										href="order-status.jsp?orderId=<%=info.getOrderNo()%>"
										class="btn btn-primary btn-sm">view status</a></td>
									<td><%=totalPrice%></td>
									<td data-value="78025368997"><%=info.getDate()%></td>
									<%if(info.getStatus().equals("0")){%>
										<td data-value="3"><span class="label label-info"><%= statCommand%></span></td>
									<%}else if(info.getStatus().equals("1")){ %>
										<td data-value="3"><span class="label label-success"><%= statCommand%></span></td>
									<%}else if(info.getStatus().equals("2")){ %>
										<td data-value="3"><span class="label label-warning"><%= statCommand%></span></td>
									<%}else if(info.getStatus().equals("3")){ %>
										<td data-value="3"><span class="label label-default"><%= statCommand%></span></td>
									<%}else if(info.getStatus().equals("4")){ %>
										<td data-value="3"><span class="label label-danger"><%= statCommand%></span></td>
									<%} %>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
					<div style="clear: both"></div>
					<div class="col-lg-12 clearfix">
						<ul class="pager">
							<li class="previous pull-right"><a href="index.jsp"> <i
									class="fa fa-home"></i> Go to Shop
							</a></li>
							<li class="next pull-left"><a href="account.jsp"> &larr;
									Back to My Account</a></li>
						</ul>
					</div>
				</div>

			</div>
			<div class="col-lg-3 col-md-3 col-sm-5"></div>
		</div>

		<div style="clear: both"></div>
	</div>

	<div class="gap"></div>
	<jsp:include page="footer.jsp" />
	<script
		src="../../../../ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
		
	</script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>

	<script src="assets/js/footable.js" type="text/javascript"></script>
	<script src="assets/js/footable.sortable.js" type="text/javascript"></script>
	<script type="text/javascript" src="assets/js/jquery.parallax-1.1.js"></script>

	<script type="text/javascript"
		src="assets/js/helper-plugins/jquery.mousewheel.min.js"></script>

	<script type="text/javascript"
		src="assets/js/jquery.mCustomScrollbar.js"></script>

	<script type="text/javascript"
		src="assets/js/ion-checkRadio/ion.checkRadio.min.js"></script>

	<script src="assets/js/grids.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>

	<script src="assets/js/jquery.minimalect.min.js">
		
	</script>

	<script src="assets/js/bootstrap.touchspin.js"></script>

	<script src="assets/js/script.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>
