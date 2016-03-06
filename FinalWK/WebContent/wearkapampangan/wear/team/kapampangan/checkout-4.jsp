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
<li class="active"><a href="checkout-4.jsp"><i class="fa fa-money"> </i><span>Payment</span> </a></li>
<li><a href="checkout-5.jsp"><i class="fa fa-check-square "> </i><span>Order</span></a></li>
<li><a><i class="fa" style="height:40px;width:100%;background:#e4e5e7;"> </i><span>&nbsp;</span> </a></li>
</ul>
 
</div>

<div class="w100 clearfix">
<div class="row userInfo">
<div class="col-lg-12">
<h2 class="block-title-2"> Payment method </h2>
<p>Please select the preferred shipping method to use on this order.</p>
<hr>
</div>
<div class="col-xs-12 col-sm-12">
<div class="paymentBox">
<div class="panel-group paymentMethod" id="accordion">
<div class="panel panel-default">
<div class="panel-heading panel-heading-custom">
<h4 class="panel-title"><a class="cashOnDelivery" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
<span class="numberCircuil">Option 1</span> <strong> Cash on
Delivery</strong> </a></h4>
</div>
<div id="collapseOne" class="panel-collapse collapse in">
<div class="panel-body">
<p>All transactions are secure and encrypted, and we neverstor To
learn more, please view our privacy policy.</p>
<br>
<label class="radio-inline" for="radios-4">
<input name="radios" id="radios-4" value="4" type="radio" checked = "true">
Cash On Delivery </label>
<div class="form-group">
<label for="CommentsOrder">Add Comments About Your Order</label>
<textarea id="CommentsOrder" class="form-control" name="CommentsOrder" cols="26" rows="3"></textarea>
</div>
<div class="form-group clearfix">
<label class="checkbox-inline" for="checkboxes-1">
<input name="checkboxes" id="checkboxes-1" value="1" type="checkbox" >
I have read and agree to the <a href="terms-condition.jsp">Terms & Conditions</a>
</label>
</div>

</div>
</div>
</div>

</div>
</div>
 
</div>
</div>
</div>

<div class="cartFooter w100">
<div class="box-footer">
<div class="pull-left"><a class="btn btn-default" href="index.jsp"> <i class="fa fa-arrow-left"></i> &nbsp; Back to Shop </a></div>
<div class="pull-right"><a class="btn btn-primary btn-small " id = "btnorder">
 Order &nbsp; <i class="fa fa-arrow-circle-right"></i> </a></div>
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

$('#btnorder').click(function(){
	
	if($('#checkboxes-1').prop('checked') == true){
		window.location.href = "checkout-5.jsp";
		
	}else{
		
		alert("Please read and check the Terms & Conditions");
		
	}
	
});

</script>
</body>