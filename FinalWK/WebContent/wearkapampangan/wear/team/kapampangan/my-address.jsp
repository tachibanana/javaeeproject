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
		<li><a href="my-address.jsp">My Address</a></li>
		</ul>
		</div>
		</div>
 
 
<div class="row">
<div class="col-lg-9 col-md-9 col-sm-12">
<div class="row userInfo">
<div class="col-xs-12 col-sm-12">

<div class="w100 clearfix">
<div class="row userInfo">
<div class="col-lg-12">
<h2 class="block-title-2">My Address</h2>
</div>
<form action = "/FinalWK/user/info/3/update" method="get">
<div class="col-xs-12 col-sm-6">
<div class="form-group required">

<div class="form-group required">
<label for="InputAddress">Address <sup>*</sup> </label>
<input name="address1" required type="text" class="form-control" id="address1" placeholder="Address" value=''>
</div>
<div class="form-group">
<label for="InputAddress2">Address (Line 2) </label>
<input name="address2" type="text" class="form-control" id="address2" placeholder="Address" value=''>
</div>
<div class="form-group required">
<label for="InputCity">City <sup>*</sup> </label>
<input name="city" required type="text" class="form-control" id="city" placeholder="City" value=''>
</div>
</div>
</div>
<div class="col-xs-12 col-sm-6">
<div class="form-group required">
<label for="InputZip">Zip / Postal Code <sup>*</sup> </label>
<input name="zip" required type="text" class="form-control" id="zip" placeholder="Zip / Postal Code" value=''>
</div>

<div class="form-group">
<label for="InputAdditionalInformation">Additional information</label>
<textarea rows="3" cols="26" name="additionalInfo" class="form-control" id="additionalInfo"></textarea>
</div>
<div class="form-group required">
<label for="InputMobile">Mobile phone <sup>*</sup></label>
<input required type="tel" name="mobileNo" class="form-control" id="mobileNo" value=''>
</div>

<input type="submit" class="btn btn-success" value="Save">
</div>
</form>
</div>
 
</div>
 
</div>
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

</body>
</html>
