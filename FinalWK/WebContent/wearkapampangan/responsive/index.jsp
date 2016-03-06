<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Shirt" %>
<%@ page import="com.wear.kapampangan.project.library.DesignFront" %>
<%@ page import="com.wear.kapampangan.project.library.DesignBack" %>

<%! DBManager manager = null; %>
<%! String front = ""; %>
<%! String back = ""; %>
<%! String shirt = ""; %>
<%! String color = "white"; %>
<%! int shirtId = 0; %>
<%! String shirtName = ""; %>

<% manager = (DBManager) request.getServletContext().getAttribute("dbamanager"); %>
<% front = (request.getParameter("front") != null ?  request.getParameter("front") : ""); %>
<% back = (request.getParameter("back") != null ?  request.getParameter("back") : "");%>
<% color = (request.getParameter("shirt") != null ?  request.getParameter("shirt") : "white");%>
<% shirtId = (request.getParameter("shirt_id") != null ? Integer.parseInt(request.getParameter("shirt_id")) : 0);%>
<% shirtName = (request.getParameter("shirt_name") != null ?  request.getParameter("shirt_name") : "Untitled");%>
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
		<link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<p id="front-design" style="display:none;"><%= front %></p>
		<p id="back-design" style="display:none;"><%= back %></p>
		<p id="shirt_color" style="display:none;"><%= color %></p>
		<p id="shirt_id" style="display:none;"><%= shirtId %></p>
		<p id="shirt_name" style="display:none;"><%= shirtName %></p>
		<!-- MAIN CONTAINER -->
		<div class="container-fluid">
			<div class="row">
				<!-- SHIRT OPTION TAB -->
				<div class="col-md-6 col-lg-3 col-sm-5 col-xs-12" style=";height:650px;">
					<div id="option-tabs" style="height:650px;">
						<ul>
							<li style="color:white; font-weight:bold;"><a href="#tabs-1">Product</a></li>
							<li style=" color:white; font-weight:bold;" ><a href="#tabs-2">Clip ART</a></li>
							<li style="color:white; font-weight:bold;"><a href="#tabs-3">Text  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</a></li>
						</ul>
						<div id="tabs-1">
							<div class="panel dog">
								<div class="panel-heading" style="background-color:#3C3C3C; color:white; font-weight:bold;">
									<h4><i class="fa fa-star"></i>&nbsp Product Options</h4>
								</div>
								<div class="panel-body">
									<label for="comment" "><i class="fa fa-flask"></i> &nbsp Product Color </label>
									<div class="input-group" id="">					
										<div class="row" id="id-row-new-here">
										  <div id="small-img">
												<ul id="shirt-color">
													<li class="ls_small" id="button-white"  style="border: solid black 1px;margin:3px;">
														<img src="assets/images/customizing/default-white-shirt.png" class="img-responsive inline-block" />
													</li>
													<li id="button-blue"  style="border: solid black 1px;margin:3px;">
														<img src="assets/images/customizing/default-sky-blue-shirt.png" class="img-responsive inline-block" />
													</li>
													<li id="button-green" style="border: solid black 1px;margin:3px;">
														<img src="assets/images/customizing/default-apple-green-shirt.png" class="img-responsive inline-block" />
													</li>
													<li id="button-red" style="border: solid black 1px;margin:3px;">
															<img src="assets/images/customizing/default-apple-red-shirt.png" class="img-responsive inline-block" />
													</li> 
												</ul>
										  </div>
										</div>
										<br />
										<label for="comment" "><i class="fa fa-flask"></i> &nbsp Direction </label>
										<br />
										<div class="row" style="width:100%;" align="center">
											<div style="margin:0px auto;">
												<button id="tae">Back</button>
											</div>
										</div>
									</div>				
								</div>
								
								<div class="panel-heading" style="background-color:#3C3C3C; color:white; font-weight:bold;">
									<h4><i class="fa fa-star"></i>&nbsp Save Options</h4>
								</div>
								
								<div class="panel-body">
									<label for="comment" "><i class="fa fa-flask"></i> &nbsp Image </label>
									<div class="input-group" id="">					
										<div class="row" id="id-row-new-here">
										 
										</div>
										<div class="row" style="width:100%;" align="center">
											<div style="margin:0px auto;width:100%;">
												 <div style="margin:0px auto;">     
													<button id="save-file" style="width:100%;margin:3px; margin-left: 17px;" align="center">Save</button>
													<button id="preview"  style="width:100%;margin:3px; margin-left:17px;" align="center">Preview</button>
													<input type="number" value="500" id="imgW" style="width:48px;margin:5px"> &nbsp; X &nbsp; <input type="number" value="600" id="imgH" style="width:48px;margin:5px;"/>
												</div>
											</div>
										</div>
									</div>				
								</div>
							</div>
						</div>					
						<div id="tabs-2">
							<div class="panel-body">														
								<div class="dropdown">
									<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Choose your category
									  <span class="caret"></span></button>
									  <ul class="dropdown-menu" id="the-menu">
										<li id="choose-butterfly"><a href="#">Butterfly</a></li>
										<li id="choose-car"><a href="#" >Cars</a></li>
										 <li id="choose-cool"><a href="#">Cool</a></li>
										<li id="choose-others"><a href="#">Others</a></li>
									  </ul>
									</div>
								 </br>
								<table class="table" id="the-table">						
									<tbody id="clipart-container" name="choose-car" style="display:none;">
									  <tr>
												<td><img src="assets/images/customizing/clipart/car1.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/car2.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/car3.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
									  </tr>
									  <tr>
												<td><img src="assets/images/customizing/clipart/car4.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/car5.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/car6.jpeg" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
									  </tr>
									  <tr>
												<td><img src="assets/images/customizing/clipart/car7.jpg" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/car8.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/car9.jpeg" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
									  </tr>
									   <tr>
												<td><img src="assets/images/customizing/clipart/car10.jpg" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/car11.jpg" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/car12.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
									  </tr>
									</tbody>
									
									<tbody id="clipart-container" name="choose-butterfly">
									  <tr>
												<td><img src="assets/images/customizing/clipart/butterfly1.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/butterfly2.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/butterfly3.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
									  </tr>
									  <tr>
												<td><img src="assets/images/customizing/clipart/butterfly4.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/butterfly5.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/butterfly6.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
									  </tr>
									  <tr>
												<td><img src="assets/images/customizing/clipart/butterfly7.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/butterfly8.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/butterfly9.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
									  </tr>
									   <tr>
												<td><img src="assets/images/customizing/clipart/butterfly10.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/butterfly11.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/butterfly12.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
									  </tr>
									</tbody>
									
									
									<tbody id="clipart-container" name="choose-cool" style="display:none;">
									  <tr>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
									  </tr>
									  <tr>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
									  </tr>
									  <tr>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
									  </tr>
									   <tr>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
									  </tr>
									</tbody>
									
									<tbody id="clipart-container" name="choose-others" style="display:none;">
									  <tr>
												<td><img src="assets/images/customizing/clipart/bubble.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
									  </tr>
									  <tr>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
									  </tr>
									  <tr>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
									  </tr>
									   <tr>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
												<td><img src="assets/images/customizing/clipart/other.png" style="width: 50px; height: 50px; border: 1px solid black; padding 5px;"></td>
									  </tr>
									</tbody>
									
								</table>
								<br />
								<label for="comment">Image Size</label>
								<p id="image-size-value">50</p>
								<div id="image-size"></div>
								<br />
								<button type="button" id="upload-image" class="btn btn-success" style="margin-left: 30px;": 35px;"><i class="fa fa-arrow-circle-o-up"></i>&nbsp Upload Image</button>
						
								
							</div>
						</div>
						<div id="tabs-3" >
							<div class="panel" id="text-option">
								<div class="panel-heading" style="background-color:#3C3C3C; color:white; font-weight:bold;">
									<h4><i class="fa fa-fw fa-check"></i> Text Options</h4>
								</div>
								
								<div class="panel-body">													
									<label for="comment">Enter text below</label>
									<textarea class="form-control" rows="5" id="text-text-item"></textarea>
									<button type="button" class="btn btn-default pull-right" id="add-text-item">New text</button>	
								</div>
								<hr style="margin:0px 5%;margin-top:5px;margin-bottom:5px;"><!-- Divider --></hr>
								<div class="panel-body">
									<div id="font-size">
										<label for="comment">Font Size</label>
										<p id="current-px">12px</p>
										<div id="slider"></div>
									</div>
								</div>
								<hr style="margin:0px 5%;margin-top:5px;margin-bottom:5px;"><!-- Divider --></hr>
								
								<div class="panel-body">
									<label for="comment"><i class="fa fa-magic"></i> &nbsp Font Color</label>
									<div class="input-group">
										<span class="input-group-addon btn btn-primary left-inner-addon">#</span>
										<input class="form-control input-lg" id="inputlg" type="text">
										<span class="input-group-addon btn btn-primary right-inner-addon"><input id="color-picker" type="color" name="cp2" value="#9b59b6" class="custom "></span>
									</div>
								</div>
								<hr style="margin:0px 5%;margin-top:5px;margin-bottom:5px;"><!-- Divider --></hr>
								
								<div class="panel-body">
									<div id="font-family">
										<label for="comment">Font</label><br />
										<select id="font-selector" >
											<option value="Arial" style="font-family:Arial;font-size:16px;">Arial</option>
											<option value="Calibri" style="font-family:Calibri;font-size:16px;">Calibri</option>
											<option value="Blessed Day" style="font-family:Blessed Day;font-size:16px;">Blessed Day</option>
											<option value="Cookie Monster" style="font-family:Cookie Monster;font-size:16px;">Cookie Monster</option>
											<option value="Mona Shark" style="font-family:Mona Shark;font-size:16px;">Mona Shark</option>
											<option value="Something Strange" style="font-family:Something Strange;font-size:16px;">Something Strange</option>
											<option value="Variane Script" style="font-family:Variane Script;font-size:16px;">Variane Script</option>
										</select>
									</div>
								</div>
								
							</div>
						</div>
					</div>
				</div>
				<!-- END OF SHIRT OPTION TAB -->
				
				<!-- SHIRT EDITOR -->
				<div class="col-md-5 col-lg-5 col-sm-7 col-xs-12" style="background:white;">
					<div class="container-fluid">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-sm-offset-0 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1" style="background: white;" id="mother-box-the-3">
								<!-- SHIRT VIEWER -->

								<div id="shirt-viewer">
								
									<!-- DESIGNER BOX -->
									<div id="shirt-designer" style="display:block;">
										<!--<p id="text-item-1" style="font-size: 12px;display:inline-block;position:absolute;">Hello</p>-->
									</div>
									<div id="shirt-designer-back" style="display:none;">
										<!--<p id="text-item-1" style="font-size: 12px;display:inline-block;position:absolute;">Hello</p>-->
									</div>
								</div>
								<!-- END OF SHIRT VIEWER -->
								
							</div>
							
						</div>
						<div class="row" id="edit-panel" style="background-image: url(assets/images/customizing/bgpanel.jpg); padding:5px;  padding:5px; border-radius: 8px;-moz-border-radius: 8px;-webkit-border-radius: 8px; border: 2px solid black;">
							<div class="col-md-12">
								<br />
								<div class="container-fluid" ">									  
										  <div class="row" >
											<div class="col-md-4 ">
											  <label for="comment" style="color:#3F3F38;">Edit Design Color  </label>
													<div class="input-group" id="color-list-parent">								
															<input type="button" class="gray" id="colors">
															<input type="button" class="blue" id="colors">
															<input type="button" class="green" id="colors">
															<input type="button" class="sky" id="colors">
															<input type="button" class="yellow" id="colors">
															<input type="button" class="red" id="colors">
															
												
													</div>
											</div>
											<div class="col-md-5" >
												<div class="btn-toolbar" >							
													<button type="button" id="btnReverse" class="btn btn-default btn-sm" style="width: 30px; height: 30px;"><i class="fa fa-exchange"></i> </button>
													<button type="button" id="btnRot" class="btn btn-default btn-sm" style="width: 30px; height: 30px;"><i class="fa fa-retweet"></i> </button> 
													<button type="button" id="btnVertical" class="btn btn-default btn-sm" style="width: 30px; height: 30px;"><i class="fa fa-arrows-v"></i>  </button>
													<button type="button" id="btnHorizontal" class="btn btn-default btn-sm" style="width: 30px; height: 30px;"><i class="fa fa-arrows-h"></i>  </button>
													<button type="button" id="btnVH" class="btn btn-default btn-sm" style="width: 30px; height: 30px;"><i class="fa fa-arrows-alt"> </i></button>
												</div>	
												</br>
												 <form role="form">
													<div class="form-group col-sm-12">
														
														<div class="col-sm-4">
														  <input class="form-control" id="ex1" placeholder="0" type="text" style="width:50px;">
														</div>
														<div class="col-sm-8">
															<button id="btnRotate" type="button" class="btn btn-md text-center" style="background-color:#52524C; color:#ffffff;"><i class="fa fa-refresh"></i> &nbsp ROTATE</button>
														</div>
													</div>
												</form>
											</div>
											<div class="col-md-3 ">
												<div class="btn-toolbar" id="btnNav">							
													<button type="button" id="btnUp" class="btn btn-default btn-sm" style=" margin-left: 33px; border-radius: 40px;"><i class="fa fa-arrow-circle-up"></i></button>
													
													<div class="col-sm-12" style="padding:12px;">												
													<button type="button" id="btnLeft" class="btn btn-default btn-sm pull-left" style="  border-radius: 40px;  "><i class="fa fa-arrow-circle-left"></i></i></button>																			
													<button type="button" id="btnRight" class="btn btn-default btn-sm pull-right" style=" border-radius: 40px;"> <i class="fa fa-arrow-circle-right"></i></button>
													
													</div>
													<button type="button" id="btnDown" class="btn btn-default btn-sm" style=" margin-left: 33px;  border-radius: 40px;"><i class="fa fa-arrow-circle-down"></i></i></button> 
												</div>		
												
												
												
											</div>
										  </div>
									</div>
							</div>
						</div>
					</div>
				</div>
				<!-- END OF SHIRT EDITOR -->
				
				
				<div class="col-md-6 col-lg-4 col-sm-6 col-xs-12" style="background:white;">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="container">
									<div class="row">

										<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation" style="float:left">
											<div class="sidebar-nav">				
													<a class="list-group-item listTopLink" href="#" style="background-color:#3C3C3C; color:white; font-weight:bold;" data-original-title="" title="">Layers Panel <span style="margin-top:2px;color:#ccc;" class="glyphicon glyphicon-stats pull-right"></span></a>
														<div class="nav" id="panel-layer">
															<ul class="list" id="panel-item-list">	
																
															</ul>
															<ul class="list" id="panel-item-list-back" style="display:none;">	
																
															</ul>
														</div>
														
											</div>
										</div>         
									</div>      
								</div> 
								
								<div class="panel" id="order-info">
									<div class="panel-heading" style="background-color:#3C3C3C; color:white; font-weight:bold;">
										<h4 style=""><i class="fa fa-fw fa-check"></i> Order Info</h4>
									</div>
									
									<div class="panel-body">
										<div id="" style="height:150px;">
											Size : 
											<select id="size-list-option">
												<option value="XS">XS</option>
												<option value="S">S</option>
												<option value="M">M</option>
												<option value="L">L</option>
												<option value="XL">XL</option>
											</select>
											&nbsp;&nbsp;&nbsp;&nbsp;
											Quantity : <input type="text" id="quantity-list-option" style="width:30px;"/>
											<br />
											<h4 style="width:50%;margin:10px 25%;">Order Total :</h2>
											<input type="text" placeholder="0.00" style="width:50%;margin:0px 25%;" id="total-list-option" readonly />
											<button style="width:60%;margin:10px 25%;" class="btn btn-success" id="checkout-now"><i class="fa fa-shopping-cart"></i> CHECKOUT</button>
										</div>
									</div>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END OF MAIN CONTAINER -->
		
		<script src="assets/jquery/jquery-ui-1.11.4.custom/external/jquery/jquery.js"></script>
		<script src="assets/jquery/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
		<script src="assets/bootstrap/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
					
		<script src="html2canvas.js"></script>
		<script src="canvas2image.js"></script>
		

		<script src="assets/js/script_.js"></script>
		<script src="assets/js/new-script.js"></script>
		<script src="assets/js/the-back.js"></script>
		<script>	

	$("#preview").click(function(){
	
	var img;
		html2canvas($("#shirt-viewer") , {
				onrendered: function(canvas) {
				$canvas = canvas;
				var another = document.createElement("canvas");
				another = canvas;
				
				img = Canvas2Image.convertToPNG(canvas, $("#imgW").val() , $("#imgH").val());
				$(img).attr({"align" : "center"}).css({"margin":"0px auto"});
				//document.body.appendChild(Canvas2Image.convertToPNG(canvas, "420", "550"));
				window.open(img.src,'_blank');
				
				}
			});
	});
	
	function chooseCat(category){
		$("table#the-table tbody").each(function(){
			if(category != $(this).attr("name")){
				$(this).css("display" , "none");
			}else{
				$(this).css("display" , "block");
			}
		});
	}
	
	$("#the-menu li").click(function(){
	
		var id = $(this).attr("id");
		chooseCat(id);
	
	
	});
	
	$("#checkout-now").click(function(){
		alert("");
	});

	
</script>
		
	</body>

</html>