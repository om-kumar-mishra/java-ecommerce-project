package servlet;

import java.io.File;
import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import dao_package.RegisterDao;
import entities.User;
import helper_class.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig(
        fileSizeThreshold   = 1024 * 1024 * 1,  // 1 MB
        maxFileSize         = 1024 * 1024 * 10, // 10 MB
        maxRequestSize      = 1024 * 1024 * 15 // 15 MB
     )
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//object of register DAO		
		RegisterDao rdao=new RegisterDao(FactoryProvider.getFactory());
//OBJECT OF SESSION		
		HttpSession httpsession=request.getSession();
//FETCH DATA FROM FORM FIELD		
		String name=request.getParameter("user_name");

		String email=request.getParameter("user_email");		
		String password=request.getParameter("user_password");
		String phone=request.getParameter("user_phone");
		String address=request.getParameter("user_address");
		Part   part=request.getPart("user_file");
		

		
		PrintWriter out=response.getWriter();
		
		try
		{
			
	
	
//create user object

User user=new User();
user.setUserName(name);

// if email same
String message=rdao.getUserEmail(email);
System.out.println(" email message ="+message);
if(message.equals("not exist"))
{
	user.setUserEmail(email);
}
else
{
	httpsession.setAttribute("message","this email is already exist");
	response.sendRedirect("Register.jsp");
	return;
}

user.setUserPassword(password);
user.setUserPhone(phone);
user.setUserAddress(address);
user.setUserType("normal");

//added write image in folder

ServletConfig cfg=getServletConfig();
String image_path=cfg.getInitParameter("path");
out.println(image_path);
String fileName=part.getSubmittedFileName();
if(fileName.endsWith(".jpg")||fileName.endsWith("JPG"))
{
	String folderName=image_path+"user_image";
	
	File file=new File(folderName);
	if(file.isDirectory()!=true)
	{
		file.mkdir();
	}
	
	for(Part parts:request.getParts())
	{
		parts.write(folderName+File.separator+fileName);
	}
	user.setUserPic(fileName);
}

	
int userid=rdao.registerSave(user);
    out.println("Register successful" + userid);
	
	httpsession.setAttribute("message","Registeration successful"+ userid);
	
	response.sendRedirect("Register.jsp");
	
		
		
		
		}
		catch(Exception e )
		{
			e.printStackTrace();
		}
	}

}
