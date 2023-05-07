<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%

String message=(String)session.getAttribute("message");
if(message!=null)
{
	
	%>
	<div class="alert alert-success mb-none" role="alert">
  <%= message %>
</div>
	<% 
	session.removeAttribute("message");
}

%>


</body>
</html>