package Demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/InsertServelet1")
public class InsertServelet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public InsertServelet1() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		String password=request.getParameter("paswd");

		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cusine", "root", "");
			 PreparedStatement pst = con.prepareStatement("Select * from sign where name=? and password=?");
		     pst.setString(1, name);
		     pst.setString(2, password);
		   ResultSet rs = pst.executeQuery();                        
		     if(rs.next()) {         

          HttpSession session = request.getSession(true);
		            session.setAttribute("name", name);
		            
		            Cookie userName = new Cookie("name", name);
					userName.setMaxAge(30*60);
					response.addCookie(userName);
		             response.sendRedirect("index.jsp");
		                        
		                 
		               
		     
		     }
		     else
		     {
		    	 response.sendRedirect("Error.jsp");
		     }          
		}
		catch(Exception e){       
		    out.println("Something went wrong !! Please try again");       
		}      
			
	}

}
