package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao_package.RegisterDao;
import entities.User;
import helper_class.FactoryProvider;

/**
 * Servlet implementation class EditAddressServlet
 */
public class EditAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
//get session object	
	HttpSession session=	request.getSession();

//get current user object	
		User user=(User)session.getAttribute("current_user");

		if(user==null)
		{
			session.setAttribute("message","you are not login");
			response.sendRedirect("login.jsp");
			return;
		}

		
		String Edit_Address=request.getParameter("EditAddress");
		
// create RegisterDao object
		RegisterDao rdao=new RegisterDao(FactoryProvider.getFactory());
		int id=rdao.updateAddress(Edit_Address, user.getUserId());
		session.setAttribute("message","Your address is updated");
		response.sendRedirect("DeliveryAddress.jsp");
	}

}
