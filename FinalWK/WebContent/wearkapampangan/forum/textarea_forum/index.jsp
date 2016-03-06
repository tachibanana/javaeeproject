<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="com.wear.kapampangan.project.library.Category" %>
<%@ page import="com.wear.kapampangan.project.library.User" %>
<%@ page import="com.wear.kapampangan.project.library.Topic" %>
<%@ page import="com.wear.kapampangan.project.util.DateUtil" %>
<%! String userId = null; %>
<%! String categoryId = null; %>

<%  userId = request.getParameter("user_id");%>
<% categoryId = request.getParameter("category_id"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">

<title>Compose Thread</title>


<link rel="stylesheet" type="text/css" href="lib/css/bootstrap.min.css"></link>
<link rel="stylesheet" type="text/css" href="lib/css/prettify.css"></link>
<link rel="stylesheet" type="text/css" href="src/bootstrap-wysihtml5.css"></link>

<style type="text/css" media="screen">
	.btn.jumbo {
		font-size: 20px;
		font-weight: normal;
		padding: 14px 24px;
		margin-right: 10px;
		-webkit-border-radius: 6px;
		-moz-border-radius: 6px;
		border-radius: 6px;
	}
</style>

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-30181385-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</head>
<body>
<p id="user_id" style="display:none;"><%= userId %></p>
<p id="category_id" style="display:none;"><%= categoryId %></p>
<div class="container">

	<div class="hero-unit" style="margin-top:40px">
		<h1 style="font-size:58px">Create Thread</h1>
		<h1><small>Wear-Kapampangan Community</small></h1>
		<hr/>
		<div class="input-group">
			<span class="input-group-addon"><h5>Subject/Title:</h5> &nbsp </span>
            <input id="apikey1" name="apikey" class="form-control" placeholder="Subject/Titles" type="text">
        </div>
		<div class="input-group">
			<span class="input-group-addon"><h5>Tags:</h5> &nbsp </span>
            <input id="apikey2" name="apikey" class="form-control" placeholder="Separate #tags with comma" type="text">
        </div>
		<textarea id="apikey3" class="textarea" placeholder="Enter text ..." style="width: 810px; height: 200px"></textarea>
		<ul class="pager">
		  <li><a id="cancel">Cancel</a></li>
		  <li><a id="submit">Submit</a></li>
		</ul>
	</div>
	

</div>

<!-- 
<script src="lib/js/wysihtml5-0.3.0.js"></script>
--><script src="lib/js/jquery-1.7.2.min.js"></script>
<!--<script src="lib/js/prettify.js"></script>
<script src="lib/js/bootstrap.min.js"></script>
<script src="src/bootstrap-wysihtml5.js"></script>
-->

<script>
	$('.textarea').wysihtml5();
</script>

<script type="text/javascript" charset="utf-8">
	$(prettyPrint);
</script>
<script>
	$("#submit").click(function(){
		var subject = $("#apikey1").val();
		var tags = $("#apikey2").val();
		var content = $("#apikey3").val();
		var userId = $("#user_id").html();
		var categoryId = $("#category_id").html();
		window.location.href="/FinalWK/forum/topic/create?category_id="+ categoryId +"&user_id="+ userId +"&subject="+ subject  +"&tags= "+ tags +"&content=" + content;
	});
	
	$("#cancel").click(function(){
		window.history.back() + location.reload();
	});
</script>

</body>
</html>
