<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login here</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body  class="loginbackground">
<%@include file="components/navbar.jsp" %>
<div class="container">
  <div class="row">
   <div class="col-md-4 offset-md-4">
    <div class="card  mt-5">
    
      
      
        <div class="card-header custom-bg">
          <h1 style="text-align:center;">Login </h1>
         </div>
         <div class="loginform">
     <div class="card-body">
     <%@include file="components/message.jsp" %>
   <form action="login"   method="post">
     
      <div class="form-group">
        <label for="exampleInputEmail1">Email address</label>
         <input name="email" type="email" class="form-control " id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
     </div>
        
        <div class="form-group">
          <label for="exampleInputPassword1">Password</label>
          <input name="password" type="password" class="form-control"  id="exampleInputPassword1" placeholder="Password">
       </div>
       
         <a href="Register.jsp" class="text-center d-block m-2">if not register click here</a>
         <div class="container  text-center">
        <button type="submit" class="btn btn-primary ">Submit</button>
      <button type="reset" class="btn btn-warning ">Reset</button>
     </div>
   
           </form>
     </div>

         </div>
      </div>
      </div>
   </div>
 </div>
</body>
</html>