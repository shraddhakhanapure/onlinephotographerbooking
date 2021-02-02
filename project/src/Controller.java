import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try {
//			int id= Integer.parseInt(userid);
			String fname =request.getParameter("fname");
			String lname =request.getParameter("lname");

			String username=request.getParameter("unm");
			String email=request.getParameter("email");
			String pass=request.getParameter("pwd");
			String conpass=request.getParameter("conpass");
			
			//getting all the values from Register.jsp
			
			PhotographerPojo pObject = new PhotographerPojo();
//			pObject.setId(id);
			pObject.setFirst_name(fname);
			pObject.setLast_name(lname);
			pObject.setUsername(username);		//setting up the received values from index.jsp to setters and getters
			pObject.setEmail(email);
			pObject.setPass(pass);
			pObject.setConpass(conpass);
			
			System.out.println("Email is:"+email);
			
			Connection con=Dbconnection.getConnection(); //getting the connection method here from dbconnection
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM photographer.photographerssignup where Email=?");
			ps1.setString(1, email);
			
			System.out.println("Email from setter is:"+pObject.getEmail());
			
			ResultSet rs1=ps1.executeQuery();
		
			if(rs1.next())
			{
				System.out.println("userName:"+rs1.getString(4));
				
				
				out.println("<script type=\"text/javascript\">");
				   out.println("alert('This Email is already registered,  try another one..!');");
				   out.println("location='Register.jsp';");
				   out.println("</script>");
			
				   System.out.println("Email is already present, try another one..!");
			}
			else
			{
			
					if(pass.equals(conpass)){
				
							int checkFlag = SignUpPhotographer.save(pObject); //sending all the values of pojo reference to save method in ServiceLogic
							if(checkFlag!=0){
								out.println("<script type=\"text/javascript\">");
								   out.println("alert('You are Registered Successfully..!');");
								   out.println("location='Login.jsp';");
								   out.println("</script>"); 
								   // if successfully executes save method
			//					request.getRequestDispatcher("Login.jsp").include(request, response);
											}
							else{
								
								out.println("<script type=\"text/javascript\">");
								   out.println("alert('Invalid User Details..!');");
								   out.println("location='Register.jsp';");
								   out.println("</script>");
								   
			//					out.print("<p align='center'>Invalid User Details</p>");
			//					request.getRequestDispatcher("Register.jsp").include(request, response);
			
								}
	
			}
			else{
				
				out.println("<script type=\"text/javascript\">");
				   out.println("alert('password and confirm password doesnt matches..!..!');");
				   out.println("location='Register.jsp';");
				   out.println("</script>");
			
//				   out.print("<p align='center'>password doesnt matches..!</p>");
//				request.getRequestDispatcher("Login.jsp").include(request, response);

				} //if pass and conpass equals

			}		
			
			con.close();
		} catch (Exception e) { // will throw an exception if at all user typed any language constraints.
			out.print("<p align='center'>Please enter Valid Details</p>");
			request.getRequestDispatcher("index.jsp").include(request, response);
		}				
	}

}
