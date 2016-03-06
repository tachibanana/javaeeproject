<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Category" %>
<%@ page import="com.wear.kapampangan.project.library.User" %>
<%@ page import="com.wear.kapampangan.project.library.Topic" %>
<%@ page import="com.wear.kapampangan.project.util.DateUtil" %>
<%@ page import="java.util.*" %>
<%! DBManager manager = null;%>
<%! User currentUser  = null;%>
<%!List<Topic> listOfTopicSearch = null;%>

<% currentUser = (User) request.getSession().getAttribute("currentuser"); %>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>
<% listOfTopicSearch = (List<Topic>) request.getServletContext().getAttribute("searchQuery"); %>
<%System.out.println(); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</head>
<style>
body{padding-bottom:50px;}
/*alteracoes da barra de navegacao principal*/
.navbar-brand img {
    max-width: 100%;
    height: 50px;
    margin-top: -15px;
}
.navbar-inverse {
    background: #4D5061;
    border-bottom: 4px solid #60B078;
    color: #FFF;
}
.navbar-inverse .navbar-brand, .navbar-inverse .navbar-nav > li > a {
    text-shadow: none;
    color: #FFF;
}
.navbar-inverse .navbar-nav>.active>a,
.navbar-inverse .navbar-nav>.open>a,
.navbar-inverse .navbar-nav> ul >li,
.navbar-inverse .navbar-nav>li.focus>a,
.navbar-inverse .navbar-nav > .active > a:focus,
.navbar-inverse .navbar-nav > .active > a:hover,
.navbar-inverse .navbar-nav > .active >a:visited,
.navbar-inverse .navbar-nav>li:hover>a:hover {
    background-image: #60B078;
    background: #60B078;
    background-color: #60B078!important;/*necessario para forcar a regra do bootstrap que tem important*/
    color: #FFF;
    -webkit-transition: all  ease-in .3s;
    -o-transition: all  ease-in .3s;
    -moz-transition: all  ease-in .3s;
    -ms-transition: all  ease-in .3s;
    transition: all  ease-in .3s;

}
.dropdown-menu > li > a:focus, .dropdown-menu > li > a:hover { color: #FFF; text-decoration: none; background-color: #60B078; }
.dropdown-menu >li >a {padding: 5px 20px;}
.dropdown-menu > li > a:focus, .dropdown-menu > li > a:hover {
    margin-top: 0px;
    margin-bottom: 0px;
    color: #FFF;
    font-weight: 200;
    background-color: #60B078;
    background-image: none;
    background-repeat: none;
    -webkit-transition: all  ease-in .3s;
    -o-transition: all  ease-in .3s;
    -moz-transition: all  ease-in .3s;
    -ms-transition: all  ease-in .3s;
    transition: all  ease-in .3s;
}
.iconSpecial {
    font-size: 30px;
    color: #4D5061;
    text-align: center;
}

.btn { border-radius: 0px; }
.text-dark {color: #333;}
.text-light{color: #eee;}
.text16 {font-size: 16px;}

ul.nav.navbar-nav.navbar-right:last-child  {
    margin-right: 50px;
}
/*MENU DE CONTEXTO*/
.navbar-static-top{
    position: relative;
    margin-top: 50px;
    background: #f1ecec;
    box-shadow: 0px -2px 8px 0px #333333;
}
.navbar-static-top .navbar-nav>li>a{color:#4D5061}
.navbar-static-top .navbar-nav>li>a:hover {
    color: #4D5061;
    background-color: #dadada;
    -webkit-transition: all  ease-in .3s;
    -o-transition: all  ease-in .3s;
    -moz-transition: all  ease-in .3s;
    -ms-transition: all  ease-in .3s;
    transition: all  ease-in .3s;
}

.navbar-static-top .navbar-brand {
    font-size: 14px;
    color: #4D5061;
    font-style: normal;
    font-weight: bolder;
}
.navbar-static-top .navbar-brand::after {
  content: "|";
  font-size: 20px;
  color: #4D5061;
  margin-left: 10px;
  font-style: normal;
  font-weight: lighter;
}
.navbar-static-top .dropdown-menu > li > a:focus, .dropdown-menu > li > a:hover {
    margin-top: 0px;
    margin-bottom: 0px;
    color: #4D5061;
    font-weight: 200;
    background-color: #dadada;
    background-image: none;
    background-repeat: none;
    -webkit-transition: all  ease-in .3s;
    -o-transition: all  ease-in .3s;
    -moz-transition: all  ease-in .3s;
    -ms-transition: all  ease-in .3s;
    transition: all  ease-in .3s;
}
.animated {
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}
@-webkit-keyframes fadeIn {
  0% {
    opacity: 0;
  }

  100% {
    opacity: 1;
  }
}

@keyframes fadeIn {
  0% {
    opacity: 0;
  }

  100% {
    opacity: 1;
  }
}

.fadeIn {
  -webkit-animation-name: fadeIn;
  animation-name: fadeIn;
}

@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }

  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}
@-webkit-keyframes flipInX {
  0% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, 90deg);
    transform: perspective(400px) rotate3d(1, 0, 0, 90deg);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in;
    opacity: 0;
  }

  40% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, -20deg);
    transform: perspective(400px) rotate3d(1, 0, 0, -20deg);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in;
  }

  60% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, 10deg);
    transform: perspective(400px) rotate3d(1, 0, 0, 10deg);
    opacity: 1;
  }

  80% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, -5deg);
    transform: perspective(400px) rotate3d(1, 0, 0, -5deg);
  }

  100% {
    -webkit-transform: perspective(400px);
    transform: perspective(400px);
  }
}

@keyframes flipInX {
  0% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, 90deg);
    transform: perspective(400px) rotate3d(1, 0, 0, 90deg);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in;
    opacity: 0;
  }

  40% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, -20deg);
    transform: perspective(400px) rotate3d(1, 0, 0, -20deg);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in;
  }

  60% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, 10deg);
    transform: perspective(400px) rotate3d(1, 0, 0, 10deg);
    opacity: 1;
  }

  80% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, -5deg);
    transform: perspective(400px) rotate3d(1, 0, 0, -5deg);
  }

  100% {
    -webkit-transform: perspective(400px);
    transform: perspective(400px);
  }
}

.flipInX {
  -webkit-backface-visibility: visible !important;
  backface-visibility: visible !important;
  -webkit-animation-name: flipInX;
  animation-name: flipInX;
}

@-webkit-keyframes flipInY {
  0% {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, 90deg);
    transform: perspective(400px) rotate3d(0, 1, 0, 90deg);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in;
    opacity: 0;
  }

  40% {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, -20deg);
    transform: perspective(400px) rotate3d(0, 1, 0, -20deg);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in;
  }

  60% {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, 10deg);
    transform: perspective(400px) rotate3d(0, 1, 0, 10deg);
    opacity: 1;
  }

  80% {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, -5deg);
    transform: perspective(400px) rotate3d(0, 1, 0, -5deg);
  }

  100% {
    -webkit-transform: perspective(400px);
    transform: perspective(400px);
  }
}
#login-dp{
    min-width: 250px;
    padding: 14px 14px 0;
    overflow:hidden;
    background-color:rgba(255,255,255,.8);
}
#login-dp .help-block{
    font-size:12px
}
#login-dp .bottom{
    background-color:rgba(255,255,255,.8);
    border-top:1px solid #ddd;
    clear:both;
    padding:14px;
}
#login-dp .social-buttons{
    margin:12px 0
}
#login-dp .social-buttons a{
    width: 49%;
}
#login-dp .form-group {
    margin-bottom: 10px;
}
.btn-fb{
    color: #fff;
    background-color:#3b5998;
}
.btn-fb:hover{
    color: #fff;
    background-color:#496ebc
}
.btn-tw{
    color: #fff;
    background-color:#55acee;
}
.btn-tw:hover{
    color: #fff;
    background-color:#59b5fa;
}
@media(max-width:768px){
    #login-dp{
        background-color: inherit;
        color: #fff;
    }
    #login-dp .bottom{
        background-color: inherit;
        border-top:0 none;
    }
}

/*font Awesome http://fontawesome.io*/
@import url(//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css);
/*Comment List styles*/
.comment-list .row {
  margin-bottom: 0px;
}
.comment-list .panel .panel-heading {
  padding: 4px 15px;
  position: absolute;
  border:none;
  /*Panel-heading border radius*/
  border-top-right-radius:0px;
  top: 1px;
}
.comment-list .panel .panel-heading.right {
  border-right-width: 0px;
  /*Panel-heading border radius*/
  border-top-left-radius:0px;
  right: 16px;
}
.comment-list .panel .panel-heading .panel-body {
  padding-top: 6px;
}
.comment-list figcaption {
  /*For wrapping text in thumbnail*/
  word-wrap: break-word;
}
/* Portrait tablets and medium desktops */
@media (min-width: 768px) {
  .comment-list .arrow:after, .comment-list .arrow:before {
    content: "";
    position: absolute;
    width: 0;
    height: 0;
    border-style: solid;
    border-color: transparent;
  }
  .comment-list .panel.arrow.left:after, .comment-list .panel.arrow.left:before {
    border-left: 0;
  }
  /*****Left Arrow*****/
  /*Outline effect style*/
  .comment-list .panel.arrow.left:before {
    left: 0px;
    top: 30px;
    /*Use boarder color of panel*/
    border-right-color: inherit;
    border-width: 16px;
  }
  /*Background color effect*/
  .comment-list .panel.arrow.left:after {
    left: 1px;
    top: 31px;
    /*Change for different outline color*/
    border-right-color: #FFFFFF;
    border-width: 15px;
  }
  /*****Right Arrow*****/
  /*Outline effect style*/
  .comment-list .panel.arrow.right:before {
    right: -16px;
    top: 30px;
    /*Use boarder color of panel*/
    border-left-color: inherit;
    border-width: 16px;
  }
  /*Background color effect*/
  .comment-list .panel.arrow.right:after {
    right: -14px;
    top: 31px;
    /*Change for different outline color*/
    border-left-color: #FFFFFF;
    border-width: 15px;
  }
}
.comment-list .comment-post {
  margin-top: 6px;
}


.breadcrumb {
    padding: 0px;
	background: #D4D4D4;
	list-style: none; 
	overflow: hidden;
    margin-top: 20px;
}
.breadcrumb>li+li:before {
	padding: 0;
}
.breadcrumb li { 
	float: left; 
}
.breadcrumb li.active a {
	background: brown;                   /* fallback color */
	background: #ffc107 ; 
}
.breadcrumb li.completed a {
	background: brown;                   /* fallback color */
	background: hsla(153, 57%, 51%, 1); 
}
.breadcrumb li.active a:after {
	border-left: 30px solid #ffc107 ;
}
.breadcrumb li.completed a:after {
	border-left: 30px solid hsla(153, 57%, 51%, 1);
} 

.breadcrumb li a {
	color: white;
	text-decoration: none; 
	padding: 10px 0 10px 45px;
	position: relative; 
	display: block;
	float: left;
}
.breadcrumb li a:after { 
	content: " "; 
	display: block; 
	width: 0; 
	height: 0;
	border-top: 50px solid transparent;           /* Go big on the size, and let overflow hide */
	border-bottom: 50px solid transparent;
	border-left: 30px solid hsla(0, 0%, 83%, 1);
	position: absolute;
	top: 50%;
	margin-top: -50px; 
	left: 100%;
	z-index: 2; 
}	
.breadcrumb li a:before { 
	content: " "; 
	display: block; 
	width: 0; 
	height: 0;
	border-top: 50px solid transparent;           /* Go big on the size, and let overflow hide */
	border-bottom: 50px solid transparent;
	border-left: 30px solid white;
	position: absolute;
	top: 50%;
	margin-top: -50px; 
	margin-left: 1px;
	left: 100%;
	z-index: 1; 
}	
.breadcrumb li:first-child a {
	padding-left: 15px;
}
.breadcrumb li a:hover { background: #ffc107  ; }
.breadcrumb li a:hover:after { border-left-color: #ffc107   !important; }
</style>
<body>
<p id="user_id" style="display:none;">
		<% 
			if(currentUser == null){ %>				
				0
			<%}else{ %>
				<%= currentUser.getId() %>
		<%}%>
	</p>
<div>
<nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header pull-right">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      
    <div class="collapse navbar-collapse animated fadeIn" id="bs-example-navbar-collapse-1">
     
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="/FinalWK/wearkapampangan/wear/team/kapampangan/login1.jsp" ><b> Login</b></a>   		
		</li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<!-- Second Nav -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="position:fixed;width:100%;">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <!-- Brand -->
      <a class="navbar-brand" href="#">Wear-Kapampangan Forum</a>
    </div>
    <div class="collapse navbar-collapse animated fadeIn" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav animated fadeIn">
        <li class="active"><a href="/FinalWK/wearkapampangan/wear/team/kapampangan">HOME</a></li>
        <li><a href="/FinalWK/wearkapampangan/wear/team/kapampangan/shop.jsp">SHOP</a></li>
	  </ul>
        
		<ul>
	 
		    <!-- add search form -->
            <form class="navbar-form navbar-right" role="search">
                <div class="input-group col-xs-3" >		
						<input type="hidden" name="search_param" value="all" id="search_param ">         
						<input id="search_query" type="text" class="form-control-md" name="x" placeholder="Search Forum" style="height:35px;padding-left:5px;" >
						
						<span class="input-group-btn">
							<button id="button_search" class="btn btn-success" style="border-radius: 0; " type="button"> &nbsp <span class="glyphicon glyphicon-search"></span> &nbsp </button>
						</span>
				</div>          
            </form>
		</ul>
	</div>
</nav>
</div>
<div class="container" style="padding-top:100px;">
	<div class="row">
		<ul class="breadcrumb">
			<li class="completed"><a href="forum-forum-category.jsp">Category</a></li>
			<li class="active"><a href="#">Title</a></li>
			<li><a href="#">Thread</a></li>
			<li><a href="#">Reply</a></li>
		</ul>
	</div>
</div>
	<div class="container">
	<div class="row">
		<div class="col-lg-12">
    <div class="row">




    <div class="panel panel-default">
        <div class="panel-heading" style="padding:20px;">		
			<b>TOPIC</b>
			<!-- Trigger the modal with a button -->
				
        </div>
        <div class="panel-body">  



			<%if(listOfTopicSearch != null){for(Topic topic : listOfTopicSearch){ %>
		        
		        <div class="well shadow-z-1" style="background-color: rbga(25 , 255 , 100 , 1);">
            <div class="media">
                <p class="pull-left">
                    <img style="margin-left:15px;"class="[ img-circle pull-left ]" src="https://lh3.googleusercontent.com/uFp_tsTJboUY7kue5XAsGA=s46" alt="Mouse0270" />
                    <br /><b><%= manager.getUserById(topic.getUserId()).getFirstName() %> <%= manager.getUserById(topic.getUserId()).getLastName() %></b>
                </p>
                <div class="media-body">
                    <div class="col-lg-8 padding-left-0">
                        <h4 class="media-heading"><a href="forum-forum-post.jsp?topic_id=<%= topic.getId() %>"><%= topic.getSubject() %></a></h4> 
                    </div>
                    <div class="col-lg-4 text-right">
                        <i class="fa fa-eye text-success " style=" font-size: 1em;"></i>&nbsp <label class="text-">Views: <%= topic.getViews() %></label>
                    </div>

                    <div class="col-lg-12 padding-left-0">

                        <ul class="list-inline list-unstyled">
                          
                            <li></li>
                            <li><span><i class="glyphicon glyphicon-calendar text-default"></i> <%= new DateUtil().getDateAsString(topic.getDate()) %></span></li>
                            <li></li>
                            <span><i class="glyphicon glyphicon-comment text-warning"></i> <%= manager.getAllPostByTopicId(topic.getId()).size() %> reply</span>
                            <li></li>
                            <%if(currentUser != null){
                            	if(currentUser.getId() == topic.getUserId()){
                            %>
                            
								<li onclick="deleteTopic(<%= topic.getId() %> , <%= topic.getCategoryId() %>)"><div id="TrashButton" class="glyphicon glyphicon-trash text-danger" style="cursor:pointer"></div></li>
							<%}} %>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
		<%}} %>


       </div><!-- /end panel-body -->
      <div class="panel-footer panel-footer-button">&copy Copyrights 2016</div>
    </div><!-- / end panel-->



    </div>
</div>
	</div>
</div>
 
<script>

function deleteTopic(id , catId){
	var flag = confirm("Are you sure you want to delete this thread?");
	if(flag){
		window.location.href= "/FinalWK/delete/topic?category_id="+ catId +"&topic_id=" + id;

	}
}
</script>
<script>
		$("#button_search").click(function(){
			var searchQuery = $("#search_query").val();
			if(searchQuery.trim() != ""){
				window.location.href = "/FinalWK/search/topic?search_query=" + searchQuery.trim();
			}else{
				alert("Search input is empty");
			}
		});
	</script>
</body>
</html>