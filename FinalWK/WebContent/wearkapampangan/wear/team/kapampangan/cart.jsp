<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
		<link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.html">
		<link rel="shortcut icon" href="">
		<title>Wear Kapampangan</title>
		<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
 		<link id="pagestyle" rel="stylesheet" type="text/css" href="assets/css/skin-1.css">
 		<link href="assets/css/style.css" rel="stylesheet">
		<script src="assets/js/pace.min.js"></script>
		<script src="assets/js/pace.min.js"></script>
	</head>
	
	<body>
		
		<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
		<%@ page import="com.wear.kapampangan.project.library.Product" %>
		<%@ page import="java.util.List" %>
		
		<%! List<Product> listOfProduct = null; %>
		<% listOfProduct = (List<Product>) request.getSession().getAttribute("cartItem"); %>
		
		<!-- Header Here -->
		<jsp:include page="header.jsp" />
		
		<div class="container main-container headerOffset">
			<div class="row">
				<div class="breadcrumbDiv col-lg-12">
					<ul class="breadcrumb">
						<li> <a href="index.jsp">Home</a> </li>
						<li class="active">Cart </li>
					</ul>
				</div>
			</div>
			
			<div class="row">
				<div class="col-lg-9 col-md-9 col-sm-7">
					<h1 class="section-title-inner"><span><i class="glyphicon glyphicon-shopping-cart"></i> Shopping cart </span></h1>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-5 rightSidebar">
					<h4 class="caps"><a href="shop.jsp"><i class="fa fa-chevron-left"></i> Back to shopping </a></h4>
				</div>
			</div> 
			
			<div class="row">
				<div class="col-lg-9 col-md-9 col-sm-7">
					<div class="row userInfo">
						<div class="col-xs-12 col-sm-12">
							<div class="cartContent w100" id="cartItemId">
								<table class="cartTable table-responsive" style="width:100%">
									<tbody>
										<tr class="CartProduct cartTableHeader">
											<td style="width:15%"> Product </td>
											<td style="width:40%">Details</td>
											<td style="width:10%" class="delete">&nbsp;</td>
											<td style="width:10%">QNT</td>
											<!-- <td style="width:10%">Discount</td> -->
											<td style="width:15%">Total</td>
										</tr>
										<%for(Product product : listOfProduct){ %>
										<tr class="CartProduct">
											<td class="CartProductThumb"><div> <a href="product-details.html"><img src="<%= product.getItem().getImage()%>" alt="img"></a> </div></td>
											<td>
												<div class="CartDescription">
													<h4> <a href="#"><%= product.getItem().getName()%></a> </h4>
													<span class="size"><%= product.getSize().getSize() %></span>
													<div class="price"> <span><%= product.getItem().getPrice()%></span></div>
												</div>
											</td>
											<td class="delete"><a title="Delete"><i class="glyphicon glyphicon-trash fa-2x"></i></a></td>
											<td><input class="quanitySniper" type="text" value="<%= product.getQuantity()%>" name="quanitySniper"></td>
											<!-- <td>0</td> -->
											<td class="price"><%= product.getItem().getPrice() * product.getQuantity()%></td>
										</tr>
										<% } %>
								 </tbody>
							</table>
						</div>
 
						<div class="cartFooter w100">
							<div class="box-footer">
								<div class="pull-left">
									<a href="index.jsp" class="btn btn-default"> <i class="fa fa-arrow-left"></i> &nbsp; Continue shopping </a>
								</div>
								<div class="pull-right">
									<button type="submit" class="btn btn-default"> <i class="fa fa-undo" onclick=""></i> &nbsp; Update cart </button>
								</div>
							</div>
						</div>  
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-5 rightSidebar">
				<div class="contentBox">
					<div class="w100 costDetails">
						<div class="table-block" id="order-detail-content">
							<a class="btn btn-primary btn-lg btn-block " title="checkout" href="checkout-1.jsp" style="margin-bottom:20px"> Proceed to checkout &nbsp; <i class="fa fa-arrow-right"></i> </a>
							<div class="w100 cartMiniTable">
								<table id="cart-summary" class="std table">
									<tbody>
										<tr>
											<td>Total products</td>
											<td class="price">PHP 1500</td>
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
											<td> Total </td>
											<td class=" site-color" id="total-price">PHP 1500</td>
										</tr>
										
										<tr>
										<!--
											<td colspan="2">
												<div class="input-append couponForm">
												<input class="col-lg-8" id="appendedInputButton" type="text" placeholder="Coupon code">
												<button class="col-lg-4 btn btn-success" type="button">Apply!</button>
												</div>
											</td>
										-->
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
 		</div>

		<div style="clear:both"></div>
		</div> 
		<div class="gap"> </div>
		
		<!-- Footer Here -->
		<jsp:include page="footer.jsp"/>
		
		<script src="../../../../ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
		</script> <script src="assets/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.parallax-1.1.js"></script>
		<script type="text/javascript" src="assets/js/helper-plugins/jquery.mousewheel.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.mCustomScrollbar.js"></script>
		<script type="text/javascript" src="assets/js/ion-checkRadio/ion.checkRadio.min.js"></script>
		<script src="assets/js/grids.js"></script>
		<script src="assets/js/owl.carousel.min.js"></script>
		<script src="assets/js/jquery.minimalect.min.js"></script>
		<script src="assets/js/bootstrap.touchspin.js"></script>
		<script src="assets/js/script.js"></script>
	</body>
</html>
