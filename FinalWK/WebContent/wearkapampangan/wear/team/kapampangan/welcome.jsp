<%! String email = null; %>
<%! String password = null; %>
<% email = (request.getParameter("email") != null ? request.getParameter("email") : "");%>
<% password = (request.getParameter("password") != null ? request.getParameter("password") : "");%>
<!DOCUMENT HTML>
<html>
	<head>
		<title>Wear Kapampangan</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" href="assets/bootstrap/bootstrap-3.3.6-dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/bootstrap/bootstrap-3.3.6-dist/css/bootstrap-theme.min.css" />
		<link rel="stylesheet" href="assets/jquery/jquery-ui-1.11.4.custom/jquery-ui.css" />
		<link rel="stylesheet" href="assets/css/style.css" />
		<link rel="stylesheet" href="assets/css/font-import.css" />
		<link rel="stylesheet" href="assets/js/bootstrap.min.js" />
		<link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		
		<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
		<link id="pagestyle" rel="stylesheet" type="text/css" href="assets/css/skin-1.css">
		<link href="assets/css/style.css" rel="stylesheet">
		<script src="assets/js/pace.min.js"></script>
		<script src="assets/js/pace.min.js"></script>
		
		<style>
			body{
			  margin-top: 50px;
			  background-image:url('welcome-banner.jpg') ;
			  background-repeat: no-repeat;
			  background-size: cover;
			}
			.panel-transparent {
				background: none;
			}

			.panel-transparent{
				background: rgba(49, 79, 79, .5)!important;
			}

			.panel-transparent .panel-body{
				background: rgba(46, 51, 56, 0.2)!important;
			}
			.navbar-form {
			   padding-left: 0;
			}

			.navbar-collapse{
			   padding-left:0; 
			}
			navbar-nav > li > a, .navbar-brand {
				padding-top:4px !important; 
				padding-bottom:0 !important;
				height: 28px;
			}
			.navbar {min-height:28px !important;}
		
		</style>
	
	</head>
<body>
	<!-- First Navbar -->
<div class="navbar navbar-tshop navbar-fixed-top megamenu" role="navigation" style="background-color:#000000;">
	<div class="navbar-top" style="background-color:#4BB777;">
		<div class="container">
			<div class="row">
				<!-- LEFT SIDE -->
				<div class="col-lg-6 col-sm-6 col-xs-6 col-md-6">
					<div class="pull-left ">
						<ul class="userMenu ">						
							<!-- PHONE NUMBER -->
							<li style="color:#4BB777;">
								
							</li>
						</ul>
					</div>
				</div>
				
			
			
			</div>
	</div>
</div>
 
<!-- Second Navbar -->
<div class="container">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<span class="sr-only"> Toggle navigation </span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		
			
	</div>
	
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
			<li>
				<img src="images/logo.png" alt="WEAR KAPAMPANGAN" style="margin-top:10px; height:50px; width:100%;"> 
			</li>		
			</ul>
		</div>
	</div>
</div>
</br>
</br>
</br>
</br>
</br>
</br>
	<div class="container" style="margin-top:40px;">
			<div class="panel panel-transparent">
				  
				  <div class="panel-body">
					<h1 style="color:#ffffff;"><b>WELCOME TO WEAR-KAPAMPANGAN</b></h1>
					<h2 style="color:#ffffff;">Thank you for registering.</h2>
					</br>
					<form action="/FinalWK/login?email=<%= email %>&password=<%= password %>" method="post">
						<input type="submit" class="btn btn-success btn-lg" role="button" value="Get Started" >
					</form>
				  </div>
			</div>								
	</div>
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<jsp:include page="footer.jsp" />


</body>
</html>