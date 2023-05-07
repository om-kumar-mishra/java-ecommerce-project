package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao_package.CartDao;
import dao_package.ProductDao;
import entities.Cart;
import entities.Product;
import helper_class.FactoryProvider;

/**
 * Servlet implementation class CartProductDeleteServlet
 */
public class CartProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartProductDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
// delete 
		
//get session 
		HttpSession  session=request.getSession();
		
//get CartDao object
		CartDao cartdao=new CartDao(FactoryProvider.getFactory());
		
		
//delete product from Cart
		int deleteForProductId=Integer.parseInt(request.getParameter("productIdForDelete"));
		
//get single product from ProductDao
		ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
	    Product product=pdao.getSingleProduct(deleteForProductId);
	    
				
		 int deletedId=cartdao.productDelete(deleteForProductId);
	
		 session.setAttribute("message","your product is successfully deleted in your cart :- "+ product.getpName());
		response.sendRedirect("Cart.jsp");
		return;
			 
	}

}
