<%@ page import = "com.wear.kapampangan.project.database.DBManager" %>
<%@ page import = "com.wear.kapampangan.project.library.Shirt" %>
<%@ page import = "com.wear.kapampangan.project.library.User" %>
<%@ page import = "com.wear.kapampangan.project.library.DesignFront" %>
<%@ page import = "com.wear.kapampangan.project.library.DesignBack" %>

<%! User currentUser = null; %>
<%! DBManager manager = null;%>

<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>
<% currentUser = (User) request.getSession().getAttribute("currentuser"); %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">   
  <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">  
  <link href="assets/css/style.css" rel="stylesheet">
  <link id="pagestyle" rel="stylesheet" type="text/css" href="assets/css/skin-1.css">
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
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



.thumbnail {
    position:relative;
    overflow:hidden;
}
 
.caption {
    position:absolute;
    top:0;
    right:0;
    background:rgba(66, 139, 202, 0.75);
    width:100%;
    height:100%;
    padding:2%;
    display: none;
    text-align:center;
    color:#fff !important;
    z-index:2;
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
<br />
<br />
<br />
<br />
<div class="container ">
	<div class="col-lg-12 ">
    <div class="card hovercard">
        <div class="card-background">
            <img class="card-bkimg" alt="" src="images/cover.jpg">
            <!-- http://lorempixel.com/850/280/people/9/ -->
        </div>
        <div class="useravatar">
            <img alt="" src="images/avatar.jpg" style="width:100px; height:100px;">
        </div>
        <div class="card-info"> <span class="card-title">Joselito Abadilla</span>

        </div>
    </div>
    <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
        <div class="btn-group" role="group">
            <button type="button" id="stars" class="btn btn-primary" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                <div class="hidden-xs">My Design</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="favorites" class="btn btn-default" href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-cloud" aria-hidden="true"></span>
                <div class="hidden-xs">Shared Design</div>
            </button>
        </div>
		
        <div class="btn-group" role="group" style="padding:30px;">
             <button type="button" class="btn3d btn btn-info btn-sm" ><span class="glyphicon glyphicon-ok"></span> Create Design</button>
        </div>
    </div>

        <div class="well">
      <div class="tab-content">
        <div class="tab-pane fade in active" id="tab1">
						<div class="row">
								<% for(Shirt shirt : manager.getShirtByUserId(currentUser.getId())){%>
								<div class="col-sm-4">            
										<div class="thumbnail">
											<div class="caption">
												<h4><%=shirt.getShirtName() %></h4>
												<p>short thumbnail description</p>
												<p><a href="/FinalWK/customize/load?shirt_id=<%= shirt.getId() %>&user_id=<%= currentUser.getId() %>" class="label label-danger" rel="tooltip" title="View">Open</a>
												<a href="" class="label label-default" rel="tooltip" title="Download now">Download</a></p>
											</div>
											<img alt="" src="images/product/plain-shirt.jpg" style="width:300px; height:300px;">
										</div>
								  </div>
								  <%} %>
								 
						</div>
        </div>
        <div class="tab-pane fade in" id="tab2">
          <h3>This is tab 2</h3>
        </div>  
      </div>
    </div>
    
    </div>
            
    
</div>


</body>
<script>
$(document).ready(function() {
$(".btn-pref .btn").click(function () {
    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
    // $(".tab").addClass("active"); // instead of this do the below 
    $(this).removeClass("btn-default").addClass("btn-primary");   
});
});


    $("[rel='tooltip']").tooltip();    
 
    $('.thumbnail').hover(
        function(){
            $(this).find('.caption').slideDown(250); //.fadeIn(250)
        },
        function(){
            $(this).find('.caption').slideUp(250); //.fadeOut(205)
        }
    ); 
</script>

</html>