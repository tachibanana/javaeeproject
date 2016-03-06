<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Wear Kapampangan</a>
    </div>
    <ul class="nav navbar-nav">
      
	  		<li class="dropdown">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">T-shirt<!-- <span class="caret"></span> --></a>
			  <ul class="dropdown-menu">
				<li><a href="item-list.jsp">List</a></li>
				<li><a href="item-add.jsp?action=add">Add</a></li>
				<li><a href="item-info.jsp?productCode=RX4519">Search</a></li>
				<li><a href="inventory-list.jsp">Inventory</a></li>
			  </ul>
			  </li>
			  <li class="dropdown">
			   <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Color<!-- <span class="caret">--></span></a>
			  <ul class="dropdown-menu">
				<li><a href="color-list.jsp">List</a></li>
				<li><a href="color-add.jsp">Add</a></li>
			  </ul>
			  </li>
			  <li class="dropdown">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Size<!-- <span class="caret"> --></span></a>
			  <ul class="dropdown-menu">
				<li><a href="size-list.jsp">List</a></li>
				<li><a href="size-add.jsp">Add</a></li>
			  </ul>
			  </li>
			  <li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">User<!-- <span class="caret"> --></span></a>
			  <ul class="dropdown-menu">
				<li><a href="user-list.jsp">List</a></li>
			  </ul>
			</li>
			 <li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" id="order-noti">Order</a>
			  <ul class="dropdown-menu">
				<li><a href="order-list-admin.jsp">List</a></li>
			  </ul>
			</li>
			
  
    </ul>
	<ul class="nav navbar-nav navbar-right">
      <li><a href="/FinalWK/admin/invalidate"><span class="glyphicon glyphicon-log-out"></span> Log-out</a></li>
    </ul>
  </div>
</nav>
<script>
	var flag = true;
	$(document).ready(function(){
		process();
	});
	var xmlHttp = ceateXmlHttpRequestObject();
	
	function ceateXmlHttpRequestObject(){
		
		var xmlHttp;
		if(window.XMLHttpRequest){
			xmlHttp = new XMLHttpRequest();
		}else{
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		return xmlHttp;
	}
	
	function process(){
		
		if(xmlHttp && flag){
			try{
				xmlHttp.open("GET" , "/FinalWK/notification/counter" , true);
				xmlHttp.onreadystatechange = handleServerResponse;
				xmlHttp.send(null); 

				
			}catch(e){
				alert(e.toString());
			}
		}
	}
	
	function handleServerResponse(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
		
			document.getElementById("order-noti").innerHTML = xmlHttp.responseText;
			setTimeout("process()" , 3000);
		}else{
			setTimeout("process()" , 30000);
		}
	}

	$('body').unload(function(){
		
		flag = false;
	});
</script>