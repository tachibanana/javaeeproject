<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Category" %>
<%@ page import="com.wear.kapampangan.project.library.User" %>
<%@ page import="com.wear.kapampangan.project.library.Topic" %>
<%@ page import="com.wear.kapampangan.project.util.DateUtil" %>
<%! DBManager manager = null;%>
<%! User currentUser  = null;%>
<% currentUser = (User) request.getSession().getAttribute("currentuser"); %>
<%! int categoryId = 0; %>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>
<% categoryId = (request.getParameter("category_id") != null || request.getParameter("category_id") != "" ? Integer.parseInt(request.getParameter("category_id")) : 0); %>
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
</style>
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
	
	<div class="container">
	<div class="row">
		<div class="col-lg-12">
    <div class="row">




    <div class="panel panel-default">
        <div class="panel-heading">
            <% 
			if(currentUser == null){ %>				
				<th><button type="button" class="btn btn-default pull-right "><a onclick="alert('Please sign in to add a topic.');">Create Thread</a></button></th>
			<%}else{ %>
				<th><button type="button" class="btn btn-default pull-right "><a href="textarea_forum/index.jsp?category_id=<%= categoryId %>&user_id=<%= currentUser.getId()%>">Create Thread</a></button></th>
		<%}%>
			
			<h4><%= manager.getCategoryById(categoryId).getCategoryName() %></h4>
        </div>
        <div class="panel-body">  
			<%for(Topic topic : manager.getAllTopicByCategoryid(categoryId)){ %>
		        
		        <div class="well shadow-z-1" style="background-color: rbga(25 , 255 , 100 , 1);">
            <div class="media">
                <p class="pull-left">
                    <img style="margin-left:15px;"class="[ img-circle pull-left ]" src="https://lh3.googleusercontent.com/uFp_tsTJboUY7kue5XAsGA=s46" alt="Mouse0270" />
                    <br /><b><%= manager.getUserById(topic.getUserId()).getFirstName() %> <%= manager.getUserById(topic.getUserId()).getLastName() %></b>
                </p>
                <div class="media-body">
                    <div class="col-lg-8 padding-left-0">
                        <h4 class="media-heading"><a href="forum-post.jsp?topic_id=<%= topic.getId() %>"><%= topic.getSubject() %></a></h4> 
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
							<li><div id="TrashButton" class="glyphicon glyphicon-trash text-danger" style="cursor:pointer"></div></li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
		<%} %>
       </div><!-- /end panel-body -->
      <div class="panel-footer panel-footer-button">&copy Copyrights 2016</div>
    </div><!-- / end panel-->



    </div>
</div>
	</div>
</div>
<script>
$("#TrashButton").on("click", function () {

    //do something

});
</script>
</body>
</html>