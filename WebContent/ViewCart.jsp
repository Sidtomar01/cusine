<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import=" java.util.stream.*"%>
<%@page import=" java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="main.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
}
</script>

</head>
<body>

<!-- Sidebar (hidden by default) -->
<nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" style="display:none;z-index:2;width:40%;min-width:300px" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()"
  class="w3-bar-item w3-button">Close Menu</a>
  <a href="#food" onclick="w3_close()" class="w3-bar-item w3-button">Food</a>
  <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">About</a>
  <a href="Signup.jsp" onclick="w3_close()" class="w3-bar-item w3-button">Sign-Up</a>
  <a href="Login.jsp" onclick="w3_close()" class="w3-bar-item w3-button">Login</a>
  <a href="ViewCart.jsp" onclick="w3_close()" class="w3-bar-item w3-button">View Cart</a>
  <a href="Logout.jsp" onclick="w3_close()" class="w3-bar-item w3-button">Logout</a>
</nav>
<!-- Top menu -->
<%String name=(String)session.getAttribute("name"); %>
<div class="w3-top">
  <div class="w3-white w3-xlarge" style="max-width:1200px;margin:auto; backgroundcolor:grey">
    <div class="w3-button w3-padding-16 w3-left" onclick="w3_open()"><img src="menu.png" style ="height:25% ; width:25%"/></div>
    <div class="w3-right w3-padding-16">WELCOME:  <b><%out.println(name); %></b></div>
    <div class="w3-center w3-padding-16">Happy Cusine</div>
  </div>
</div>
<br><br><br><br><br><br><br>
<table width='600' height='400' border='5' align='center'  bgcolor='#00FFFF'>
<tr><td>Id</td><td>Item</td><td>Amount</td><td>Quantity</td> <td>Item Total</td></tr>

<%

if(session.getAttribute("name")!=null && !session.isNew())
{
	

	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cusine", "root", "");
		
		Statement stmt=con.createStatement();
		String query="select * from insertcart";
		ResultSet rs=stmt.executeQuery(query);
		
		while(rs.next())
		{
		//	int total=0;
		//	int money=Integer.valueOf(rs.getString(4));
			//int quantity=Integer.valueOf(rs.getString(5));
			
			
			//total=total+(money*quantity);
			
			
			out.println("<tr>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
			out.println("<td>"+rs.getString(4)+"</td>");
			out.println("<td>"+rs.getString(5)+"</td>");
			out.println("<td>"+rs.getString(6)+"</td>");
			out.println("</tr>");
			
			
			
			
			
			
		}
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	
	
	
	
	

}
else
{
	session.invalidate();
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/cusine", "root", "");
		Statement stmt=con1.createStatement();
		String query ="DELETE * FROM insertcart";
		int i=stmt.executeUpdate(query);
		if(i==1)
			{
			response.sendRedirect("Login.jsp");
			}

		
		
	}catch(Exception e)
	{
		

	out.println(e);

	}
	



}






%>





</table>
<br>

<script>

function validate()
{
    var txt;
    var person = prompt("Enter the id of the food to be Cancelled", " ");
    if (person == null || person == "") {
        txt = "User cancelled the prompt.";
    } else {
        txt  = person ;
        window.location.replace("ViewCart.jsp?name="+txt)
        alert(txt+" id food is deleted .Please refresh the page." )
    }
  }
	
</script>


<% 

if(!session.isNew()   && session.getAttribute("name")!=null)
{


try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/cusine", "root", "");
	String txt=request.getParameter("name");
	Statement stmt=con1.createStatement();
	String query ="DELETE FROM insertcart WHERE id="+txt;
	int i=stmt.executeUpdate(query);
	if(i==1)
		{
		 
		}

	
}catch(Exception e)
{
	out.println("exception"+e);
}


}else{
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/cusine", "root", "");
		Statement stmt=con1.createStatement();
		String query ="DELETE * FROM insertcart";
		int i=stmt.executeUpdate(query);
		if(i==1)
			{
			response.sendRedirect("Login.jsp");
			}

		
	}catch(Exception e)
	{
		out.println("exception"+e);
	}
	
	
	
	
	
}

%>



<script type="text/javascript">


</script>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/cusine","root","");


	Statement stmt=con1.createStatement();
	String query="select sum(item_total) from insertcart";
	ResultSet rs=stmt.executeQuery(query);
	rs.next();
     String sum = rs.getString(1);
     
   Double  value = Double.parseDouble(sum);
//Total.sum(dataSetRow["yourRow"])
     
%><center>
<% out.println("Pay Rs:"+value);%>
</center>                 <%
     
    }

      catch(Exception exc){
      out.println(exc.getMessage());
      }





%>

<script>




</script>

<center>
<table>

<tr>
<td>
<button onclick="validate()">DELETE</button>
<td>

<a href="place.jsp"><button >PLACE ORDER</button></a>



</td>


</tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>

<tr><td><a href="index.jsp">ADD MORE ITEMS</a></td></tr>


</table>


</center>
</body>
</html>