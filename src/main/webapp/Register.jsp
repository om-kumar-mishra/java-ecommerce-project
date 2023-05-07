<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Form</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container-fluid" style="height:50%;">

<div class="row">
<div class="col-md-4 offset-4">

<div  class="card  my-5 ">

<%@include file="components/message.jsp" %>

<div class="card-body px-5">


<form action="RegisterServlet" method="post"  enctype="multipart/form-data">

<h1 class="text-center my-3">Sign up here</h1>
<div class="form-group">
    <label for="name">User Name </label>
    <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name" required="required">
    
  </div>

<div class="form-group">
    <label for="email">User Email </label>
    <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email" required="required">
    
  </div>
  
 <div class="form-group">
    <label for="password">User Password </label>
    <input  name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Password" required="required">
    
  </div>

<div class="form-group">
    <label for="phone">User Phone</label>
    <input name="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Phone" required="required">
    
  </div>
  
  <div class="form-group">
    <label for="file">User Image</label>
    <input name="user_file" type="file" class="form-control" id="file" aria-describedby="emailHelp" placeholder="Enter Phone" >
    
  </div>
  
  
  <div class="form-group">
    <label for="name">User Address </label>
   <textarea name="user_address" style="height:150px;" class="form-control"  placeholder="Enter your Address"></textarea>
    
  </div>
  
  <div class="container text-center">
  <button class="btn btn-success">Register</button>
  <input type="reset" class="btn btn-warning"></button>
  
  </div>
</form>

</div></div>

</div>
</div>
</div>
</body>
</html>