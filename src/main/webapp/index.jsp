<%@page import="helper_class.ReturnDescription"%>
<%@page import="helper_class.FactoryProvider"%>
<%@page import="dao_package.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>online shop</title>
<%@include file="components/common_css_js.jsp" %>

<style type="text/css">

body
{
background-image:url("image/online-shop.jpg");
background-repeat:no-repeat;
background-size:cover;
}

</style>
</head>
<body>



<%@include file="components/navbar.jsp" %>
<%@include file="components/message.jsp" %>


<div class="row mx-2">

<%
User user=(User)session.getAttribute("current_user");

String c_id= request.getParameter("category");

ProductDao pdao=new ProductDao(FactoryProvider.getFactory());

List<Product> product=null;
if(c_id==null||c_id.trim().equals("all"))
{
	product=pdao.getAllProduct();
}
else
{
	int id=Integer.parseInt(c_id.trim());
	product=pdao.getAllProductById(id);
}
CategoryDao cdao=new  CategoryDao(FactoryProvider.getFactory());
List<Category> category=cdao.getAllCategory();


%>

     <div class="col-md-2 mt-4">
       <div class="list-group">
         <a href="index.jsp?category=all" class="list-group-item list-group-item-actiom  text-white custom-bg" aria-current="true">Add all</a>
         
         
        
         <%
            for(Category c:category)
            {
         %>
             
          <a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle() %></a>
        
         <%
            }         
         %>
         </div>
     </div>
        <div class="col-md-10">
            <div class="row mt-4 ">
               <div class="col-md-12">
               
                 <div class="card-columns">
                    <!-- traversing product -->
                      <%
                          for(Product p:product)
                          {
                      %>
                      <!-- link to ShowSingleProduct.jsp -->
                       <a style="text-decoration:none; color:black;" href="ShowSingleProduct.jsp?pid=<%=p.getpId()%>">
                       
                       
                       
                    <div class="card product-card">
                   
                      <div class="container text-center">
                       <img style="max-height:270px;  max-width:100%; width:auto;" class="card-img-top pt-2" src="image/Product/<%=p.getpPhoto() %>" alt="...">
                      </div>
                     
                        <div class="card-body">
                          <h4 class="card-title"><%=p.getpName() %></h4>
                          <p class="card-text">
                           <%=ReturnDescription.get10Word(p.getpDesc()) %>
                          </p>
                       
                        </div>
                        
                        
                        
                        </a>
                        
                          <div class="card-footer text-center">
                            <a href="CartServlet?productId=<%=p.getpId()%>"  class="btn btn-primary">Add to cart</a>
                           <button class="btn btn-outline-success ">&#8377;<%=p.getProductDiscount()%>  <span class="discount_label"><span class="price"><%=p.getpPrice()%></span>\-   off <%=p.getpDiscount()%>%</span> </button>
                          </div>
                      
                      </div>

                      
                      <%
                      
                          }
                      if(product.size()==0)
                      {
                    	  
                      %>
                      <h1 class="text-white">this product is out of stock</h1>
                      <%
                      }
                      %>
                 </div>
               </div>
            </div> 
          </div>
           
 </div>

</body>
</html>
