<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="/FinalWK/image/upload" method="post" enctype="multipart/form-data" name="form1">
			Product Code : <input type="text" />
			Product Name : <input type="text" />
			Price : <input type="text" />
			<input type="file" name="file"/>
			<input type="submit" />
		</form>
	</div>

</body>
</html>