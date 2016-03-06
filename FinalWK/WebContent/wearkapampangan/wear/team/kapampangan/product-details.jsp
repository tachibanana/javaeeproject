<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Item" %>
<%@ page import="com.wear.kapampangan.project.library.User" %>
<%@ page import="com.wear.kapampangan.project.library.Size" %>
<%@ page import="com.wear.kapampangan.project.library.Color" %>
<%@ page import="com.wear.kapampangan.project.library.Review" %>
<%@ page import="com.wear.kapampangan.project.library.InventoryProduct" %>
<%@ page import="com.wear.kapampangan.project.util.RoundUtil" %>
<%@ page import="com.wear.kapampangan.project.util.DateUtil" %>

<%! DBManager manager = null; %>
<%! InventoryProduct product = null; %>
<%! int counter = 0;%>
<%! String productCode = null; %>
<%! String colorParam = null; %>
<%! String sizeParam = null; %>
<%! String quantityParam = null; %>
<%! int totalReview = 0; %>
<%! User currentUser =  null;%>
<%! boolean theFlag = true; %>
<%! Review userCurrentReview = null; %>
<% 	currentUser = (User) request.getSession().getAttribute("currentuser");%>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>
<% productCode = (request.getParameter("productCode") != null ? request.getParameter("productCode") : "");%>
<% colorParam = (request.getParameter("color") != null ? request.getParameter("color") : "");%>
<% sizeParam = (request.getParameter("size") != null ? request.getParameter("size") : "");%>
<% quantityParam = (request.getParameter("quantity") != null ? request.getParameter("quantity") : "");%>
<% product = manager.getProductByProductCode(productCode); %>

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
		<script src="assets/js/pace.min.js"></script>
		
		<link href="assets/css/home-v7.css" rel="stylesheet">
		<link href="assets/css/product-details-5.css" rel="stylesheet">
	</head>

 <body>	
 	<p id="currentuser" style="display:none"><%= (currentUser != null ? currentUser.getId() : 0) %></p>
 	<div id="inventory-item-detail" style="display:none;"><%= manager.getInventoryDetailByProductCode(product.getItem().getProductCode()).getQuantity() %></div>
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
					<a class="gall-item" title="product-title" href="<%= product.getItem().getImage()%>">
						<img class="zoomImage1 img-responsive"
						data-src="<%= product.getItem().getImage()%>" 
						src='<%= product.getItem().getImage()%>' 
						alt='Daisy on the Ohoopee'/>
					</a>
				</div>
				
			</div>
 
			<div class="col-lg-6 col-md-6 col-sm-5">
				<h1 class="product-title"><%= product.getItem().getName() %></h1>
				<h3 class="product-code" id="productCode" name="<%= product.getItem().getProductCode()%>">Product Code : <%= product.getItem().getProductCode()%></h3>
				
				<div class="rating">
					<p>
					<% int rating = (int) manager.getTotalRateOfAnItem(product.getItem().getProductCode());
					 for(int ctr = 0; ctr < 5; ctr ++){ 
					 	if((rating -= 1) >= 0){	
					 %>
						<span><i class="fa fa-star"></i></span>
					<%}else{%>
						<span><i class="fa fa-star-o"></i></span>
					<%}%>
					
					<%} %>
					<span class="ratingNumber"> /  <%= new RoundUtil().round(((double) (manager.getTotalRateOfAnItem(product.getItem().getProductCode()))) , 2) %></span>
					</p>
				</div>
				
				
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
							<select class="form-control" id="quantity-id-select">
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
						<select class="form-control" id="size-list-option">
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
						<button
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
				<h3 class="incaps" id="inventory-stock" name="in"><i class="fa fa fa-check-circle-o color-in"></i> In stock</h3>
				<%}else{ %><h3 class="incaps" id="inventory-stock" name="out">
					<i class="fa fa-minus-circle color-out">
					</i> Out of stock
				</h3>
				<%} %>
				
				<h3 class="incaps" id="3d-button">
					<i class="glyphicon glyphicon-">
					</i> <a href="#" id="3d-link">View as 3D</a>
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
 	<style>
	section div{
		background-color:white;
		
	}
	.graybg {
		background-color:white;
	}
   
</style>
<section class="section-review graybg" id="product-review">
	
	<div class="container">
		<div class="hero-section-header productReviewTitleBAr">
			<h3 class="hero-section-title"><i class="fa fa-2x  fa-comments-o"></i> Product Review</h3>
				<div class="rating commentRating">
					<p>
					<% int rating1 = (int) manager.getTotalRateOfAnItem(product.getItem().getProductCode());
					System.out.println(rating1); 
					for(int ctr = 0; ctr < 5; ctr ++){ 
					 	if((rating1 -= 1) >= 0){	
					 %>
						<span><i class="fa fa-star"></i></span>
					<%}else{%>
						<span><i class="fa fa-star-o"></i></span>
					<%}%>
					
					<%} %>
					<span class="ratingNumber"> /  <%= new RoundUtil().round(((double) (manager.getTotalRateOfAnItem(product.getItem().getProductCode()))) , 2) %></span>Average rating</span>
					</p>
										
				</div>
				
				<% 
				totalReview = 0;
				for(Review review : manager.getAllReviewByItemId(product.getItem().getProductCode())) {
					totalReview ++;
				}
				%>
		</div>
		<div class="row">
			<div class="col-lg-12 review-sortByBar">
				<div class="pull-left">
					<h4 class="no-margin-no-padding uppercase"><span class="bold"><%= totalReview %></span> Reviews </h4>
				</div>
				<div class="pull-right col-lg-2 no-padding">
					<select class="form-control">
						<option selected>Most Recent</option>
						<option>Most Recent</option>
						<option>Most Helpful</option>
						<option>Top Rated</option>
					</select>
				</div>
</div>
</div>


<!-- YOUR REVIEW -->
<% for(Review review : manager.getAllReviewByItemId(product.getItem().getProductCode())){
	if((currentUser != null ? currentUser.getId() : -1) == review.getUserId()){	%>
<div class="row review-item">
<div class="col-lg-3 col-sm-3  left">
<div class="review-item-user">
<div class="review-item-user-profile">
<img class="img-circle" alt="" src="spy.png">
</div>
<div class="user-name">
<p><%= (String) (manager.getUserById(review.getUserId()).getFirstName())%> <%= (String) (manager.getUserById(review.getUserId()).getLastName())%></p>
<small><%= new DateUtil().getDateAsString(review.getDate()) %></small>
</div>
</div>
</div>
<div class="col-lg-9  col-sm-9 right">
<div class="rating commentRating">
<p>
	<% int userRating = review.getRate();
		 for(int ctr = 0; ctr < 5; ctr ++){ 
			if((userRating -= 1) >= 0){	
	%>
				<span><i class="fa fa-star"></i></span>
			<%}else{%>
				<span><i class="fa fa-star-o"></i></span>
			<%}%>					
		<%} %>
</p>
</div>
<h5 class="reviewUserTitle"><strong><%= review.getSubject() %></strong></h5>
<p class="commentText">
<%= review.getComment() %></p>
</div>
</div>
<%  break;} }%>




<div class="all-review-wrapper wow  fadeIn">

<div class="row">
<div class="col-lg-12 review-load-more">
<div class=" text-center">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<% 
if(currentUser == null){ %>
<a class="btn  btn-success" data-toggle="tooltip" title="Please sign in to write a comment" id="tooltip">

<i class="fa fa-edit"></i> Write reviews</a>
<%}else{
	theFlag = true;
	for(Review review : manager.getAllReviewByItemId(product.getItem().getProductCode())){
		if(product.getItem().getProductCode().equals(review.getItemId()) && currentUser.getId() == review.getUserId()){
			theFlag = false;
			userCurrentReview = review;
			break;
		}
	}
	
if(theFlag){

%>
<a class="btn  btn-success" data-target="#modal-review" data-toggle="modal" id="review-command-button" name="delete">
<i class="fa fa-edit"></i> Write reviews</a>
<%}else{%>
	<a class="btn btn-default" id = "delete-review">
	<i class="fa fa-trash-o"></i> Remove Reviews</a>
	
	<a class="btn btn-success" data-target="#modal-review" data-toggle="modal" id="review-command-button" name="update">
	<i class="fa fa-edit"></i> Update reviews</a>
	
<%}}%>

</div>
<!-- All REVIEWS -->
<% for(Review review : manager.getAllReviewByItemId(product.getItem().getProductCode())){
	if((currentUser != null ? currentUser.getId() : -1) != review.getUserId()){	
	%>
<div class="row review-item">
<div class="col-lg-3 col-sm-3  left">
<div class="review-item-user">
<div class="review-item-user-profile">
<img class="img-circle" alt="" src="spy.png">
</div>
<div class="user-name">
<p><%= (String) (manager.getUserById(review.getUserId()).getFirstName())%> <%= (String) (manager.getUserById(review.getUserId()).getLastName())%></p>
<small><%= new DateUtil().getDateAsString(review.getDate()) %></small>
</div>
</div>
</div>
<div class="col-lg-9  col-sm-9 right">
<div class="rating commentRating">
<p>
	<% int userRating = review.getRate();
		 for(int ctr = 0; ctr < 5; ctr ++){ 
			if((userRating -= 1) >= 0){	
	%>
				<span><i class="fa fa-star"></i></span>
			<%}else{%>
				<span><i class="fa fa-star-o"></i></span>
			<%}%>					
		<%} %>
</p>
</div>
<h5 class="reviewUserTitle"><strong><%= review.getSubject() %></strong></h5>
<p class="commentText">
<%= review.getComment() %></p>
</div>
</div>
<%}} %>

</div>
</div>
</div>
</div>
</section>
 
 	
 	<!-- RECOMMENDATION -->
	<jsp:include page="also-like.jsp" />
	
	</div>
 	
 	<div class="gap"></div>
 	
 	<!--  FOOTER HERE -->
 	<jsp:include page="footer.jsp" />
	
	<%if(!theFlag){%>
	
		<div class="modal  fade" id="modal-review" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
						<h3 class="modal-title-site text-center">Product Review</h3>
					</div>
					<div class="modal-body">
						<h3 class="reviewtitle uppercase">You're reviewing: <%= product.getItem().getName() %> Shirt</h3>
						<form>
							<div class="form-group">
								<label>How do you rate this shirt? </label><br>
								<!-- Star rating -->
								<jsp:include page="star-rating.jsp" />
							</div>
							<div class="form-group">
								<label for="rtext">Subject</label>
								<input type="text" class="form-control" id="rtext" placeholder="Subject" required value="<%= userCurrentReview.getSubject() %>">
							</div>
							<div class="form-group ">
								<label>Review</label>
								<textarea id = "comment-text" class="form-control" rows="3" placeholder="Your Review" required><%= userCurrentReview.getComment() %></textarea>
							</div>
							<a type="submit" class="btn btn-success" id="submit-review-now" name = "update">Update Review</a>
						</form>
					</div>
				</div>
			</div>
			</div>
			
			<%}else {%>
				<div class="modal  fade" id="modal-review" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
						<h3 class="modal-title-site text-center">Product Review</h3>
					</div>
					<div class="modal-body">
						<h3 class="reviewtitle uppercase">You're reviewing: <%= product.getItem().getName() %> Shirt</h3>
						<form>
							<div class="form-group">
								<label>How do you rate this shirt? </label><br>
								<!-- Star rating -->
								<jsp:include page="star-rating.jsp" />
							</div>
							<div class="form-group">
								<label for="rtext">Subject</label>
								<input type="text" class="form-control" id="rtext" placeholder="Subject" required>
							</div>
							<div class="form-group ">
								<label>Review</label>
								<textarea id = "comment-text" class="form-control" rows="3" placeholder="Your Review" required></textarea>
							</div>
							<a type="submit" class="btn btn-success" id="submit-review-now" name="add" >Submit Review</a>
						</form>
					</div>
				</div>
			</div>
			</div>
			
			<%} %>
 

		<script>
			$("#submit-review-now").click(function(){
				var subject = $("#rtext").val();
				var comment = $("#comment-text").val();
				var userId = $("#currentuser").html();
				var itemId = $("#productCode").attr("name");
				var rate = $("#result").attr("name");
				
				
				if(rate == "Hated it"){
					rate = "1";
					
				}else if(rate == "Didn't like it"){
					rate = "2";
					
				}else if(rate == "Just OK"){
					rate = "3";
					
				}else if(rate == "Liked it"){
					rate = "4";
					
				}else if(rate == "Loved it"){
					rate = "5";
					
				}
				
				if(rate != ""){
					if($(this).attr("name") == "add")
						window.location.href = "/FinalWK/add/rating?user_id="+ userId +"&item_id="+ itemId +"&rate="+ rate +"&subject="+ subject +"&comment=" + comment;
					else 
						window.location.href = "/FinalWK/update/rating?user_id="+ userId +"&item_id="+ itemId +"&rate="+ rate +"&subject="+ subject +"&comment=" + comment;
				}
			});
			
			$("#delete-review").click(function(){
				var userId = $("#currentuser").html();
				var itemId = $("#productCode").attr("name");
				
				var x = confirm("Are you sure do you want to delete your review");
				if(x)
					window.location.href = "/FinalWK/remove/rating?user_id="+ userId +"&item_id="+ itemId;
				
			});
		</script>			
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
		<script src="assets/js/product-details.js"></script>
		<script src='assets/js/jquery.zoom.js'></script>
		<script>
		    $(document).ready(function () {
		
		    	$('#tooltip').tooltip();
		    	
		    	var obj1 = "https://f3b8ccd8837336f8fae7fb305f5a1051ca9a6a87.googledrive.com/host/0Byebt8ujd0P-M3Jxc19fblRKXzQ/";
		    	var obj2 = "https://212c8f5e336c8ac0b03729eb3de2284becedccd9.googledrive.com/host/0B6-MmXNvrLcsZEV1M192Y2lSMUE/";
		    	var obj3 = "https://fdf60fbcd97bb4b8ed8363af764f1ea1a2084ace.googledrive.com/host/0B6-MmXNvrLcsZ295NXljcDEtZHM/";
		    	var obj4 = "https://31e9d88ca25a82a6f7793d5fbf2c995e569d922e.googledrive.com/host/0B6-MmXNvrLcsZ01qRkxzNEo2Z2c/";
		    	var obj5 = "https://77e3997649a2528a582610ba212ed7b6f290edcc.googledrive.com/host/0Byebt8ujd0P-cVN6WGRuUUNKMWc/";
		    	var obj6 = "https://c975a296f1c5f543971ed7d72d9247dc7113cc4f.googledrive.com/host/0B6-MmXNvrLcsaWtoNFU2SlRTMk0/";
		    	var obj7 = "https://0533d9c30d25dfc0905ab73bc22d59f80283097f.googledrive.com/host/0Byebt8ujd0P-WnpDMHBQVjB3MTQ/";
		    	var obj8 = "https://1ecefa64cf5cb51270f047e543c1564ec2a42b4e.googledrive.com/host/0B6-MmXNvrLcsWlRCZGc4NFNUbXc/";
		    	var obj9 = "https://e7094312523181fcc30ac7c2a347b8b942941b43.googledrive.com/host/0Byebt8ujd0P-RFdpZ21ZM2Ftcjg/";
		    	var obj10 ="https://d10c1cb078288f30af99083e245c6acea2137e62.googledrive.com/host/0Byebt8ujd0P-NHR4a0Rwc0NBT1E/";
		    	var obj11 = "https://6ddd5a8bf1607a08266e9c50a9213c4c850e7410.googledrive.com/host/0B6-MmXNvrLcscmtibk56OHZELVk/";
		    	var obj12 = "https://84d27d98d979bcbdd9c554bfbb7e5c8bd6d48db5.googledrive.com/host/0B6-MmXNvrLcsUklYMy1HZVFoQ00/";
		    	var obj13 = "https://4294eb8bcd92c8d1836d7c03851cc003ceed0b59.googledrive.com/host/0Byebt8ujd0P-TUVPYlMyOVVPMm8/";
		    	var code = "";
		    	
		    	$("#3d-link").click(function(){
		    		code = $("#productCode").attr("name");
		    		if(code == "RX7811"){
		    			window.location.href = "/FinalWK/wearkapampangan/wear/team/kapampangan/product-details-3dviewing.jsp?link=" + obj10 + "&productCode=" + code;
		    		}else if(code == "RX675"){
		    			window.location.href = "/FinalWK/wearkapampangan/wear/team/kapampangan/product-details-3dviewing.jsp?link=" + obj2 + "&productCode=" + code;
		    		}else if(code == "RX3124"){
		    			window.location.href = "/FinalWK/wearkapampangan/wear/team/kapampangan/product-details-3dviewing.jsp?link=" + obj8 + "&productCode=" + code;
		    		}else if(code == "RX8743"){
		    			window.location.href = "/FinalWK/wearkapampangan/wear/team/kapampangan/product-details-3dviewing.jsp?link=" + obj1 + "&productCode=" + code;
		    		}else if(code == "RX4512"){
		    			window.location.href = "/FinalWK/wearkapampangan/wear/team/kapampangan/product-details-3dviewing.jsp?link=" + obj3 + "&productCode=" + code;
		    		}else if(code == "RX4513"){
		    			window.location.href = "/FinalWK/wearkapampangan/wear/team/kapampangan/product-details-3dviewing.jsp?link=" + obj4 + "&productCode=" + code;
		    		}else if(code == "RX4514"){
		    			window.location.href = "/FinalWK/wearkapampangan/wear/team/kapampangan/product-details-3dviewing.jsp?link=" + obj5 + "&productCode=" + code;
		    		}else if(code == "RX4515"){
		    			window.location.href = "/FinalWK/wearkapampangan/wear/team/kapampangan/product-details-3dviewing.jsp?link=" + obj6 + "&productCode=" + code;
		    		}else if(code == "RX4516"){
		    			window.location.href = "/FinalWK/wearkapampangan/wear/team/kapampangan/product-details-3dviewing.jsp?link=" + obj7 + "&productCode=" + code;
		    		}else if(code == "RX4517"){
		    			window.location.href = "/FinalWK/wearkapampangan/wear/team/kapampangan/product-details-3dviewing.jsp?link=" + obj9 + "&productCode=" + code;
		    		}else if(code == "RX4518"){
		    			window.location.href = "/FinalWK/wearkapampangan/wear/team/kapampangan/product-details-3dviewing.jsp?link=" + obj11 + "&productCode=" + code;
		    		}else if(code == "RX4519"){
		    			window.location.href = "/FinalWK/wearkapampangan/wear/team/kapampangan/product-details-3dviewing.jsp?link=" + obj12 + "&productCode=" + code;
		    		}else if(code == "RX32124"){
		    			window.location.href = "/FinalWK/wearkapampangan/wear/team/kapampangan/product-details-3dviewing.jsp?link=" + obj13 + "&productCode=" + code;
		    		}else{
		    			window.location.href = "/FinalWK/wearkapampangan/wear/team/kapampangan/product-details.jsp?productCode=" + code;
		    		}
		    	});
		    	
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
	</body>
</html>
