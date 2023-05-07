<%@page import="entities.User" %>

<%
User user=(User)session.getAttribute("current_user");
if(user==null)
{
	session.setAttribute("message","you are not logged in login first");
	response.sendRedirect("login.jsp");
	return;
}
else
{
	if(user.getUserPassword().equals("null")||user.getUserEmail().equals("null"))
	{
	   request.setAttribute("message", "some value is blank");
	   response.sendRedirect("login.jsp");
	   return;
	}
}


%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
out.println("Normal page");
</body>
</html>