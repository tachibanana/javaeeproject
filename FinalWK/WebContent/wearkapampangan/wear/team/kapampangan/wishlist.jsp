<%@ page import="com.wear.kapampangan.project.library.User" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%! User currentUser = null; %>
<%! DBManager manager = null; %>
<% if(session.getAttribute("currentuser") != null) currentUser = (User) session.getAttribute("currentuser");%>
<% if(session.getAttribute("currentuser") == null) response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/login1.jsp");%>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager");%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Wear Kapampangan</title>
 		<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
		<link id="pagestyle" rel="stylesheet" type="text/css" href="assets/css/skin-1.css">
 		<link href="assets/css/style.css" rel="stylesheet">
		<script src="assets/js/pace.min.js"></script>
		<script src="assets/js/pace.min.js"></script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div class="container main-container headerOffset">
			<div class="row">
				<div class="breadcrumbDiv col-lg-12">
					<ul class="breadcrumb">
						<li> <a href="index.html">Home</a> </li>
						<li> <a href="account.html">My Account</a> </li>
						<li class="active"> Wisthlist </li>
					</ul>
				</div>
			</div>
			  
			<div class="row">
				<div class="col-lg-9 col-md-9 col-sm-7">
				<h1 class="section-title-inner"><span><i class="glyphicon glyphicon-heart"></i> Wisthlist </span></h1>
				<div class="row userInfo">
			<div class="col-lg-12">
				<h2 class="block-title-2"> Update your wishlist if it has changed. </h2>
			</div>
			<div class="col-xs-12 col-sm-12">
				<table>
					<tbody id="wishlistHere">
					<% if(currentUser != null){%>
					<%// System.out.println(currentUser.getEmail()); %>
					<%// System.out.println(manager.getWishlistItemByUserEmail(currentUser.getEmail())); %>
					<%for(Item item : manager.getWishlistItemByUserEmail(currentUser.getEmail())){ %>
						<tr class="CartProduct">
							<td style="width:10%" class="CartProductThumb">
								<div>
									<a href="product-details.jsp?productCode=<%= item.getProductCode() %>"><img src="<%= item.getImage() %>" alt="img"></a>
								</div>
							</td>
					
						<td style="width:40%">
							<div class="CartDescription">
								<h4> <a href="product-details.jsp?productCode=<%= item.getProductCode() %>"><%= item.getName() %></a> </h4>
								<span class="size">12 x 1.5 L</span>
								<div class="price"> <span>PHP <%= item.getPrice() %></span> </div>
							</div>
						</td>
						
						<td style="width:15%">
							<a class="btn btn-primary" onclick="location.href='product-details.jsp?productCode=<%=item.getProductCode()%>'">
								<span class="add2cart"><i class="glyphicon glyphicon-shopping-cart"> </i> Add to cart </span>
							</a>
						</td>
						<td style="width:40%" class="delete"><a title="Delete" onclick="removeToWishList('<%= item.getProductCode() %>');"> <i class="glyphicon glyphicon-trash fa-2x"></i> </a></td>
					</tr>
					<%}} %>
</tbody>
</table>
</div>
<div class="col-lg-12 clearfix">
<ul class="pager">
<li class="previous pull-right"><a href="index.jsp"> <i class="fa fa-home"></i> Go to Shop </a></li>
<li class="next pull-left"><a href="account.jsp"> &larr; Back to My Account</a></li>
</ul>
</div>
</div>
 
</div>
<div class="col-lg-3 col-md-3 col-sm-5"> </div>
				</div>

				<div style="clear:both"></div>
			</div>  
			<div class="gap"> </div>
		<jsp:include page="footer.jsp" />
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
		function removeToWishList(code_){
			var xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				document.getElementById("wishlistHere").innerHTML = xmlhttp.responseText;
			}
		};
		xmlhttp.open("GET","/FinalWK/wishlist/remove?productCode=" + code_ ,true);
		xmlhttp.send();
	}
</script>
 		
</body>
</html>
