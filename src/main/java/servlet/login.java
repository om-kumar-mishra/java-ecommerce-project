package servlet;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao_package.UserDao;
import entities.User;
import helper_class.FactoryProvider;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
	   String password=request.getParameter("password");
	   UserDao dao=new UserDao(FactoryProvider.getFactory());
	 User user= dao.validEmailAndPasssword(email,password);
	HttpSession session= request.getSession();
	
	PrintWriter out=response.getWriter();
	if(user==null)
	{
		session.setAttribute("message", "Invalid user try again");
		response.sendRedirect("login.jsp");
		return;
	}
	else
	{
		out.println("<h1>Welcome"+user.getUserName()+"</h1>");
	}
	
	session.setAttribute("current_user", user);
		//Admin
		if(user.getUserType().equals("admin"))
		{
			
			response.sendRedirect("admin.jsp");
		}
		else if(user.getUserType().equals("normal"))
		{
		//normal user
			
			response.sendRedirect("index.jsp");
		}
		else
		{
			out.println("we have not identified user type");
		}
			
	}
	
		
	
	}


