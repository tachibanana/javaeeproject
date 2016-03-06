<%@ page import="com.wear.kapampangan.project.library.User" %>
<%@ page import="com.wear.kapampangan.project.library.UserInfo" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%! User currentUser = null; %>
<%! UserInfo info_user = null; %>
<%! DBManager manager = null; %>


<% if(session.getAttribute("currentuser") != null) currentUser = (User) session.getAttribute("currentuser");%>
<% if(session.getAttribute("currentuser") == null) response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/login1.jsp");%>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>
<% info_user = (UserInfo) manager.getUserInfoByUserId(currentUser.getId()); %>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.html">
<link rel="shortcut icon" href="assets/ico/favicon.png">
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
<li><a href="index.html">Home</a></li>
<li><a href="cart.html">Cart</a></li>
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
<li><a href="checkout-1.html"> <i class="fa fa-map-marker "></i> <span> address</span> </a>
</li>
<li class="active"><a href="checkout-2.html"> <i class="fa fa fa-envelope  "></i> <span> Billing </span></a>
</li>
<li><a href="checkout-3.html"><i class="fa fa-truck "> </i><span>Shipping</span> </a></li>
<li><a href="checkout-4.html"><i class="fa fa-money  "> </i><span>Payment</span> </a></li>
<li><a href="checkout-5.html"><i class="fa fa-check-square "> </i><span>Order</span></a>
</li>
</ul>
 
</div>
<div class="w100 clearfix">
<div class="row userInfo">
<div class="col-lg-12">
<h2 class="block-title-2"> To add a billing address, please fill out the form
below. </h2>
</div>
<div class="col-xs-12 col-sm-12">
<label class="checkbox-inline" for="checkboxes-0">
<input name="checkboxes" id="checkboxes-0" value="1" type="checkbox" class="my-check-item">
My delivery and billing addresses are the same. </label>
<hr>
</div>
<div class="col-xs-12 col-sm-6">
<div class="form-group required">
<label for="InputName">First Name <sup>*</sup> </label>
<input required type="text" class="form-control" id="InputName" placeholder="First Name">
</div>
<div class="form-group required">
<label for="InputLastName">Last Name <sup>*</sup> </label>
<input required type="text" class="form-control" id="InputLastName" placeholder="Last Name">
</div>
<div class="form-group">
<label for="InputEmail">Email </label>
<input type="text" class="form-control" id="InputEmail" placeholder="Email">
</div>
<div class="form-group">
<label for="InputCompany">Company </label>
<input type="text" class="form-control" id="InputCompany" placeholder="Company">
</div>
<div class="form-group required">
<label for="InputAddress">Address <sup>*</sup> </label>
<input required type="text" class="form-control" id="InputAddress" placeholder="Address">
</div>
<div class="form-group">
<label for="InputAddress2">Address (Line 2) </label>
<input type="text" class="form-control" id="InputAddress2" placeholder="Address">
</div>
<div class="form-group required">
<label for="InputCity">City <sup>*</sup> </label>
<input required type="text" class="form-control" id="InputCity" placeholder="City">
</div>

</div>
<div class="col-xs-12 col-sm-6">
<div class="form-group required">
<label for="InputZip">Zip / Postal Code <sup>*</sup> </label>
<input required type="text" class="form-control" id="InputZip" placeholder="Zip / Postal Code">
</div>

<div class="form-group">
<label for="InputAdditionalInformation">Additional information</label>
<textarea rows="3" cols="26" name="InputAdditionalInformation" class="form-control" id="other"></textarea>
</div>
<div class="form-group required">
<label for="InputMobile">Mobile phone <sup>*</sup></label>
<input required type="tel" name="InputMobile" class="form-control" id="InputMobile">
</div>
</div>
</div>
 
</div>
<div class="cartFooter w100">
<div class="box-footer">
<div class="pull-left">
<a class="btn btn-default" href="checkout-2.jsp"> <i class="fa fa-arrow-left"></i>
&nbsp; Shipping address </a></div>
<div class="pull-right">
<a href="checkout-3.html" class="btn btn-primary btn-small "> Shipping method &nbsp; <i class="fa fa-arrow-circle-right"></i> </a></div>
</div>
</div>
 
</div>
</div>
 
</div>
<div class="col-lg-3 col-md-3 col-sm-12 rightSidebar">
<div class="w100 cartMiniTable">
<table id="cart-summary" class="std table">
<tbody>
<tr>
<td>Total products</td>
<td class="price">PHP 1,250</td>
</tr>
<tr style="">
<td>Shipping</td>
<td class="price"><span class="success">Free shipping!</span></td>
</tr>
<!--
<tr class="cart-total-price ">
<td>Total (tax excl.)</td>
<td class="price">$216.51</td>
</tr>
<tr>
<td>Total tax</td>
<td class="price" id="total-tax">$0.00</td>
</tr>
-->
<tr>
<td> Total</td>
<td class=" site-color" id="total-price">PHP 1,250</td>
</tr>
</tbody>
<tbody>
</tbody>
</table>
</div>
 
</div>
 
</div>
 
<div style="clear:both"></div>
</div>
 
<div class="gap"></div>

<jsp:include page="footer.jsp" />
<script src="../../../../ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
</script>
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
<script>
	
	$(".my-check-item").change(function(){
		
		
	});
</script>
</body>

</html>
