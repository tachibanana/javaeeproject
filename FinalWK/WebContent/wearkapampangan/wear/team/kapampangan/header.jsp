<%@ page import="com.wear.kapampangan.project.library.User" %>
<%! User currentUser = null;%>
<%! Boolean showStatus = true;%>
<%! String logStatus = "Create account";%>

<% currentUser = (User) session.getAttribute("currentuser");%>
<% if(currentUser != null) showStatus = false ; else showStatus = true;%>
<% if(currentUser != null) logStatus = "Hi " + currentUser.getFirstName(); else logStatus = "Create account";%>

<!-- First Navbar -->
<div class="navbar navbar-tshop navbar-fixed-top megamenu" role="navigation" style="background-color:#000000;">
	<div class="navbar-top">
		<div class="container">
			<div class="row">
			
				<!-- LEFT SIDE -->
				<div class="col-lg-6 col-sm-6 col-xs-6 col-md-6">
					<div class="pull-left ">
						<ul class="userMenu ">
						
							<!-- HELP -->
							<li>
								<a href="#">
									<span class="hidden-xs">HELP</span>
									<i class="glyphicon glyphicon-info-sign hide visible-xs "></i>
								</a>
							</li>
							
							<!-- PHONE NUMBER -->
							<li class="phone-number">
								<a href="#">
									<span><i class="glyphicon glyphicon-phone-alt "></i></span>
									<span class="hidden-xs" style="margin-left:5px">
										 0925 991 2299
									</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			
			<!-- RIGHT SIDE -->		
			<div class="col-lg-6 col-sm-6 col-xs-6 col-md-6 no-margin no-padding">
				<div class="pull-right">
					<ul class="userMenu">
						<li>
							<a href="/FinalWK/myAccount">
								<span class="hidden-xs"> My Account</span>
								<i class="glyphicon glyphicon-user hide visible-xs "></i>
							</a>
						</li>
						
						<li><% if( showStatus ){%>
							<a href="/FinalWK/wearkapampangan/wear/team/kapampangan/login1.jsp">
								<span class="hidden-xs">Sign in</span>
								<i class="glyphicon glyphicon-log-in hide visible-xs "></i>
							</a>
							<% }else{%>
								<a href="/FinalWK/invalidate">
									<span class="hidden-xs">Log out</span>
									<i class="glyphicon glyphicon-log-in hide visible-xs "></i>
								</a>
							<%} %>
						</li>
						
						<li class="hidden-xs">
							<a href="signup.jsp">
								<%= logStatus %>
							</a>
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
		
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-cart">
			<i class="fa fa-shopping-cart colorWhite"> </i>
			<!-- <span class="cartRespons colorWhite">Cart (PHP 250</span> -->
		</button>
		
		<a class="navbar-brand " href="index.jsp">
			 <img src="images/logo.png" alt="WEAR KAPAMPANGAN">  
			
		</a>
		
 		<div class="search-box pull-right hidden-lg hidden-md hidden-sm">
			<div class="input-group">
				<button class="btn btn-nobg getFullSearch" type="button">
					<i class="fa fa-search"></i>
				</button>
			</div>
 
		</div>
	</div>
	
	<div class="navbar-collapse collapse">
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">Home</a></li>
			<li class="dropdown megamenu-80width "><a href="shop.jsp">SHOP</a></li>
			<li class="dropdown megamenu-fullwidth"> <a data-toggle="dropdown" class="dropdown-toggle" onclick="location.href='about.jsp'">ABOUT</a></li>
			<li class="dropdown megamenu-fullwidth"> <a data-toggle="dropdown" class="dropdown-toggle" onclick="location.href='../../../forum/forum-forum-category.jsp'">FORUM</a></li>
		</ul>
 
		<div class="nav navbar-nav navbar-right hidden-xs">
		
			<!-- CART Here -->
			<jsp:include page="header-cart.jsp" />
			
			
			<div class="search-box">
				<div class="input-group">
					<button class="btn btn-nobg getFullSearch" type="button"> <i class="fa fa-search"> </i> </button>
				</div>
			</div>
 
			</div>
		</div>
	</div>
 
	<div class="search-full text-right">
		<a class="pull-right search-close">
			<i class=" fa fa-times-circle"></i>
		</a>
		<div class="searchInputBox pull-right">
			<input type="search" data-searchurl="search?=" name="q" placeholder="start typing and hit enter to search" class="search-input" id="text-search">
				<button class="btn-nobg search-btn" type="submit" onclick="location.href='/FinalWK/search?productName=' + getElementById('text-search').value"> <i class="fa fa-search"> </i> </button>
		</div>
	</div>
 
</div>