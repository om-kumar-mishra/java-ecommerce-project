<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="entities.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>delivery address</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body class="bg-light">
<%@include file="components/message.jsp" %>
<% 
User user=(User)session.getAttribute("current_user");

if(user==null)
{
	session.setAttribute("message","you are not login");
	response.sendRedirect("login.jsp");
	return;
}

%>
   <div class="container  " style="height:200px; width:600px;">
   
      <h1 class="py-5">Select a delivery address</h1>
      
      <div class="p-5 justify-content-start bg-white border">
        <h3><%=user.getUserName() %></h3>
          <h5><%=user.getUserAddress() %></h5> 
           <h5>Phone : <%=user.getUserPhone() %></h5> 
             <a href="PaymentMethod.jsp" class="btn btn-warning d-block">Deliver to this address</a>
               <a class="btn btn-outline-success d-block mt-4 " data-toggle="modal" data-target="#exampleModal">Edit address</a>
            </div>
       
         </div>
         
         
<!-- start modal  -->
         
         


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-dark">
      <div class="text-center container">
        <h5 class="modal-title text-white " id="exampleModalLabel">Edit Address</h5>
      </div> 
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
        <!-- form body -->
        <form action="EditAddressServlet" method="post">
        
        <div class="form-group">
        <label for="exampleInputEmail1">New Address</label>
         <input name="EditAddress" type="text" class="form-control " id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter new address">
       </div>
            
            <!-- submit button -->
            <div class=" text-center">
            <input type="submit" class="btn btn-primary" value="submit">
            </div>
        </form>
        
      </div>
      
    </div>
  </div>
</div>

<!-- end modal  -->

</body>
</html>