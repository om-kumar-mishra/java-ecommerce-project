<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="dao_package.*"%>
   <%@page import="helper_class.FactoryProvider"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>info of product</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body class="bg-light">
<%@include file="components/navbar.jsp" %>
<%
//get product id through url
int id=Integer.parseInt(request.getParameter("pid"));

//
ProductDao p_dao=new ProductDao(FactoryProvider.getFactory());
Product product=p_dao.getSingleProduct(id);

//if pid is null


%>
<div class="row mt-2">
<!-- first column -->
 <div class="col-md-5 ">
  <div class="container">
    <img style="max-height:700px; max-width:700px;" alt="" src="image/Product/<%=product.getpPhoto() %>" >
  </div>
 </div>
 
  <!-- second column -->
  <div class="col-md-6  mr-1">
  
  <h1><%=product.getpName()%></h1>
  
  <h3 class="mt-5">&#8377;<%=product.getpPrice()%>\-</h3>
  
  <h4 mt-3>Discount =&#8377;<%=product.getpDiscount()%>%</h4>
  
  <h4 class-"mt-3 text-success">&#8377;<%=product.getProductDiscount() %>  off  &#8377;<%=product.getpDiscount()%>%</h4>
  
  <h5 class="mt-5"><%=product.getpDesc() %></h5>
  
  <a href="DeliveryAddress.jsp" class="btn btn-warning mt-5 d-block" >Buy Now</a>
  
  </div>
</div>
</body>
</html>