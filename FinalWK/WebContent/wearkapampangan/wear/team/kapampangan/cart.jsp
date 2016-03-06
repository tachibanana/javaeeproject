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
									<tbody id="table-container">
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
													<div style="background-color:<%= product.getColor().getHex() %>;width:10px;height:10px;margin-bottom:8px;border:1px solid gray;margin-bottom:8px;">&nbsp;</div>
													<span class="size"><%= product.getSize().getSize() %></span>
													<div class="price"> <span><%= product.getItem().getPrice()%></span></div>
												</div>
											</td>
											<td class="delete"><a title="Delete"><i class="glyphicon glyphicon-trash fa-2x"></i></a></td>
											<td><input class="quanitySniper" type="text" value="<%= product.getQuantity()%>" name="quanitySniper" id="<%= product.getItem().getProductCode()%>"></td>
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
									<button id = "update-cart" type="submit" class="btn btn-default"> <i class="fa fa-undo" ></i> &nbsp; Update cart </button>
								</div>
							</div>
						</div>  
					</div>
				</div>
			</div>
			
			<!-- Side Bar -->
			<jsp:include page="side-price-bar.jsp" />
			
			
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
		<script>
		
		var xmlhttp = new XMLHttpRequest();
		var code = "RX7809";
		var name = "Libut Libut";
		var price = 200;
		var color = "RED";
		var size = "XL";
		var quantity = 5;
		
		function updateItem(code_ , color_ , size_ , quantity_){
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					document.getElementById("cartItemId").innerHTML = xmlhttp.responseText;
				}
			};
			xmlhttp.open("GET","/FinalWK/update/cart/item?productCode=" + code_ +"&name=" + name + "&newQuantity=" + quantity_ +
					"&color=" + color_ + "&size=" + size_,true);
			xmlhttp.send();
		}
	
		$("#update-cart").click(function(){
			var ctr = 0;
			$("#table-container tr").each(function(){
				ctr += 1;
			});
			
			var newValue = "";
			if(ctr > 1){
				$("#table-container tr .quanitySniper").each(function(){
					newValue += ($(this).val() + "@");
				});
				
			window.location.href = "/FinalWK/cart/update/new?update_quantity=" + newValue;	
			}
			
		});
</script>
	</body>
</html>
