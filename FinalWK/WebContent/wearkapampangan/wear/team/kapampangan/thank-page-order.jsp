<%@ page import="com.wear.kapampangan.project.library.User" %>
<%@ page import="com.wear.kapampangan.project.library.UserInfo" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.library.Product" %>
<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="java.util.List" %>
<%! User currentUser = null; %>
<%! UserInfo info_user = null; %>
<%! DBManager manager = null; %>
<%! int orderNo = 0; %>
<% if(session.getAttribute("currentuser") != null) currentUser = (User) session.getAttribute("currentuser");%>
<% if(session.getAttribute("currentuser") == null) response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/login1.jsp");%>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>
<% orderNo = Integer.parseInt((request.getParameter("orderNo") != null ? request.getParameter("orderNo") : "0"));%>
<% if(((orderNo) == 0 && (session.getAttribute("currentuser") != null))){ response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/order-list.jsp"); }else { %>

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
<div class="col-lg-12 ">
<div class="row userInfo">
<div class="thanxContent text-center">
<h1> Thank you for your order <a href="order-status.jsp?orderId=<%= orderNo %>">#<%= orderNo %></a></h1>
<h4>Please wait for your oder confirmation and we'll let you know when your items are on their way</h4>
</div>
<div class="col-lg-7 col-center">
<h4></h4>
<div class="cartContent table-responsive  w100">
<table style="width:100%" class="cartTable cartTableBorder">
<tbody>
<tr class="CartProduct  cartTableHeader">
<td colspan="2"> Items to be Shipped</td>
<td style="width:15%"></td>
</tr>
<% 	List<Product> cartItem = (List<Product>) request.getSession().getAttribute("cartItem");
	for(Product product : cartItem){%>
<tr class="CartProduct">
<td class="CartProductThumb">
<div><a href="product-details.jsp?productCode=<%= product.getItem().getProductCode() %>"><img alt="img" src="<%= product.getItem().getImage() %>"></a>
</div>
</td>
<td>
<div class="CartDescription">
<h4><a href="product-details.html"><%= product.getItem().getName() %></a></h4>
<div style="background-color:<%= product.getColor().getHex() %>;width:10px;height:10px;margin-bottom:8px;border:1px solid gray;">&nbsp;</div>
<span class="size"><%= product.getSize().getSize() %></span>
<div class="price"><span><%= product.getItem().getPrice() %></span></div>
</div>
</td>
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
</html>
<%} %>