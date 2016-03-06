<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.library.Size" %>
<%@ page import="com.wear.kapampangan.project.library.Color" %>
<%@ page import="com.wear.kapampangan.project.library.InventoryProduct" %>

<%! DBManager manager = null; %>
<%! InventoryProduct product = null; %>
<%! int counter = 0;%>
<%! String productCode = null; %>
<%! String colorParam = null; %>
<%! String sizeParam = null; %>
<%! String quantityParam = null; %>
<%! String link = null; %>


<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>
<% productCode = (request.getParameter("productCode") != null ? request.getParameter("productCode") : "");%>
<% colorParam = (request.getParameter("color") != null ? request.getParameter("color") : "");%>
<% sizeParam = (request.getParameter("size") != null ? request.getParameter("size") : "");%>
<% quantityParam = (request.getParameter("quantity") != null ? request.getParameter("quantity") : "");%>
<% product = manager.getProductByProductCode(productCode); %>
<% link = request.getParameter("link"); %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Wear Kapampangan</title>
		<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
	 	<link id="pagestyle" rel="stylesheet" type="text/css" href="assets/css/skin-1.css">
	 	<link href="assets/css/style.css" rel="stylesheet">
	 	<link href="assets/plugins/magnific/magnific-popup.css" rel="stylesheet">
	 	<script src='assets/js/pass-data.js'></script>
		<script src="assets/js/product-details.js"></script>
		<script src="assets/js/pace.min.js"></script>
		
		<link href="assets/css/home-v7.css" rel="stylesheet">
		<link href="assets/css/product-details-5.css" rel="stylesheet">
		
		<meta charset="utf-8">
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    	<link rel="stylesheet" href="TemplateData/style.css">
    	<link rel="shortcut icon" href="TemplateData/favicon.ico" />
    	 <script src="TemplateData/UnityProgress.js"></script>
	</head>

 <body class="template">
 
 	<!-- Header Here -->
 	<jsp:include page="header.jsp"></jsp:include>
 	
 	<!-- Main Content -->
	<div class="container main-container headerOffset">
		<div class="row">
			<div class="breadcrumbDiv col-lg-12">
				<ul class="breadcrumb">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="product-details.jsp">Product Detail</a></li>
				</ul>
			</div>
		</div>
		
		<div class="row transitionfx">
			<div class="col-lg-6 col-md-6 col-sm-6 productImageZoom" style="height:400px;">
				<iframe id="frame-me" src="<%= link %>" width="100%" height="100%" scrolling="no">
				<p>iframe does not support your browser</p>
				</iframe>
			</div>
 
			<div class="col-lg-6 col-md-6 col-sm-5">
				<h1 class="product-title"><%= product.getItem().getName() %></h1>
				<h3 class="product-code" id="productCode" name="<%= product.getItem().getProductCode()%>">Product Code : <%= product.getItem().getProductCode()%></h3>
				<!--
				<div class="rating">
					<p>
						<span><i class="fa fa-star"></i></span>
						<span><i class="fa fa-star"></i></span>
						<span><i class="fa fa-star"></i></span>
						<span><i class="fa fa-star"></i></span>
						<span><i class="fa fa-star-o "></i></span>
						<span class="ratingInfo"> <span> / </span>
						<a data-toggle="modal" data-target="#modal-review"> Write a review</a> </span>
					</p>
				</div>
				-->
				
			<div class="product-price">
				<span class="price-sales">PHP <%= ((int) product.getItem().getPrice())%></span>
				<!-- <span class="price-standard">PHP 95</span> -->
			</div>
			
			<div class="details-description">
				<p><%= product.getItem().getDescription() %></p>
			</div>
			
			<!-- COLOR HERE -->
			<div class="color-details">
				<span class="selected-color"><strong>COLOR</strong></span>
				<ul class="swatches Color">
					<% boolean flag = true ; for(Color color : product.getAvailableColor()){%>
					<!-- if counter == 0 -->
						<% if(!colorParam.equals("")){%>
							<% if(color.getColor().equalsIgnoreCase(colorParam)){ flag=false;%>
								<li class="selected"><a id="color" style="background-color:<%= color.getColor()%>" name="<%= color.getColor()%>"> </a></li>
						<%}} if(counter == 0 && colorParam.equals("")){%>
							<li class="selected"><a id="color" style="background-color:<%= color.getColor()%>" name="<%= color.getColor()%>"> </a></li>
						<%}else if(flag){%>
					<li><a id="color" style="background-color:<%= color.getColor()%>" name="<%= color.getColor()%>"> </a></li>
					<%}counter ++; flag=true;} counter = 0; %>
				</ul>
			</div>
 			
 			<!-- Quantity Here -->
			 <div class="productFilter productFilterLook2">
				<div class="row">
					<div class="col-lg-6 col-sm-6 col-xs-6">
						<div class="filterBox" id="quantitylist">
							<select class="form-control">
							<%if(quantityParam.equals("")){ %>
								<option value="Quantity" selected>Quantity</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<%}else{ boolean quantityFlag = false;%>
								
									<option value="Quanitity">Quantity</option>
									<% for(int ctr = 1 ; ctr <= 8 ; ctr++){
										if(String.valueOf(ctr).equals(quantityParam)){%>
											<option value="<%=ctr%>" selected><%=ctr%></option>
											
										<%quantityFlag = true; }else{ %>
											<option value="<%=ctr%>"><%=ctr%></option>
									<% }} if(!quantityFlag){%>
										<option value="1" selected>1</option>
								<%}}%>
							</select>
						</div>
					</div>
		
					
				<!-- SIZE HERE -->
				<div class="col-lg-6 col-sm-6 col-xs-6">
					<div class="filterBox" id="sizelist">
						<select class="form-control">
						<%if(sizeParam.equals("")){%>
							<option value="Size" selected>Size</option>
							<% int counterSize = 0; %>
							<% for(Size size : product.getAvailableSize()){
								if(counterSize == 0){%>
									<option value="<%= size.getSize()%>" id="firstAvailableSize"><%= size.getSize()%></option>
								<%}else{ counterSize++;%>
									<option value="<%= size.getSize()%>"><%= size.getSize()%></option>
							<% }}}else{ %>
								<option value="Size" >Size</option>
								<% for(Size size : product.getAvailableSize()){
									if(size.getSize().equalsIgnoreCase(sizeParam)){%>
									<option value="<%= size.getSize()%>" selected><%= size.getSize()%></option>
								<%}else{%>
									<option value="<%= size.getSize()%>"><%= size.getSize()%></option>
								<%}%>
									
							<%}}%>
						</select>
					</div>
				</div>
			</div>
		</div>
		
		<!-- CART ACTION -->
 		<div class="cart-actions">
			<div class="addto row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<!-- productAddToCartForm.submit(this); -->
						<button onclick=""
								class="button btn-block btn-cart cart first"
								title="Add to Cart" type="button"
								id="addToCart">
								Add to Cart
						</button>
				</div>
				
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<button class="link-wishlist wishlist btn-block " id="addToWishlist">Add to Wishlist</button>
				</div>
			</div>
			<div style="clear:both"></div>
			<% if(manager.getInventoryDetailByProductCode(product.getItem().getProductCode()).getStatus() == 1){%>
				<h3 class="incaps"><i class="fa fa fa-check-circle-o color-in"></i> In stock</h3>
				<%}else{ %><h3 class="incaps">
					<i class="fa fa-minus-circle color-out">
					</i> Out of stock
				</h3>
				<%} %>
				
				<h3 class="incaps">
					<i class="glyphicon glyphicon-lock">
					</i> Secure online ordering
				</h3>
		</div>
 
		<div class="clear"></div>
			<div class="product-tab w100 clearfix">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#details" data-toggle="tab">Details</a></li>
					<!--  <li><a href="#size" data-toggle="tab">Size</a></li>
					<li><a href="#shipping" data-toggle="tab">Shipping</a></li>
					-->
				</ul>
				
				
				<div class="tab-content">
						<div class="tab-pane active" id="details">
							Description Description dito<br>
						</div>
						
						<div class="tab-pane" id="size">
							 16" waist<br>
							34" inseam<br>
							10.5" front rise<br>
							8.5" knee<br>
							7.5" leg opening<br><br>
							Measurements taken from size 30<br>
							Model wears size 31. Model is 6'2 <br><br>
						</div>
						
						<div class="tab-pane" id="shipping">
							<table>
								<colgroup>
									<col style="width:33%">
									<col style="width:33%">
									<col style="width:33%">
								</colgroup>
								
								<tbody>
									<tr>
										<td>Standard</td>
										<td>1-5 business days</td>
										<td>$7.95</td>
									</tr>
									
									<tr>
										<td>Two Day</td>
										<td>2 business days</td>
										<td>$15</td>
									</tr>
									
									<tr>
										<td>Next Day</td>
										<td>1 business day</td>
										<td>$30</td>
									</tr>
								</tbody>
								
								<tfoot>
									<tr>
										<td colspan="3">* Free on orders of $50 or more</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
 				</div>
 
				<div style="clear:both"></div>	
			</div>
 
		</div>
 	<div style="clear:both"></div>
 	<br />
 	<br />
 	<hr />
 	
 	<!-- REVIEWS -->
 	<jsp:include page="product-review.jsp" />
 	
 	<!-- RECOMMENDATION -->
	<jsp:include page="also-like.jsp" />
	
	</div>
 	
 	<!--  FOOTER HERE -->
	<jsp:include page="footer.jsp"></jsp:include>
	
	<div class="modal  fade" id="modal-review" tabindex="-1" role="dialog">
					<div class="modal-dialog">
					<div class="modal-content">
					<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
					<h3 class="modal-title-site text-center">PRODUCT REVIEW </h3>
					</div>
					<div class="modal-body">
					<h3 class="reviewtitle uppercase">You're reviewing: Lorem ipsum dolor sit amet</h3>
					<form>
					<div class="form-group">
					<label>
					How do you rate this product? </label> <br>
					<div class="rating-here">
					<input type="hidden" class="rating-tooltip-manual" data-filled="fa fa-star fa-2x" data-empty="fa fa-star-o fa-2x" data-fractions="3"/>
					</div>
					</div>
					
					<div class="form-group">
					<label for="rtext">Name</label>
					<input type="text" class="form-control" id="rtext" placeholder="Your name" required>
					</div>
					
					<div class="form-group">
					<label for="rtext">Subject</label>
					<input type="text" class="form-control" id="rtext" placeholder="Subject" required>
					</div>
					
					
					<div class="form-group ">
					<label>Review</label>
					<textarea class="form-control" rows="3" placeholder="Your Review" required></textarea>
					</div>
					
					
					<button type="submit" class="btn btn-success">Submit Review</button>
					</form>
					</div>
					</div>
					 
					</div>
					 
					</div>
	<div class="gap"></div>
		<script src="../../../../ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
		<script src="assets/bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.cycle2.min.js"></script>
		<script src="assets/js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="assets/js/jquery.parallax-1.1.js"></script>
		<script type="text/javascript" src="assets/js/helper-plugins/jquery.mousewheel.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.mCustomScrollbar.js"></script>
		<script type="text/javascript" src="assets/plugins/icheck-1.x/icheck.min.js"></script>
		<script src="assets/js/grids.js"></script>
		<script src="assets/js/owl.carousel.min.js"></script>
		<script src='assets/js/jquery.zoom.js'></script>
		<script>
		    $(document).ready(function () {
		
		        $('#zoomContent').zoom();
		        $(".zoomThumb a").click(function () {
		            var largeImage = $(this).find("img").attr('data-large');
		            $(".zoomImage1").attr('src', largeImage);
		            $(".zoomImg").attr('src', largeImage);
		            $(".gall-item").attr('href', largeImage);
		
		        });
		
		        $('.productImageZoomx').magnificPopup({
		            delegate: 'img', type: 'image', gallery: {enabled: true},
		
		            callbacks: {
		                elementParse: function () {
		                    this.item.src = this.item.el.attr('src');
		                }
		            }
		
		        });
		
		
		        $('.gall-item').magnificPopup({
		            type: 'image',
		            gallery: {
		                enabled: true
		            }
		        });
		
		        $("#zoomContent").click(function () {
		            //alert();
		            $('.gall-item').trigger('click');
		        });
		
		        // CHANGE IMAGE MODAL THUMB
		
		        $(".product-thumbList a").click(function () {
		            var largeImage = $(this).find("img").attr('data-large');
		            $(".mainImg").attr('src', largeImage);
		
		        });
		
		    });
		</script>
		<script src="assets/plugins/magnific/jquery.magnific-popup.min.js"></script>
		<script src="../../../../cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script>
		<script src="assets/js/bootstrap.touchspin.js"></script>
		<script src="assets/js/script.js"></script>
		<script src="assets/plugins/rating/bootstrap-rating.min.js"></script>
		<script>
		    $(function () {
		
		        $('.rating-tooltip-manual').rating({
		            extendSymbol: function () {
		                var title;
		                $(this).tooltip({
		                    container: 'body',
		                    placement: 'bottom',
		                    trigger: 'manual',
		                    title: function () {
		                        return title;
		                    }
		                });
		                $(this).on('rating.rateenter', function (e, rate) {
		                    title = rate;
		                    $(this).tooltip('show');
		                })
		                        .on('rating.rateleave', function () {
		                            $(this).tooltip('hide');
		                        });
		            }
		        });
		
		    });
		</script>
		<script type='text/javascript'>
  // connect to canvas
  var Module = {
    TOTAL_MEMORY: 268435456,
    filePackagePrefixURL: "Release/",
    memoryInitializerPrefixURL: "Release/",
    preRun: [],
    postRun: [],
    print: (function() {
      return function(text) {
        console.log (text);
      };
    })(),
    printErr: function(text) {
      console.error (text);
    },
    canvas: document.getElementById('canvas'),
    progress: null,
    setStatus: function(text) {
      if (this.progress == null) 
      {
        if (typeof UnityProgress != 'function')
          return;
        this.progress = new UnityProgress (canvas);
      }
      if (!Module.setStatus.last) Module.setStatus.last = { time: Date.now(), text: '' };
      if (text === Module.setStatus.text) return;
      this.progress.SetMessage (text);
      var m = text.match(/([^(]+)\((\d+(\.\d+)?)\/(\d+)\)/);
      if (m)
        this.progress.SetProgress (parseInt(m[2])/parseInt(m[4]));
      if (text === "") 
        this.progress.Clear()
    },
    totalDependencies: 0,
    monitorRunDependencies: function(left) {
      this.totalDependencies = Math.max(this.totalDependencies, left);
      Module.setStatus(left ? 'Preparing... (' + (this.totalDependencies-left) + '/' + this.totalDependencies + ')' : 'All downloads complete.');
    }
  };
  Module.setStatus('Downloading (0.0/1)');
</script>
<script src="Release/UnityConfig.js"></script>
<script src="Release/fileloader.js"></script>
<script>if (!(!Math.fround)) {
  var script = document.createElement('script');
  script.src = "Release/Raffy.js";
  document.body.appendChild(script);
} else {
  var codeXHR = new XMLHttpRequest();
  codeXHR.open('GET', 'Release/Raffy.js', true);
  codeXHR.onload = function() {
    var code = codeXHR.responseText;
    if (!Math.fround) { 
console.log('optimizing out Math.fround calls');
code = code.replace(/Math_fround\(/g, '(').replace("'use asm'", "'almost asm'")
 }

    var blob = new Blob([code], { type: 'text/javascript' });
    codeXHR = null;
    var src = URL.createObjectURL(blob);
    var script = document.createElement('script');
    script.src = URL.createObjectURL(blob);
    script.onload = function() {
      URL.revokeObjectURL(script.src);
    };
    document.body.appendChild(script);
  };
  codeXHR.send(null);
}
</script>
	</body>
</html>
