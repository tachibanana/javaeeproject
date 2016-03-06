<%@ page import="com.wear.kapampangan.project.library.OrderInfo" %>
<%@ page import="com.wear.kapampangan.project.library.UserInfo" %>
<%@ page import="com.wear.kapampangan.project.library.User" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.library.Product" %>
<%@ page import="com.wear.kapampangan.project.library.Color" %>
<%@ page import="com.wear.kapampangan.project.library.Size" %>
<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="java.util.List" %>
<%! User currentUser = null; %>
<%! DBManager manager = null; %>
<%! OrderInfo info = null;%>
<%! int orderId = 000000; %>
<% if(session.getAttribute("currentuser") != null) currentUser = (User) session.getAttribute("currentuser");%>
<% if(session.getAttribute("currentuser") == null) response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/login1.jsp");%>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager");%>
<% orderId = (request.getParameter("orderId") != null ? Integer.parseInt(request.getParameter("orderId")) : 000000);%>
<% info = (OrderInfo) manager.getOrderInfoByUserIdAndOrderNo( manager.getUserIdByEmail(currentUser.getEmail()) , orderId); %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Wear Kapampangan</title>
	<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link id="pagestyle" rel="stylesheet" type="text/css" href="assets/css/skin-1.css">
	<link href="assets/css/style.css" rel="stylesheet">
	<link href="assets/css/footable-0.1.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/footable.sortable-0.1.css" rel="stylesheet" type="text/css"/>
	<script src="assets/js/pace.min.js"></script>
 
</head>
<body>
	<% if(info != null){%>
	<jsp:include page="header.jsp" />
	<div class="container main-container headerOffset">
	<div class="row">
		<div class="breadcrumbDiv col-lg-12">
			<ul class="breadcrumb">
				<li><a href="index.html">Home</a></li>
				<li><a href="account.html">My Account</a></li>
				<li class="active"> Order List</li>
			</ul>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-9 col-md-9 col-sm-7">
		<h1 class="section-title-inner"><span><i class="fa fa-list-alt"></i> Order Status </span></h1>
		<div class="row userInfo">
		<div class="col-lg-12">
		<h2 class="block-title-2"> Your Order Status </h2>
		</div>
		<div class="statusContent">
		<div class="col-sm-12">
		<div class=" statusTop">
		<p><strong>Status:</strong> <%= info.getStatus() %></p>
		<p><strong>Order Date:</strong> <%= info.getDate() %></p>
		<p><strong>Order Number:</strong> #<%= info.getOrderNo() %></p>
		</div>
		</div>
		
		<div class="col-sm-6">
		<div class="order-box">
		<div class="order-box-header">
		Shipping Address
		</div>
		<div class="order-box-content">
		<div class="address">
		<p><strong>TITLE </strong></p>
		<p><strong><%= info.getUser().getFirstName() %> <%= info.getUser().getLastName() %></strong></p>
		<div class="adr">
		<%= info.getuserInfo().getAddress1() %><br><%= info.getuserInfo().getAddress2() %>
		</div>
		</div>
		</div>
		</div>
		</div>
		
		
		
		<div class="col-sm-12 clearfix">
		<div class="order-box">
		<div class="order-box-header">
		Order Items
		</div>
		<div class="order-box-content">
		<div class="table-responsive">
		<table class="order-details-cart">
		<tbody>
		<% for(Product product : info.getItemList()){ %>
		
		<tr class="cartProduct">
		<td class="cartProductThumb" style="width:20%">
		<div><a href="product-details.html"> <img alt="img" src="<%= product.getItem().getImage() %>">
		</a></div>
		</td>
		<td style="width:40%">
		<div class="miniCartDescription">
		<h4><a href="product-details.jsp?productCode=<%= product.getItem().getProductCode() %>"> <%= product.getItem().getName() %> </a></h4>
		<div style="background-color:<%= product.getColor().getHex() %>;width:10px;height:10px;margin-bottom:8px;border:1px solid gray;">&nbsp;</div>
		<span class="size"><%= product.getSize().getSize() %></span>
		<div class="price"><span><%= product.getItem().getPrice() %></span></div>
		</div>
		</td>
		<td class="" style="width:10%"><a> X <%= product.getQuantity() %> </a></td>
		<td class="" style="width:15%"><span> <%= product.getTotalPrice() %> </span></td>
		</tr>
		
		<%} %>
		
		</tbody>
		</table>
		</div>
		</div>
		</div>
		</div>
		</div>
		<div class="col-lg-12 clearfix">
		<ul class="pager">
		<li class="previous pull-right"><a href="index.html"><i class="fa fa-home"></i> Go to Shop </a>
		</li>
		<li class="next pull-left"><a href="account.html"> ← Back to My Account</a></li>
		</ul>
		</div>
		</div>
		 
		</div>
	<div class="col-lg-3 col-md-3 col-sm-5"></div>
	</div>
	 
<div style="clear:both"></div>
</div>
 
<div class="gap"></div>

<jsp:include page="footer.jsp" />
 
<script src="../../../../ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
</script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
 
<script src="assets/js/footable.js" type="text/javascript"></script>
<script src="assets/js/footable.sortable.js" type="text/javascript"></script>
<script type="text/javascript" src="assets/js/jquery.parallax-1.1.js"></script>
 
<script type="text/javascript" src="assets/js/helper-plugins/jquery.mousewheel.min.js"></script>
 
<script type="text/javascript" src="assets/js/jquery.mCustomScrollbar.js"></script>
 
<script type="text/javascript" src="assets/plugins/icheck-1.x/icheck.min.js"></script>
 
<script src="assets/js/grids.js"></script>
 
<script src="assets/js/owl.carousel.min.js"></script>
 
<script src="../../../../cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script>
 
<script src="assets/js/bootstrap.touchspin.js"></script>
 
<script src="assets/js/script.js"></script>
<%} %>
</body>
</html>
