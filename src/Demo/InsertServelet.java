package Demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertServelet")
public class InsertServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public InsertServelet() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String mobnum=request.getParameter("mobnum");
		String password=request.getParameter("paswd");
		
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cusine", "root", "");
			
			Statement stmt=con.createStatement();
			String query ="Insert into sign values(NULL,'"+name+"','"+email+"','"+address+"','"+mobnum+"','"+password+"')";
			int i=stmt.executeUpdate(query);

			if(i==1)
			{
				response.sendRedirect("Login.jsp");
			}
			else
				out.println("data insertion failed");
			
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
