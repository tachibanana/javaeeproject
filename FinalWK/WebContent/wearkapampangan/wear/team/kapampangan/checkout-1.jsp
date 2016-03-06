<%@ page import="com.wear.kapampangan.project.library.User" %>
<%@ page import="com.wear.kapampangan.project.library.Product" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="java.util.List" %>
<%! User currentUser = null; %>
<%! DBManager manager = null; %>
<%! Product product = null; %>
<% try { if(( (List<Product>) (session.getAttribute("cartItem")) ).size() <= 0)  response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/cart.jsp"); }catch(Exception e){} %>
<% if(session.getAttribute("currentuser") != null) currentUser = (User) session.getAttribute("currentuser");%>
<% if(( (List<Product>) (session.getAttribute("cartItem")) ).size() >= 1 && session.getAttribute("currentuser") != null) response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/checkout-2.jsp");%>
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

	</head>
	<body>
	<jsp:include page="header.jsp" />
	
	
		<div class="container main-container headerOffset">
			<div class="row">
				<div class="breadcrumbDiv col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a></li>
						<li class="active"> Authentication</li>
					</ul>
				</div>
			</div>
 
<div class="row">
<div class="col-lg-12 col-md-12  col-sm-12">
<h1 class="section-title-inner"><span><i class="fa fa-lock"></i> Authentication</span></h1>
<div class="row userInfo">
<div class="col-xs-12 col-sm-4">
<h2 class="block-title-2"> Create an account </h2>
<form role="form">
<div class="form-group">
<label for="exampleInputName">Name</label>
<input type="text" class="form-control" id="exampleInputName" placeholder="Enter name">
</div>
<div class="form-group">
<label for="InputEmail1">Email address</label>
<input type="email" class="form-control" id="InputEmail1" placeholder="Enter email">
</div>
<div class="form-group">
<label for="InputPassword1">Password</label>
<input type="password" class="form-control" id="InputPassword1" placeholder="Password">
</div>
<button type="submit" class="btn   btn-primary"><i class="fa fa-user"></i> Create an account
</button>
</form>
</div>
<div class="col-xs-12 col-sm-4">
<h2 class="block-title-2"><span>Already registered?</span></h2>
<form role="form" method="post" action="/FinalWK/login">
<div class="form-group">
<label for="InputEmail2">Email address</label>
<input type="email" class="form-control" id="InputEmail2" placeholder="Enter email" required="true" name="email">
</div>
<div class="form-group">
<label for="InputPassword2">Password</label>
<input type="password" class="form-control" id="InputPassword2" placeholder="Password" required="true" name="password">
</div>
<!--
<div class="checkbox">
<label>
<input type="checkbox" name="checkbox">
Remember me </label>
</div>
<div class="form-group">
<p><a title="Recover your forgotten password" href="forgot-password.html">Forgot your
password? </a></p>
</div>
-->
<button type="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i> Sign In</button>
</form>
</div>

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
</body>

<!-- Mirrored from templatecycle.com/tshop/v-1.5/white/checkout-0.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 07 Dec 2015 21:58:44 GMT -->
</html>
