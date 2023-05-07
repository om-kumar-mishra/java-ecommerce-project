<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="entities.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Method</title>
<%@include file="components/common_css_js.jsp" %>
<style type="text/css">



label
{
cursor:pointer;
display:block;
}

input 
{
float:left;
margin-top:25px;
margin-left:10px;
height:20px;
}

h5
{
float:left;
margin-top:20px;
margin-left:10px;
}

label div
{
height:100px;
}

</style>
</head>
<body class="bg-secondary  mt-5">


<% 
User user=(User)session.getAttribute("current_user");

if(user==null)
{
	session.setAttribute("message","you are not login");
	response.sendRedirect("login.jsp");
	return;
}

%>





  <div class="container px-5" style="height:600px; width:600px;">
    <h1>Select a payment method</h1>
      
     <label for="UPI" class="d-block">
       <div class="bg-white rounded border"> 
        <input type="radio" id="UPI" name="options" class="btn btn-primary active"  ><h5>other UPI Apps</h5>
       </div>
      </label> 
      
      <label for="Net Banking">
        <div class="bg-white rounded border ">
        <input type="radio" id="Net Banking" name="options" class="btn btn-primary active"><h5>Net Banking</h5>   
       </div>
      </label>
                                     
      <label for="Add Debit">  
       <div class="bg-white rounded border">
        <input type="radio"  id="Add Debit" name="options" class="btn  active "><h5>Add Debit/Credit/ATM Card</h5>
        </label>
        <br>
        <p style="padding-top:10px; padding-left:0px; ">you can save your cards as per new RBI guidelines.<span class="text-success">Learn More</span></p>
       </div>
      
       
       <label for="EMI">
        <div class="bg-white rounded border mt-2">
        <input type="radio" id="EMI" name="options" class="btn btn-primary active "><h5>EMI</h5>
       </div>
      </label>
      
       <label for="Pay on Delivery">
        <div class="bg-white rounded border">
        <input type="radio" id="Pay on Delivery" name="options" class="btn btn-primary active "><h5>Pay on Delivery</h5>
       </div>
      </label> 
      
        <a href="#"  class="btn btn-warning d-block mt-5">Continue</a>
</div>
</body>
</html>