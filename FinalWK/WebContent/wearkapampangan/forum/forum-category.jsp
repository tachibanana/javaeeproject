<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Category" %>

<%! DBManager manager = null;%>
<% manager = (DBManager) request.getServletContext().getAttribute("dbmanager"); %>

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
    padding-top: 20px;
    padding-bottom: 30px;
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

/* Dates */
.agenda .agenda-date { width: 170px; }
.agenda .agenda-date .dayofmonth {
  width: 40px;
  font-size: 36px;
  line-height: 36px;
  float: left;
  text-align: right;
  margin-right: 10px; 
}
.agenda .agenda-date .shortdate {
  font-size: 0.75em; 
}




/* Times */
.agenda .agenda-time { width: 140px; } 


/* Events */
.agenda .agenda-events {  } 
.agenda .agenda-events .agenda-event {  } 

@media (max-width: 767px) {
    
}
thead  {
    background-color: blue;
    color: white;
} 
</style>
<body>	
	<jsp:include page="forum-header.jsp" />
	<br />
	<br />
	<br />
	<br />
	<br />

	<div class="container">
		<div class="row">   
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="span7">   
					<div class="widget stacked widget-table action-table">
								<h2 style="font-family:Tahoma; color:#777777;">Wear-Kapampangan Community</h2>
								<br />		
									<div class="widget-header">
										<i class="icon-th-list"></i>
										
									</div> <!-- /widget-header -->
									
									<div class="widget-content">
										
										<table class="table table-striped table-bordered">
											<tbody>
												<% for(Category category : manager.getAllCategory()){ %>
												<tr>
													<td><h3><i class="<%= category.getIcon() %>"></i> &nbsp;<a href="forum-topic.jsp?category_id=<%= category.getId()%>" class="dotUnder" title="<%= category.getDescription() %>"><%= category.getCategoryName() %></a></h3><small>Discussions : <b><%= manager.getNumberOfAllTopicByCategoryId(category.getId())%></b>  Messages:  <b><%= manager.getNumberOfAllPostByCategoryId(category.getId()) %></b> </small></td>
													<td><br />Last Update : July 9, 2015</td>
												</tr>
												<%} %>
											</tbody>
										</table>
										
									</div> <!-- /widget-content -->
								
					</div> <!-- /widget -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>