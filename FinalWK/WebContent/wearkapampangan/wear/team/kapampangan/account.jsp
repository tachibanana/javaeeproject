<% if(session.getAttribute("currentuser") == null) response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/login1.jsp");%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Wear Kapampangan</title>
 		<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
		<link id="pagestyle" rel="stylesheet" type="text/css" href="assets/css/skin-1.css"> 
		<link href="assets/css/style.css" rel="stylesheet">
		<link href="assets/css/ion.checkRadio.css" rel="stylesheet">
		<link href="assets/css/ion.checkRadio.cloudy.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="assets/css/jquery.minimalect.min.css" media="screen"/>
		<script src="assets/js/pace.min.js"></script>
		<script src="assets/js/pace.min.js"></script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div class="container main-container headerOffset">
			<div class="row">
				<div class="breadcrumbDiv col-lg-12">
					<ul class="breadcrumb">
						<li> <a href="index.jsp">Home</a> </li>
						<li class="active"> My account </li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-9 col-md-9 col-sm-7">
<h1 class="section-title-inner"><span><i class="fa fa-unlock-alt"></i> My account </span></h1>
<div class="row userInfo">
<div class="col-xs-12 col-sm-12">
<p> Your account has been created. </p>
<h2 class="block-title-2"><span>Welcome to your account. Here you can manage all of your personal information and orders.</span></h2>
<ul class="myAccountList row">
<li class="col-lg-2 col-md-2 col-sm-3 col-xs-4  text-center ">
<div class="thumbnail equalheight"> <a title="Orders" href="order-list.jsp"><i class="fa fa-calendar"></i> Order history </a> </div>
</li>
<li class="col-lg-2 col-md-2 col-sm-3 col-xs-4  text-center ">
<div class="thumbnail equalheight"> <a title="My addresses" href="my-address.jsp"><i class="fa fa-map-marker"></i> My addresses</a> </div>
</li>
<li class="col-lg-2 col-md-2 col-sm-3 col-xs-4  text-center ">
<div class="thumbnail equalheight"> <a title="Add  address" href="/FinalWK/wearkapampangan/wear/team/kapampangan/user-custom-page.jsp"> <i class="fa fa-pencil-square-o"> </i>Customizing</a> </div>
</li>
<li class="col-lg-2 col-md-2 col-sm-3 col-xs-4  text-center ">
<div class="thumbnail equalheight"> <a title="Personal information" href="user-information.jsp"><i class="fa fa-cog"></i> Personal information</a> </div>
</li>
<li class="col-lg-2 col-md-2 col-sm-3 col-xs-4  text-center ">
<div class="thumbnail equalheight"> <a title="My wishlists" href="wishlist.jsp"><i class="fa fa-heart"></i> My wishlists </a> </div>
</li>
</ul>
<div class="clear clearfix"> </div>
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
		<script src="assets/js/jquery.minimalect.min.js"> </script>
		<script src="assets/js/bootstrap.touchspin.js"></script>
	 	<script src="assets/js/script.js"></script>

	</body>

</html>