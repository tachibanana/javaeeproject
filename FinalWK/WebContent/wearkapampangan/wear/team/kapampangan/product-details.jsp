<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.library.Size" %>
<%@ page import="com.wear.kapampangan.project.library.Color" %>

<%! DBManager manager = null; %>
<%! Item item = null; %>
<%! int counter = 0;%>
<%! String productCode = null; %>

<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>
<% productCode = (request.getParameter("productCode") != null ? request.getParameter("productCode") : "");%>
<% item = manager.getItemByProductCode(productCode); %>

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
		
		</head>

 <body>
 
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
			<div class="col-lg-6 col-md-6 col-sm-6 productImageZoom">
				<div class='zoom' id='zoomContent'>
					<a class="gall-item" title="product-title" href="<%= item.getImage()%>">
						<img class="zoomImage1 img-responsive"
						data-src="<%= item.getImage()%>" 
						src='<%= item.getImage()%>' 
						alt='Daisy on the Ohoopee'/>
					</a>
				</div>
				
				<!--
				<div class="zoomThumb ">
					<a class="zoomThumbLink">
						<img data-large="images/product/12.jpg" 
						src="images/product/12.jpg"
						alt="Saleen"
						title=""/>
					</a>
					<a class="zoomThumbLink">
						<img data-large="images/product/14.jpg"
						src="images/product/14.jpg"
						alt="Saleen"
						title=""/></a>
					<a class="zoomThumbLink">
						<img data-large="images/product/22.jpg"
						src="images/product/22.jpg"
						alt="Saleen"
						title=""/>
					</a>
				</div>
				-->
			</div>
 
			<div class="col-lg-6 col-md-6 col-sm-5">
				<h1 class="product-title"><%= item.getName() %></h1>
				<h3 class="product-code">Product Code : <%= item.getProductCode()%></h3>
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
				<span class="price-sales">PHP <%= ((int) item.getPrice())%></span>
				<!-- <span class="price-standard">PHP 95</span> -->
			</div>
			
			<div class="details-description">
				<p><%= item.getDescription() %></p>
			</div>
			
			<!-- COLOR HERE -->
			<div class="color-details">
				<span class="selected-color"><strong>COLOR</strong></span>
				<ul class="swatches Color">
					<% for(Color color : item.getListOfColor()){%>
						<% if(counter == 0){ %>
							<li class="selected"><a id="color" style="background-color:<%= color.getColor()%>"> </a></li>
						<%}else{%>
					<li><a id="color" style="background-color:<%= color.getColor()%>"> </a></li>
					<%}counter ++;} counter = 0; %>
				</ul>
			</div>
 			
 			<!-- Quantity Here -->
			 <div class="productFilter productFilterLook2">
				<div class="row">
					<div class="col-lg-6 col-sm-6 col-xs-6">
						<div class="filterBox">
							<select class="form-control">
								<option value="strawberries" selected>Quantity</option>
								<option value="mango">1</option>
								<option value="bananas">2</option>
								<option value="watermelon">3</option>
								<option value="grapes">4</option>
								<option value="oranges">5</option>
								<option value="pineapple">6</option>
								<option value="peaches">7</option>
								<option value="cherries">8</option>
							</select>
						</div>
					</div>
		
					
				<!-- SIZE HERE -->
				<div class="col-lg-6 col-sm-6 col-xs-6">
					<div class="filterBox">
						<select class="form-control">
							<option value="strawberries" selected>Size</option>
							<% for(Size size : item.getListOfSize()){%>
								<option value="<%= size.getSize()%>"><%= size.getSize()%></option>
							<% }%>
						</select>
					</div>
				</div>
			</div>
		</div>
		
		<!-- CART ACTION -->
 		<div class="cart-actions">
			<div class="addto row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<button onclick="productAddToCartForm.submit(this);"
								class="button btn-block btn-cart cart first"
								title="Add to Cart" type="button"
								id="addToCart">
								Add to Cart
						</button>
				</div>
				
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<a class="link-wishlist wishlist btn-block ">Add to Wishlist</a>
				</div>
			</div>
			<div style="clear:both"></div>
				<h3 class="incaps"><i class="fa fa fa-check-circle-o color-in"></i> In stock</h3>
				<h3 style="display:none" class="incaps">
					<i class="fa fa-minus-circle color-out">
					</i> Out of stock
				</h3>
				
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
 	
 	<!-- RECOMMENDATION -->
	<jsp:include page="also-like.jsp" />
	
	</div>
 	
 	<!--  FOOTER HERE -->
	<jsp:include page="footer.jsp"></jsp:include>
	
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
	</body>
</html>
