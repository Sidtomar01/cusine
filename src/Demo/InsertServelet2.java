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


@WebServlet("/InsertServelet2")
public class InsertServelet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public InsertServelet2() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		String id=(String)request.getParameter("id");
		String type=(String)request.getParameter("type");
		String money=(String)request.getParameter("money");
		String qualt=(String)request.getParameter("qualt");
		out.println(id);
		out.println(type);
		out.println(money);
		out.println(qualt);
		
	 
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cusine", "root", "");
		
		Statement stmt=con.createStatement();
		String query ="Insert into  insertcart values(NULL,'"+id+"','"+type+"','"+money+"','"+qualt+"')";
		int i=stmt.executeUpdate(query);

		if(i==1)
		{
			out.println("data insertion successfully");
		}
		else
			out.println("data insertion failed");
		
		
		
	}catch(Exception e)
	{
		out.println(""+e);
		
	}
	 

		
		
		
		
		
		
		
		
		
	
	}

}
