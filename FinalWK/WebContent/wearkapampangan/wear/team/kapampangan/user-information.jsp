<%@ page import="com.wear.kapampangan.project.library.User" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%! User currentUser = null; %>
<%! DBManager manager = null; %>
<% if(session.getAttribute("currentuser") != null) currentUser = (User) session.getAttribute("currentuser");%>
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
<li class="active"> My information </li>
</ul>
</div>
</div>
<div class="row">
<div class="col-lg-9 col-md-9 col-sm-7">
<h1 class="section-title-inner"><span><i class="glyphicon glyphicon-user"></i> My personal information </span></h1>
<div class="row userInfo">
<div class="col-lg-12">
<h2 class="block-title-2"> Please be sure to update your personal information if it has changed. </h2>
<p class="required"><sup>*</sup> Required field</p>
</div>
<div>
<div class="col-xs-12 col-sm-6">
<div class="form-group required">
<label for="InputName">First Name <sup>*</sup> </label>
<input required type="text" class="form-control" id="InputName" name = "firstName" placeholder="First Name" value="<%= currentUser.getFirstName() %>">
</div>
<div class="form-group required">
<label for="InputLastName">Last Name <sup>*</sup> </label>
<input required type="text" class="form-control" id="InputLastName" name="lastName" placeholder="Last Name" value="<%= currentUser.getLastName() %>">
</div>
<div class="form-group">
<label for="InputEmail"> Email </label>
<input type="email" class="form-control" id="InputEmail" name="email" placeholder="Email"  value="<%= currentUser.getEmail() %>" readonly>
</div>
</div>
<div class="col-xs-12 col-sm-6">
<div class="form-group required">
<label for="InputPasswordCurrent"> Password <sup> * </sup> </label>
<input type="password"  class="form-control" name="password" id="InputPasswordCurrent" value="<%= currentUser.getPassword() %>" readonly>
</div>
<div class="form-group required">
<label for="InputPasswordnew"> New Password </label>
<input type="password" name="InputPasswordnew" class="form-control" id="InputPasswordnew">
</div>
<div class="form-group required">
<label for="InputPasswordnewConfirm"> Confirm Password </label>
<input type="password" name="InputPasswordnewConfirm" class="form-control" id="InputPasswordnewConfirm">
</div>
</div>
<div class="col-lg-12">
<div class="form-group ">
</div>
</div>
<div class="col-lg-12">
<button id="save_me" type="submit" class="btn btn-primary"><i class="fa fa-save"></i> &nbsp; Save </button>
</div>
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
 
<script src="assets/js/jquery.minimalect.min.js"> </script>
 
<script src="assets/js/bootstrap.touchspin.js"></script>
 
<script src="assets/js/script.js"></script>
<script>
	$("#save_me").click(function(){
		var newPass = $("#InputPasswordnew").val();
		var confirmPass = $("#InputPasswordnewConfirm").val();
		var pass = $("#InputPasswordCurrent").val();
		var fname = $("#InputName").val();
		var lname = $("#InputLastName").val();
		var email = $("#InputEmail").val();
		
		if(newPass && confirmPass && newPass == confirmPass){
			window.location.href = "/FinalWK/user/info?password=" + newPass +"&firstName="+ fname +"&lastName=" + lname + "&email=" + email;
		}else if(!(newPass && confirmPass)){
			window.location.href = "/FinalWK/user/info?password=" + pass +"&firstName="+ fname +"&lastName=" + lname + "&email=" + email;
		}else{
			alert("Password not match.");
		}
	});
</script>
</body>
</html>
