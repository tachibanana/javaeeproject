<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="">
	<title>Wear Kapampangan</title>
	<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link id="pagestyle" rel="stylesheet" type="text/css" href="assets/css/skin-1.css">
    <link href="assets/css/style.css" rel="stylesheet">
	<script>
		paceOptions = {
			elements: true
		};
	</script>
	<script src="assets/js/pace.min.js"></script>
	<script src="assets/js/pace.min.js"></script>
	<script type="text/javascript">
		function swapStyleSheet(sheet){
		document.getElementById('pagestyle').setAttribute('href', sheet);
		}
	</script>
	<style>.themeControll{background:#2d3e50;height:auto;width:100px;position:fixed;left:0;padding:20px;top:20%;z-index:999999;-webkit-transform:translateX(0);-moz-transform:translateX(0);-o-transform:translateX(0);-ms-transform:translateX(0);transform:translateX(0);opacity:1;-ms-filter:none;filter:none;-webkit-transition:opacity .5s linear,-webkit-transform .7s cubic-bezier(.56,.48,0,.99);-moz-transition:opacity .5s linear,-moz-transform .7s cubic-bezier(.56,.48,0,.99);-o-transition:opacity .5s linear,-o-transform .7s cubic-bezier(.56,.48,0,.99);-ms-transition:opacity .5s linear,-ms-transform .7s cubic-bezier(.56,.48,0,.99);transition:opacity .5s linear,transform .7s cubic-bezier(.56,.48,0,.99);}.themeControll.active{display:block;-webkit-transform:translateX(-100px);-moz-transform:translateX(-100px);-o-transform:translateX(-100px);-ms-transform:translateX(-1020px);transform:translateX(-100px);-webkit-transition:opacity .5s linear,-webkit-transform .7s cubic-bezier(.56,.48,0,.99);-moz-transition:opacity .5s linear,-moz-transform .7s cubic-bezier(.56,.48,0,.99);-o-transition:opacity .5s linear,-o-transform .7s cubic-bezier(.56,.48,0,.99);-ms-transition:opacity .5s linear,-ms-transform .7s cubic-bezier(.56,.48,0,.99);transition:opacity .5s linear,transform .7s cubic-bezier(.56,.48,0,.99);}.themeControll a{border-radius:3px;clear:both;display:block;height:25px;margin-bottom:4px;width:50px;}.tbtn{background:#2D3E50;color:#FFFFFF!important;font-size:30px;height:auto;padding:10px;position:absolute;right:-40px;top:0;width:40px;cursor:pointer;}@media (max-width: 780px) {.themeControll{display:none;}}
	</style>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container main-container headerOffset">
<div class="row">
<div class="breadcrumbDiv col-lg-12">
<ul class="breadcrumb">
<li> <a href="index.html">Home</a> </li>
<li class="active"> Authentication </li>
</ul>
</div>
</div>
<div class="row">
<div class="col-lg-9 col-md-9 col-sm-7">
<h1 class="section-title-inner"><span><i class="fa fa-lock"></i> Authentication</span></h1>
<div class="row userInfo">
<div class="col-xs-12 col-sm-6">
<h2 class="block-title-2"> Create an account </h2>
<form role="form" class="regForm">
<div class="form-group">
<label>Name</label>
<input title="Please enter your username (at least 3 characters)" type="text" class="form-control" placeholder="Enter name" required minlength="3">
</div>
<div class="form-group">
<label>Email address</label>
<input title="Please enter valid email" type="email" class="form-control" placeholder="Enter email" required>
</div>
<div class="form-group">
<label>Password</label>
<input required minlength="5" title="Please enter your password, between 5 and 12 characters" type="password" class="form-control" placeholder="Password">
</div>
<div class="error">
</div>
<button type="submit" class="btn   btn-primary"><i class="fa fa-user"></i> Create an account</button>
</form>
</div>
<div class="col-xs-12 col-sm-6">
<h2 class="block-title-2"><span>Already registered?</span></h2>
<form role="form" class="logForm">
<div class="form-group">
<label>Email address</label>
<input type="email" class="form-control" placeholder="Enter email">
</div>
<div class="form-group">
<label>Password</label>
<input type="password" class="form-control" placeholder="Password">
</div>
<div class="checkbox">
<label>
<input type="checkbox" name="checkbox">
Remember me </label>
</div>
<div class="form-group">
<p><a title="Recover your forgotten password" href="forgot-password.html">Forgot your password? </a></p>
</div>
<a class="btn btn-primary" href="account.jsp"><i class="fa fa-sign-in"></i> Sign In</a>
</form>
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
<script src="assets/js/jquery.validate.js"></script>
<script>
    $().ready(function() {
        // validate the comment form when it is submitted
        $("#regForm").validate();
        // validate signup form on keyup and submit
       $(".regForm").validate({
			errorLabelContainer: $(".regForm div.error")
		});
    });
    </script>
 
<script src="assets/js/script.js"></script>
<script type="text/javascript">
/* <![CDATA[ */
(function(){try{var s,a,i,j,r,c,l=document.getElementsByTagName("a"),t=document.createElement("textarea");for(i=0;l.length-i;i++){try{a=l[i].getAttribute("href");if(a&&a.indexOf("/cdn-cgi/l/email-protection") > -1  && (a.length > 28)){s='';j=27+ 1 + a.indexOf("/cdn-cgi/l/email-protection");if (a.length > j) {r=parseInt(a.substr(j,2),16);for(j+=2;a.length>j&&a.substr(j,1)!='X';j+=2){c=parseInt(a.substr(j,2),16)^r;s+=String.fromCharCode(c);}j+=1;s+=a.substr(j,a.length-j);}t.innerHTML=s.replace(/</g,"&lt;").replace(/>/g,"&gt;");l[i].setAttribute("href","mailto:"+t.value);}}catch(e){}}}catch(e){}})();
/* ]]> */
</script>
</body>
</html>