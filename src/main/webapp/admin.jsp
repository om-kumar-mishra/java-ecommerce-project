<%@page import="entities.User" %>
<%@page import="entities.Category" %>
<%@page import="dao_package.*" %> 

<%@page import="helper_class.FactoryProvider" %>
<%@page import="java.util.*" %>

<%

User currentUser=(User)session.getAttribute("current_user");
Category ctg=new Category();

//get all object of category

    CategoryDao catdao=new  CategoryDao(FactoryProvider.getFactory());
   List<Category> list=catdao.getAllCategory();

//get all object of product 
     ProductDao p_dao=new ProductDao(FactoryProvider.getFactory());
      List<Product> product1=p_dao.getAllProduct();
  
  
//get all object of User
    RegisterDao rdao=new RegisterDao(FactoryProvider.getFactory());
    List<User> user=rdao.getAllUser();

  
if(currentUser==null)
{
	session.setAttribute("message","you are not logged in login first");
	response.sendRedirect("login.jsp");
	return;
}
else
{
	if(currentUser.getUserType().equals("normal"))
	{
	   request.setAttribute("message", "You are not admin");
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
<title>Admin page</title>
<%@include file="components/common_css_js.jsp" %>
<link rel="stylesheet" href="css/admin.css">
</head>
<body class="bg-secondary">
<%@include file="components/navbar.jsp" %>
<%@include file="components/message.jsp" %>
<div class="container">
     <div class="row mt-5">
       <!-- first card-->
         <div class="col-md-4">
            <div class="card">

              <div class="card-body text-center">
                 <div class="container image-rounded">
                  <img  src="image/user.png">
                   </div>
                     <h1 >User</h1>
                      <h2  ><%=user.size() %></h2>
                   </div>


               </div>
         </div>
  <!-- second card-->
        <div class="col-md-4">
          <div class="card">

            <div class="card-body text-center">
               <div class="container image-rounded" >
                 <img  src="image/category.png">
                  </div>
                   <h1>Categories</h1>
                    <h2 ><%=list.size() %></h2>
                   </div>

                  </div>
              </div>
         <!-- third card-->
   <div class="col-md-4">
     <div class="card">

       <div class="card-body text-center">
         <div class="container image-rounded">
            <img  src="image/product.png">
             </div>
              <h1 >Products</h1>
               <h2 ><%=product1.size() %></h2>
           </div>
         </div>  
     </div>

   </div>
</div>
<div class="container">
     <div class="row mt-5 mb-5">
         <div class="col-md-6">
              <div class="card" data-toggle="modal" data-target="#add-category-modal" >
                  <div class="card-body text-center">
                     <div class="container image-rounded">
                       <img alt="categroy" src="image/add_category.png" >
                      </div>    
                    <h1>ADD  CATEGORY</h1>
                  </div>
              </div>
         
         </div>
      
       <div class="col-md-6">
              <div class="card" data-toggle="modal" data-target="#add-products-modal">
                  <div class="card-body text-center">
                 
                      <div class="container ">
                        <img class="image-rounded"  alt="product" src="image/add_product.png">
                       </div>
                    <h1>ADD   PRODUCT</h1>

                  </div>
              </div>
         
         </div>  
     
     </div>
</div>

<!-- modal form -->

<!-- start modal for add category -->

<!-- Modal -->
<div class="modal fade  " id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
      <div class="modal-header  custom-bg ">
      <div class="container text-center">
        <h5 class="modal-title justify-content-center" id="exampleModalLongTitle">ADD CATEGORY</h5>
        </div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">
      
      <!--start action form for category -->
      
    <form action="ProductOperationServlet"  method="post">  
      <div class="form-group">
        <label for="category_name">Category Name</label>
         <input name="category-title" type="text" class="form-control" id="category_name" aria-describedby="emailHelp" placeholder="category title">
     </div>
     
     
        <!--hidden field for Category   --> 
           
        <input type="hidden" name="operation" value="add-category">
        
        <!--hidden field for Category   -->   
        
      <div class="form-group">
          <label for="category_description">Category Description</label>
           <textarea style="height:200px;" name="category_description" class="form-control" id="category_description" placeholder="Entery Category description">
           </textarea>
       </div>
       
       <div class="container text-center">
      <button type="submit" class="btn btn-outline-primary ">Add</button>
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
       </div>
     </form>    
     <!--end action form for category -->
    </div>
        
       
      
    </div>
  </div>
</div>

<!-- end modal for add category -->


<!--start modal for add product  -->

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-products-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg">
      <div class="container text-center">
        <h5 class="modal-title" id="exampleModalLabel">ADD PRODUCT</h5>
        </div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      
      <!-- start form for products -->
      
        <form action="ProductOperationServlet"  method="post"   enctype="multipart/form-data">
        
        <!--hidden field for Category   -->  
        
        <input type="hidden" name="operation" value="add-products"> 
        
        <!--hidden field for Category   -->   
        
        <div class="form-group">
         <input name="product-name" type="text" class="form-control"   placeholder="Enter the product name">
        </div>
        
        
        <div class="form-group">
          <label for="ps">Product Description</label>
           <textarea style="height:200px;" id="ps" name="product-description" class="form-control"  placeholder="Entery Category description">
           </textarea>
       </div>
        
        <div class="form-group">
         <input name="product-price" type="number" class="form-control"   placeholder="Enter price of product">
        </div>
        
        <div class="form-group">
         <input name="product-discount" type="number" class="form-control"   placeholder="Enter discount of product">
        </div>
        
        <div class="form-group">
         <input name="product-quantity" type="number" class="form-control"   placeholder="Enter quantity of product">
        </div>
        
        <div class="form-group">
            <label for="category-id">Select product category</label>

              <select style="width:200px; height:35px;" id="category-id" name="category_id">
              <%
           
              
            		for(Category cat:list)
            		{
                %>
                
                <option value="<%= cat.getCategoryId() %>"> <%=cat.getCategoryTitle() %> </option>
                
                 <%
            		}
                 %>               
              </select>
        </div>
        
        <label for="submit1">Update image</label>
        <div class="form-group">
         <input  name="product_photo" type="file" id="submit1" class="form-control">
        </div>
         <div class="container text-center">
        <button type="button" class="btn btn-secondary text-center" data-dismiss="modal">close</button>
        <button type="submit" class="btn btn-primary">submit</button>
         </div>
        </form>
        
        <!-- end form for products -->
        
        
      </div>
      
    </div>
  </div>
</div>


<!-- end modal for add product -->
</body>
</html>