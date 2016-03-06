<%@ page import = "com.wear.kapampangan.project.database.DBManager" %>
<%@ page import = "com.wear.kapampangan.project.library.Shirt" %>
<%@ page import = "com.wear.kapampangan.project.library.User" %>
<%@ page import = "com.wear.kapampangan.project.library.DesignFront" %>
<%@ page import = "com.wear.kapampangan.project.library.DesignBack" %>

<%! User currentUser = null; %>
<%! DBManager manager = null;%>

<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>
<% currentUser = (User) request.getSession().getAttribute("currentuser"); %>
<% if(currentUser == null){ response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/login1.jsp");}else{%>
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
		<script src="assets/js/pace.min.js"></script>
		<script src="assets/js/pace.min.js"></script>
	</head>
	<style>	


/* USER PROFILE PAGE */
 .card {
    margin-top: 20px;
    padding: 30px;
    background-color: rgba(214, 224, 226, 0.2);
    -webkit-border-top-left-radius:5px;
    -moz-border-top-left-radius:5px;
    border-top-left-radius:5px;
    -webkit-border-top-right-radius:5px;
    -moz-border-top-right-radius:5px;
    border-top-right-radius:5px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.card.hovercard {
    position: relative;
    padding-top: 0;
    overflow: hidden;
    text-align: center;
    background-color: #fff;
    background-color: rgba(255, 255, 255, 1);
}
.card.hovercard .card-background {
    height: 130px;
}
.card-background img {
    -webkit-filter: blur(25px);
    -moz-filter: blur(25px);
    -o-filter: blur(25px);
    -ms-filter: blur(25px);
    filter: blur(25px);
    margin-left: -100px;
    margin-top: -200px;
    min-width: 130%;
}
.card.hovercard .useravatar {
    position: absolute;
    top: 15px;
    left: 0;
    right: 0;
}
.card.hovercard .useravatar img {
    width: 100px;
    height: 100px;
    max-width: 100px;
    max-height: 100px;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    border-radius: 50%;
    border: 5px solid rgba(255, 255, 255, 0.5);
}
.card.hovercard .card-info {
    position: absolute;
    bottom: 14px;
    left: 0;
    right: 0;
}
.card.hovercard .card-info .card-title {
    padding:0 5px;
    font-size: 20px;
    line-height: 1;
    color: #262626;
    background-color: rgba(255, 255, 255, 0.1);
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
}
.card.hovercard .card-info {
    overflow: hidden;
    font-size: 12px;
    line-height: 20px;
    color: #737373;
    text-overflow: ellipsis;
}
.card.hovercard .bottom {
    padding: 0 20px;
    margin-bottom: 17px;
}
.btn-pref .btn {
    -webkit-border-radius:0 !important;
}



.table-bordered {
border: 1px solid #dddddd;
border-collapse: separate;
border-left: 0;
-webkit-border-radius: 4px;
-moz-border-radius: 4px;
border-radius: 4px;
}

.table {
width: 100%;
margin-bottom: 20px;
background-color: transparent;
border-collapse: collapse;
border-spacing: 0;
display: table;
}

.widget.widget-table .table {
margin-bottom: 0;
border: none;
}

.widget.widget-table .widget-content {
padding: 0;
}

.widget .widget-header + .widget-content {
border-top: none;
-webkit-border-top-left-radius: 0;
-webkit-border-top-right-radius: 0;
-moz-border-radius-topleft: 0;
-moz-border-radius-topright: 0;
border-top-left-radius: 0;
border-top-right-radius: 0;
}

.widget .widget-content {
padding: 20px 15px 15px;
background: #FFF;
border: 1px solid #D5D5D5;
-moz-border-radius: 5px;
-webkit-border-radius: 5px;
border-radius: 5px;
}

.widget .widget-header {
position: relative;
height: 40px;
line-height: 40px;
background: #E9E9E9;
background: -moz-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #fafafa), color-stop(100%, #e9e9e9));
background: -webkit-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
background: -o-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
background: -ms-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
background: linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
text-shadow: 0 1px 0 #fff;
border-radius: 5px 5px 0 0;
box-shadow: 0 2px 5px rgba(0,0,0,0.1),inset 0 1px 0 white,inset 0 -1px 0 rgba(255,255,255,0.7);
border-bottom: 1px solid #bababa;
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9');
-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')";
border: 1px solid #D5D5D5;
-webkit-border-top-left-radius: 4px;
-webkit-border-top-right-radius: 4px;
-moz-border-radius-topleft: 4px;
-moz-border-radius-topright: 4px;
border-top-left-radius: 4px;
border-top-right-radius: 4px;
-webkit-background-clip: padding-box;
}

thead {
display: table-header-group;
vertical-align: middle;
border-color: inherit;
}

.widget .widget-header h3 {
top: 2px;
position: relative;
left: 10px;
display: inline-block;
margin-right: 3em;
font-size: 14px;
font-weight: 600;
color: #555;
line-height: 18px;
text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.5);
}

.widget .widget-header [class^="icon-"], .widget .widget-header [class*=" icon-"] {
display: inline-block;
margin-left: 13px;
margin-right: -2px;
font-size: 16px;
color: #555;
vertical-align: middle;
}

.btn3d.btn-info {
    box-shadow:0 0 0 1px #00a5c3 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #348FD2, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#39B3D7;
}
.btn3d {
    position:relative;
    top: -6px;
    border:0;
     transition: all 40ms linear;
     margin-top:10px;
     margin-bottom:10px;
     margin-left:2px;
     margin-right:2px;
}
.btn3d:active:focus,
.btn3d:focus:hover,
.btn3d:focus {
    -moz-outline-style:none;
         outline:medium none;
}



</style>
	<body>
		<jsp:include page="header.jsp" />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		
		<button type="button" class="btn btn-success" style="margin:5px;margin-bottom:10px;" id = "click-design" ><span class="glyphicon glyphicon-edit"'></span> Design your shirt</button>
		<div class="span7">   
			<div class="widget stacked widget-table action-table">
    				
				<div class="widget-header">
					<i class="icon-th-list"></i>
					<h3></h3>
				</div> <!-- /widget-header -->
				
				<div class="widget-content">
					
					<table class="table table-striped table-bordered custab">
						<thead>
							<tr>
								<th>No.</th>
								<th>Shirt No</th>
								<th>Title / Name</th>
								<th>Color</th>
								<th>Last Date Modified</th>
								<th>No. of clipart / text</th>
								<th class="td-actions"></th>
							</tr>
						</thead>
						<tbody>
						<%int ctrctr = 0 ;for(Shirt shirt : manager.getShirtByUserId(currentUser.getId())){ ctrctr += 1;%>
							 <tr>
                			<td><%= ctrctr %></td>
                			<td>#<%= shirt.getId()  %></td>
                <td><%= shirt.getShirtName() %></td>
                <td><%= shirt.getShirtChoose() %></td>
                <td><%= shirt.getDate() %>
                <td><%= shirt.getDesignBack().size() + shirt.getDesignFront().size() %></td>
                <td class="text-center"><a class='btn btn-info btn-xs' href="/FinalWK/customize/load?shirt_id=<%= shirt.getId() %>&user_id=<%= currentUser.getId() %>"><span class="glyphicon glyphicon-edit"></span> Open</a> <a href="/FinalWK/custom/shirt/delete?shirt_id=<%= shirt.getId() %>" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>
            </tr>
            
            <%} %>
							</tbody>
						</table>
					
				</div> <!-- /widget-content -->
			
			</div> <!-- /widget -->
            </div>
		
		<br />
		<br />
		<br />
		<br />
		<jsp:include page="footer.jsp" />
		<script src="../../../../ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
		</script> <script src="assets/bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.cycle2.min.js"></script>
		<script src="assets/js/jquery.easing.1.3.js"></script>
	 	<script type="text/javascript" src="assets/js/jquery.parallax-1.1.js"></script>
		<script type="text/javascript" src="assets/js/helper-plugins/jquery.mousewheel.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.mCustomScrollbar.js"></script>
		<script type="text/javascript" src="assets/js/ion-checkRadio/ion.checkRadio.min.js"></script>
		<script src="assets/js/grids.js"></script>
		<script src="assets/js/owl.carousel.min.js"></script>
		<script src="assets/js/jquery.minimalect.min.js"></script>
		<script src="assets/js/bootstrap.touchspin.js"></script>
		<script src="assets/js/home.js"></script>
		<script src="assets/js/script.js"></script>
		<script>$("#click-design").click(function(){
			window.location.href= "/FinalWK/wearkapampangan/responsive/index.jsp";
		});</script>
	</body>
</html>
<%}%>