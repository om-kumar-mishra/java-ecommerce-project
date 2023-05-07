package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao_package.CategoryDao;
import dao_package.ProductDao;
import entities.Category;
import entities.Product;
import helper_class.FactoryProvider;

/**
 * Servlet implementation class ProductOperationServlet
 */
@MultipartConfig(
        fileSizeThreshold   = 1024 * 1024 * 1,  // 1 MB
        maxFileSize         = 1024 * 1024 * 10, // 10 MB
        maxRequestSize      = 1024 * 1024 * 15 // 15 MB
     )
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int id;
	private Category c_title;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String operation=request.getParameter("operation");
		//dao object;
		
	PrintWriter out=	response.getWriter();
		
//add category
	
		
		if(operation.trim().equals("add-category"))
		{

//fetch data from field
			String category_title=request.getParameter("category-title");
			String category_description=request.getParameter("category_description");

//object of dao
			CategoryDao   catdao=null;
	       catdao=new  CategoryDao(FactoryProvider.getFactory());
	       
 //object of Category
			Category   cat=new  Category();
			

//http session object		  
			HttpSession https=request.getSession();

			     
			System.out.println("length of description ="+category_description.length());
			
//if cross rang of description		
			 if(category_description.length()>3000)
			{
				https.setAttribute("message","your description is out of range please write short description try again");
				
				response.sendRedirect("admin.jsp");
			}
			 else
			 {
				 
				
				 cat.setCategoryDescription(category_description);
				 
			 }
			 
			 
//if title is null
			//method of get	tile		
			 String title=null;
			  
				title= catdao.getCTitle(category_title);	
			 if(title.equals("not exist"))
			 {
				 cat.setCategoryTitle(category_title);
			 }
			 else
			 {
				 https.setAttribute("message","this category is already exist");
			 response.sendRedirect("admin.jsp");
			 return	;
			 }
			  
			//object of dao for save data
					 
		int id=	 catdao.addCategory(cat);  
				 
				 
				 https.setAttribute("message","add category successfully ="+id);
				 response.sendRedirect("admin.jsp");
						 
				 



			  
			

		 

		 

		
	
//add product
		}		
		else if(operation.trim().equals("add-products"))
		{
			String product_name=request.getParameter("product-name");
			String product_description=request.getParameter("product-description");
			int product_price=Integer.parseInt(request.getParameter("product-price"));
			int product_discount=Integer.parseInt(request.getParameter("product-discount"));
			int product_quantity=Integer.parseInt(request.getParameter("product-quantity"));
			
//id category id for
			int category_id=Integer.parseInt(request.getParameter("category_id"));
			
			Part part=request.getPart("product_photo");
			
//create object of Product
			Product product=new Product();
			
			product.setpName(product_name);
			product.setpDesc(product_description);
			product.setpPrice(product_price);
			product.setpDiscount(product_discount);
			product.setpQuantity(product_quantity);
			
			
			try
			{
				
//added write image in folder
	  
			ServletConfig  config = getServletConfig();
			String path = config.getInitParameter("path");
			System.out.println(path);
			
			if(part.getSubmittedFileName().endsWith(".jpg") || part.getSubmittedFileName().endsWith("JPG"))
			{
				String folderName="Product";
				File file = new File(path+folderName);
				if(file.isDirectory()!=true)
				{
					file.mkdir();
				}
				String fileName = part.getSubmittedFileName();
				for(Part p : request.getParts())
				{
					p.write(path+folderName+File.separator+fileName);
				}
				product.setpPhoto(fileName);
				
			}
//create object of CategoryDao
			CategoryDao catdao=new CategoryDao(FactoryProvider.getFactory());
		    Category ctg=catdao.getSingleObject(category_id);
		    product.setCategory(ctg);
		   
		    
		    ProductDao productdao=new ProductDao(FactoryProvider.getFactory());
			int id=productdao.saveProduct(product);
			HttpSession https=request.getSession();
			https.setAttribute("message","successful added product ="+id );
			response.sendRedirect("admin.jsp");	
		     }
			catch(Exception e)
			{
				e.printStackTrace();
			System.out.println(e);
				
			}
		
	   }

	}
}
