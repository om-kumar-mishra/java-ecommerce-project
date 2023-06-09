<%@page import="entities.*" %>
<%@page import="dao_package.CartDao" %>
<%@page import="java.util.List" %>
<%@page import="helper_class.FactoryProvider"%>
 <%
   User user1= (User)session.getAttribute("current_user");
   
    
    %>
 <%@include file="common_css_js.jsp"%>
  
<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
<div class="container">
  <a class="navbar-brand" href="#">Mycart</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Category
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      
    </ul>
    
   
    
  <ul  class="navbar-nav ml-auto" >
  
  <%
  if(user1==null)
  {
	  %>
	  
	   <li class="nav-item active">
        <a class="nav-link" href="login.jsp">Login</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="Register.jsp">Register</a>
      </li>
      
	  <% 
  }
  else
  {
	  CartDao cardDao=new CartDao(FactoryProvider.getFactory());
List<Product>	  product=cardDao.getProductUserById(user1.getUserId());
	 %>
	 <li class="nav-item active">
        <a class="nav-link"  href="Cart.jsp"><i style="text-size:100%;"  class="fas fa-cart-plus" ></i>(<%=product.size() %>)</a>
      </li>
       <!-- show admin or normal page on nav -->
      <%
      if(user1.getUserType().equals("admin"))
      {
      %>
     <li class="nav-item active">
        <a class="nav-link" href="admin.jsp">Admin</a>
      </li>
      
     <%
      }
      else
      {
     %>
      <li class="nav-item active">
        <a class="nav-link" href="normal.jsp">User</a>
      </li>
     
    	<%
       }
    	%>
	  <li class="nav-item active">
        <a class="nav-link" href="#1"><%=user1.getUserName() %></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="LogoutServlet">Logout</a>
      </li>
   <%
  }
   %>
 
  </ul>
    
  </div>


</div>
</nav>