package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao_package.CartDao;
import dao_package.ProductDao;
import entities.Cart;
import entities.Product;
import entities.User;
import helper_class.FactoryProvider;

/**
 * Servlet implementation class Cart
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
		//get data
		int p_id=Integer.parseInt(request.getParameter("productId"));
//get user login object
		
		HttpSession session=request.getSession();
		
		User user=(User)session.getAttribute("current_user");
		

		if(user==null)
		{
			session.setAttribute("message", "you are not login you go first login");
		    response.sendRedirect("login.jsp");
		    return;
		}
		
		ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
	    Product p=	pdao.getSingleProduct(p_id);
	   
//object of cart	    
	    Cart cart=new Cart();
	    

	    
//set data in cart entity class
	    
	    cart.setUserId(user.getUserId());
	    cart.setProduct(p);
	    
	    CartDao cartdao=new CartDao(FactoryProvider.getFactory());
	   int id= cartdao.saveCart(cart);
	   
	   session.setAttribute("message","your cart is added successful ");
	   response.sendRedirect("index.jsp");
	   

	}

}
