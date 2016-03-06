<%@ page import="com.wear.kapampangan.project.library.User" %>
<%@ page import="com.wear.kapampangan.project.library.UserInfo" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.library.Product" %>
<%@ page import="com.wear.kapampangan.project.library.OrderInfo" %>
<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="java.util.List" %>
<%! User currentUser = null; %>
<%! OrderInfo info = null; %>
<%! UserInfo info_user = null; %>
<%! DBManager manager = null; %>
<% if(session.getAttribute("currentuser") != null) currentUser = (User) session.getAttribute("currentuser");%>
<% if(session.getAttribute("currentuser") == null) response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/login1.jsp");%>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>
<% if(session.getAttribute("orderInfo-shop") == null ){
		response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/checkout-2.jsp");
} %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Wear Kapampangan</title>
 		<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
 		<link id="pagestyle" rel="stylesheet" type="text/css" href="assets/css/skin-1.css">
 		<link href="assets/css/style.css" rel="stylesheet">
	</head>
	<body>
		<jsp:include page="header.jsp" />

		<div class="container main-container headerOffset">
			<div class="row">
				<div class="breadcrumbDiv col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="cart.jsp">Cart</a></li>
						<li class="active"> Checkout</li>
					</ul>
				</div>
			</div>
 			<div class="row">
				<div class="col-lg-9 col-md-9 col-sm-7 col-xs-6 col-xxs-12 text-center-xs">
					<h1 class="section-title-inner"><span><i class="glyphicon glyphicon-shopping-cart"></i> Checkout</span></h1>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-5 rightSidebar col-xs-6 col-xxs-12 text-center-xs">
					<h4 class="caps"><a href="category.html"><i class="fa fa-chevron-left"></i> Back to shopping </a></h4>
				</div>
			</div>
			<div class="row">
<div class="col-lg-9 col-md-9 col-sm-12">
<div class="row userInfo">
<div class="col-xs-12 col-sm-12">
<div class="w100 clearfix">
<ul class="orderStep orderStepLook2">
<li><a><i class="fa" style="height:40px;width:100%;background:#e4e5e7;"> </i><span>&nbsp;</span> </a></li>
<li class=""><a href="checkout-2.jsp"> <i class="fa fa-map-marker "></i> <span> address</span>
</a></li>
<li class=""><a href="checkout-4.jsp"><i class="fa fa-money"> </i><span>Payment</span> </a></li>
<li class="active"><a href="checkout-5.jsp"><i class="fa fa-check-square "> </i><span>Order</span></a></li>
<li><a><i class="fa" style="height:40px;width:100%;background:#e4e5e7;"> </i><span>&nbsp;</span> </a></li>
</ul>
</div>

<div class="w100 clearfix">
<div class="row userInfo">
<div class="col-lg-12">
<h2 class="block-title-2"> Review Order </h2>
</div>
<div class="col-xs-12 col-sm-12">
<div class="cartContent w100 checkoutReview ">
<table class="cartTable table-responsive" style="width:100%">
<tbody>
<tr class="CartProduct cartTableHeader">
<th style="width:15%"> Product</th>
<th class="checkoutReviewTdDetails">Details</th>
<th style="width:10%">Unit Price</th>
<th class="hidden-xs" style="width:5%">QNT</th>
<th style="width:15%">Total</th>
</tr>
<% 	List<Product> cartItem = (List<Product>) request.getSession().getAttribute("cartItem");
	for(Product product : cartItem){%>
<tr class="CartProduct">
<td class="CartProductThumb">
<div><a href="product-details.jsp?productCode=<%= product.getItem().getProductCode() %>"><img src="<%= product.getItem().getImage() %>"></a>
</div>
</td>
<td>
<div class="CartDescription">
<h4><a href="product-details.jsp?productCode=<%= product.getItem().getProductCode() %>"><%= product.getItem().getName()%></a></h4>
<div style="background-color:<%= product.getColor().getHex() %>;width:10px;height:10px;margin-bottom:8px;border:1px solid gray;">&nbsp;</div>

<span class="size"><%= product.getSize().getSize() %></span>
</div>
</td>
<td class="delete">
<div class="price "><%= product.getItem().getPrice()%></div>
</td>
<td class="hidden-xs"><%= product.getQuantity() %></td>
<td class="price"><%= product.getTotalPrice() %></td>
</tr>
<%} %>
</tbody>
</table>
</div>
</div>
 
</div>
</div>
</div>

 
<div class="cartFooter w100">
<div class="box-footer">

<div class="pull-left"><a class="btn btn-default" href="checkout-4.jsp">
<i class="fa fa-arrow-left"></i> &nbsp; Payment method </a>
</div>
<div class="pull-right">
<a href="/FinalWK/confirm/order" class="btn btn-primary btn-small ">
Confirm Order &nbsp; <i class="fa fa-check"></i>
</a>
</div>
</div>
</div>

</div>
</div>
<!-- SIDE PRICE -->
<jsp:include page="side-price-bar.jsp"/>

</div>

 
 
<div class="gap"></div>
</div>
<jsp:include page="footer.jsp" />
<script src="../../../../ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
 
<script type="text/javascript" src="assets/js/jquery.parallax-1.1.js"></script>
 
<script type="text/javascript" src="assets/js/helper-plugins/jquery.mousewheel.min.js"></script>
 
<script type="text/javascript" src="assets/js/jquery.mCustomScrollbar.js"></script>
 
<script type="text/javascript" src="assets/plugins/icheck-1.x/icheck.min.js"></script>
 
<script src="assets/js/grids.js"></script>
 
<script src="assets/js/owl.carousel.min.js"></script>
 
<script src="../../../../cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script>
 
<script src="assets/js/bootstrap.touchspin.js"></script>
 
<script src="assets/js/script.js"></script>
<script type="text/javascript">
</script>
</body>