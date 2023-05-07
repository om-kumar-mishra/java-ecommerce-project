<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="dao_package.CartDao" %>
 <%@page import="java.util.*" %>
 <%@page import="entities.Product" %>
<%@page import="helper_class.FactoryProvider" %>
<%@page import="helper_class.ReturnDescription" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Cart</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body class="bg-light">
<%@include file="components/navbar.jsp" %>
<%@include file="components/message.jsp" %>

<%

//variable for total price and total product
int totalPrice=0 , totalProduct=0;

List<Product> product;
User user=(User)session.getAttribute("current_user");
CartDao cartDao=new CartDao(FactoryProvider.getFactory());
if(user==null)
{
	session.setAttribute("message","you are not loged");
	response.sendRedirect("login.jsp");
	return;
}
else
{
 product=cartDao.getProductUserById(user.getUserId());
}
%>




<div class="row">
 
<!-- first column -->
  <div class="col-md-8 mt-4 ml-2">
   <div class="row ">
   
     <div class="col-md-12 d-felx justify-content-around">
      <div class="card-columns">
      
      
      
     <!-- print product -->
   <%     		
  for(Product p:product)
{
  %>
  <!-- Card Body -->
  <a style="text-decoration:none; color:black;" href="ShowSingleProduct.jsp?pid=<%=p.getpId()%>">
<div class="card border-solid mx-2"  >
  <div class="row">
  
  <!--card  first column -->
       <div class="col-md-4 mt-2 pl-2 ">
         <img src="image/Product/<%=p.getpPhoto() %>"  style="height:150px; width:130px;" class=" px-3 card-img-top " >
       </div>
  
  <!-- card second column -->
  
     <div class="col-md-8">
     
 <!-- card body -->
     
          <div class="card-body">
            <h5 class="card-title"><%=p.getpName()%></h5>
              <p class="card-text"> <%=ReturnDescription.get10Word(p.getpDesc()) %></p>        
           </div> 
             
           <!-- end card body -->  
              
       </div>   
 </div>
 </a>
  <!-- card footer -->
 
        <div class="card-footer text-center " >
            <a href="#" class="btn btn-success  " >&#8377;<%=p.getProductDiscount()%></a>
            
          
           <!-- delete button -->
       
            <a href="CartProductDeleteServlet?productIdForDelete=<%=p.getpId() %>" class="btn btn-primary ">Delete</a>
           
         </div>
</div>
 

  <%
  totalProduct=totalProduct+1;
  
  totalPrice=totalPrice+p.getProductDiscount();
 
  
     }
  %>
    
    
             </div>
          </div>
        </div>
      </div>
  
<!-- second column -->
  <div class="col-md-3 mt-4">
    <div class="container">
      <p class="text-success weight-bold">Your order is eligible for FREE Delivery. Select this option at checkout. Details</p>
    
      <h2>Total Price(<%=totalProduct %> Item):<span style="height:5px;"> &#8377;</span><%=totalPrice %></h2>
      <a href="DeliveryAddress.jsp" class="btn btn-warning mt-5 d-block">Proceed To Buy</a>
    </div>
  </div>
</div>

</body>
</html>