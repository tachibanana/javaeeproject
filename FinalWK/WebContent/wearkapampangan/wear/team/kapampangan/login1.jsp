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
				<div class="col-lg-9 col-md-9 col-sm-7">
						<h1 class="section-title-inner"><span><i class="fa fa-lock"></i> Login</span></h1>
							<div class="row userInfo">
								<div class="col-xs-12 col-sm-6">
									<form role="form" class="logForm" method="post" action="/FinalWK/login">
										<div class="form-group">
											<label>Email address</label>
											<input type="email" class="form-control" placeholder="Enter your email" required="true" name="email">
										</div>
										<div class="form-group">
											<label>Password</label>
											<input type="password" class="form-control" placeholder="Enter your password" required="true" name="password">
										</div>
										<!--
										<div class="checkbox">
												<label>
													<input type="checkbox" name="checkbox">Remember me
												</label>
										</div>
										<div class="form-group">
											<p><a title="Recover your forgotten password" href="forgot-password.html">Forgot your password? </a></p>
										</div>
										
										-->
										<input type="submit" class="btn btn-primary" value="sign in">
									</form>
</div>
</div>
 
</div>
<div class="col-lg-3 col-md-3 col-sm-5"></div>
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
		<script src="assets/js/jquery.validate.js"></script><script src="assets/js/script.js"></script>
	</body>
</html>
