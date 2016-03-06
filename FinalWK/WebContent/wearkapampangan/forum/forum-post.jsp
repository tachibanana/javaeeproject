<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Category" %>
<%@ page import="com.wear.kapampangan.project.library.Topic" %>
<%@ page import="com.wear.kapampangan.project.library.Post" %>
<%@ page import="com.wear.kapampangan.project.library.User" %>
<%@ page import="com.wear.kapampangan.project.util.DateUtil" %>

<%! DBManager manager = null;%>
<%! int topicId = 0; %>
<%! User currentUser  = null;%>
<% currentUser = (User) request.getSession().getAttribute("currentuser"); %>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>
<% topicId = (request.getParameter("topic_id") != null || request.getParameter("topic_id") != "" ? Integer.parseInt(request.getParameter("topic_id")) : 0); %>
<% manager.updateTopicViews(topicId , manager.getTopicByCategoryidAndUserIdAndId(topicId).getViews() + 1);%>

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
body {
    background-color: rgb(229, 229, 229);
    padding-top: 20px;
    padding-bottom: 30px;
}
.widget .panel-body { padding:0px; }
.widget .list-group { margin-bottom: 0; }
.widget .panel-title { display:inline }
.widget .label-info { float: right; }
.widget li.list-group-item {border-radius: 0;border: 0;border-top: 1px solid #ddd;}
.widget li.list-group-item:hover { background-color: rgba(25,255,100,.4); }
.widget .mic-info { color: #666666;font-size: 11px; }
.widget .action { margin-top:5px; }
.widget .comment-text { font-size: 12px; }
.widget .btn-block { border-top-left-radius:0px;border-top-right-radius:0px; }
.panel-google-plus {
    position: relative;
    border-radius: 0px;
    border: 1px solid rgb(216, 216, 216);
    font-family: 'Roboto', sans-serif;
}
.panel-google-plus > .dropdown {
    position: absolute;
    top: 5px;
    right: 15px;
}
.panel-google-plus > .dropdown > span > span {
    font-size: 10px;   
}
.panel-google-plus > .dropdown > .dropdown-menu {
    left: initial;
    right: 0px;
    border-radius: 2px;
}
.panel-google-plus > .panel-google-plus-tags {
    position: absolute;
    top: 35px;
    right: -3px;
}
.panel-google-plus > .panel-google-plus-tags > ul {
    list-style: none;
    padding: 0px;
    margin: 0px;
}
.panel-google-plus > .panel-google-plus-tags > ul:hover {
    box-shadow: 0px 0px 3px rgb(0, 0, 0);   
    box-shadow: 0px 0px 3px rgba(0, 0, 0, 0.25);   
}
.panel-google-plus > .panel-google-plus-tags > ul > li {
    display: block;
    right: 0px;
    width: 0px;
    padding: 5px 0px 5px 0px;
    background-color: rgb(245, 245, 245);
    font-size: 12px;
    overflow: hidden;
}
.panel-google-plus > .panel-google-plus-tags > ul > li::after {
    content:"";
    position: absolute;
    top: 0px;
    right: 0px;
    height: 100%;
	border-right: 3px solid rgb(66, 127, 237);
}
.panel-google-plus > .panel-google-plus-tags > ul:hover > li,
.panel-google-plus > .panel-google-plus-tags > ul > li:first-child {
    padding: 5px 15px 5px 10px;
    width: auto;
    cursor: pointer;
    margin-left: auto;
}
.panel-google-plus > .panel-google-plus-tags > ul:hover > li {
    background-color: rgb(255, 255, 255);   
}
.panel-google-plus > .panel-google-plus-tags > ul > li:hover {
    background-color: rgb(66, 127, 237);
    color: rgb(255, 255, 255);
}
.panel-google-plus > .panel-heading,
.panel-google-plus > .panel-footer {
    background-color: rgb(255, 255, 255);
    border-width: 0px; 
}
.panel-google-plus > .panel-heading {
    margin-top: 20px;    
    padding-bottom: 5px; 
}
.panel-google-plus > .panel-heading > img { 
    margin-right: 15px;
}
.panel-google-plus > .panel-heading > h3 {
    margin: 0px;
    font-size: 14px;
    font-weight: 700;
}
.panel-google-plus > .panel-heading > h5 {
    color: rgb(153, 153, 153);
    font-size: 12px;
    font-weight: 400;
}
.panel-google-plus > .panel-body {
    padding-top: 5px;
    font-size: 13px;
}
.panel-google-plus > .panel-body > .panel-google-plus-image {
    display: block;
    text-align: center;
    background-color: rgb(245, 245, 245);
    border: 1px solid rgb(217, 217, 217);
}
.panel-google-plus > .panel-body > .panel-google-plus-image > img {
    max-width: 100%;
}

.panel-google-plus > .panel-footer {
    font-size: 14px;
    font-weight: 700;
    min-height: 54px;
}
.panel-google-plus > .panel-footer > .btn {
    float: left;
    margin-right: 8px;
}
.panel-google-plus > .panel-footer > .input-placeholder {
    display: block;
    /*margin-left: 98px;*/
    margin-left: 123px;
    color: rgb(153, 153, 153);
    font-size: 12px;
    font-weight: 400;
    padding: 8px 6px 7px;
    border: 1px solid rgb(217, 217, 217);
    border-radius: 2px;
    box-shadow: rgba(0, 0, 0, 0.0470588) 0px 1px 0px 0px;
}
.panel-google-plus.panel-google-plus-show-comment > .panel-footer > .input-placeholder {
    display: none;   
}
.panel-google-plus > .panel-google-plus-comment {
    display: none;
    padding: 10px 20px 15px 15px;
    border-top: 1px solid rgb(229, 229, 229);
    background-color: rgb(245, 245, 245);
}
.panel-google-plus.panel-google-plus-show-comment > .panel-google-plus-comment {
    display: block;
}
/*.panel-google-plus > .panel-google-plus-comment > img {
    float: left;   
}*/
.panel-google-plus > .panel-google-plus-comment > .panel-google-plus-textarea {
    float: right;
    width: calc(100% - 56px);
}
.panel-google-plus > .panel-google-plus-comment > .panel-google-plus-textarea > textarea {
    display: block;
    /*margin-left: 60px;
    width: calc(100% - 56px);*/
    width: 100%;
    background-color: rgb(255, 255, 255);
    border: 1px solid rgb(217, 217, 217);
    box-shadow: rgba(0, 0, 0, 0.0470588) 0px 1px 0px 0px;
    resize: vertical;
}
.panel-google-plus > .panel-google-plus-comment > .panel-google-plus-textarea > .btn {
    margin-top: 10px;
    margin-right: 8px;
    width: 100%;
}
@media (min-width: 992px) {
    .panel-google-plus > .panel-google-plus-comment > .panel-google-plus-textarea > .btn {
        width: auto;
    }    
}


.panel-google-plus .btn {
    border-radius: 3px;   
}
.panel-google-plus .btn-default {
    border: 1px solid rgb(217, 217, 217);
    box-shadow: rgba(0, 0, 0, 0.0470588) 0px 1px 0px 0px;
}
.panel-google-plus .btn-default:hover, 
.panel-google-plus .btn-default:focus, 
.panel-google-plus .btn-default:active {
    background-color: rgb(255, 255, 255);
    border-color: rgb(0, 0, 0);    
}

td:nth-child(1) {  
  /* your stuff here */
  font-weight: bold;
}
td:nth-child(2) {  
  /* your stuff here */
  padding-left: 6px;
}
</style>
<body>
<body>
<jsp:include page="forum-header.jsp" />
<br />
	<br />
	<br />
	<br />
	<br />
	
	<p id="user_id" style="display:none;">
		<% 
			if(currentUser == null){ %>				
				0
			<%}else{ %>
				<%= currentUser.getId() %>
		<%}%>
	</p>
	<p id="topic_id" style="display:none;"><%= topicId %></p>
	<div class="container">
		<div class="row">
			 <div class="page-header">
				<h1>"<%= manager.getTopicByCategoryidAndUserIdAndId(topicId).getSubject() %>"<span class="pull-right label label-default">:)</span></h1>
				<small>- <%= manager.getUserById(manager.getTopicByCategoryidAndUserIdAndId(topicId).getUserId()).getFirstName() %> <%= manager.getUserById(manager.getTopicByCategoryidAndUserIdAndId(topicId).getUserId()).getLastName() %></small>
			</div>
			<div class="panel panel-default widget">
				<div class="panel-heading">
					<span class="glyphicon glyphicon-comment"></span>
					<h3 class="panel-title">
						Recent Comments</h3>
					<span class="label label-info">
						10</span>
				</div>
				<div class="panel-body">
					<ul class="list-group" id="button-text-submit">
						<%int ctr = 0; for(Post post : manager.getAllPostByTopicId(topicId)){ ctr += 1; %>
						<li class="list-group-item">
							<div class="row">
								<div class="col-sm-12">
									<div class="[ panel panel-default ] panel-google-plus">
										<div class="dropdown">
											<span class="dropdown-toggle" type="button" data-toggle="dropdown">
												<span class="[ glyphicon glyphicon-chevron-down ]"></span>
											</span>
											<ul class="dropdown-menu" role="menu">
												<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Report</a></li>
												<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Favorite</a></li>
												<li role="presentation" class="divider"></li>
											</ul>
										</div>
										<div class="panel-google-plus-tags">
											<ul>
												
											</ul>
										</div>
										<div class="panel-heading" style="background:white;">
											<img class="[ img-circle pull-left ]" src="https://lh3.googleusercontent.com/uFp_tsTJboUY7kue5XAsGA=s46" alt="Mouse0270" />
											<h3><%= manager.getUserById(post.getUserId()).getFirstName() %> <%= manager.getUserById(post.getUserId()).getLastName() %></h3>
											
											<h5><span><%= new DateUtil().getDateAndTimeAsString(post.getDate()) %></span></h5>
										</div>
										<div class="panel-body">
										<div class="col-sm-12">
											<p>
												<%= post.getContent() %>
											</p>
										</div>
										 
										</div>
										<div class="panel-footer">
											<button type="button" class="[ btn btn-default ]">
												# <%= post.getContentNo()%>
											</button>
											<button type="button" class="[ btn btn-default ]">
												<i class="fa fa-pencil-square-o"></i>
											</button>
											<div class="input-placeholder">Reply</div>
										
										</div>
										<div class="panel-google-plus-comment">
											<img class="img-circle" src="https://lh3.googleusercontent.com/uFp_tsTJboUY7kue5XAsGA=s46" alt="User Image" />
											<div class="panel-google-plus-textarea">
												<textarea rows="4" id="name-<%= ctr %>"></textarea>
												<button type="submit" class="[ btn btn-success ]" id="post-comment" name="<%= ctr %>">Post comment</button>
												<button type="reset" class="[ btn btn-default ]">Cancel</button>
											</div>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
								
							</div>
						</li>
						<%} %>
					</ul>
					<a href="#" class="btn btn-primary btn-sm btn-block" role="button"><span class="glyphicon glyphicon-refresh"></span> More</a>
				</div>
			</div>
		</div>
	</div>
<script>
$(function () {
   $('.panel-google-plus > .panel-footer > .input-placeholder, .panel-google-plus > .panel-google-plus-comment > .panel-google-plus-textarea > button[type="reset"]').on('click', function(event) {
        var $panel = $(this).closest('.panel-google-plus');
            $comment = $panel.find('.panel-google-plus-comment');
            
        $comment.find('.btn:first-child').addClass('disabled');
        $comment.find('textarea').val('');
        
        $panel.toggleClass('panel-google-plus-show-comment');
        
        if ($panel.hasClass('panel-google-plus-show-comment')) {
            $comment.find('textarea').focus();
        }
   });
   $('.panel-google-plus-comment > .panel-google-plus-textarea > textarea').on('keyup', function(event) {
        var $comment = $(this).closest('.panel-google-plus-comment');
        
        $comment.find('button[type="submit"]').addClass('disabled');
        if ($(this).val().length >= 1) {
            $comment.find('button[type="submit"]').removeClass('disabled');
        }
   });
});

$("#button-text-submit #post-comment").click(function(){
	var topicId = $("#topic_id").html();
	var userId = $("#user_id").html();
	var content = $("#name-" + $(this).attr("name")).val()
	
	if(userId != 0){
		if(content)
			window.location.href = "/FinalWK/forum/post/add?topic_id="+ topicId +"&user_id=" + userId  + "&content=" + content;
		else
			alert("Empty not accepted.");
	}else {
		alert("Please sign in to write a answer.");
	}
});
</script>
</body>
</html>
