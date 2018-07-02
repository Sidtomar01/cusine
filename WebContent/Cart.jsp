<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>order material</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="main.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
 <style>
 


  
  @media only screen and (max-width: 2000px) {
 
.dropdown-menu{
position:absolute;
left:70%;
}
}
@media only screen and (max-width: 1100px) {
  .dropdown-menu{
position:absolute;

left:50%;
}
}
@media only screen and (max-width: 600px) {
  .dropdown-menu{
  position:relative;
  top:-5px;
  left:0px;

}
}
 
 .typecolor{background-color:#dc143c;} 
 
 
 
 
 
 

body{
	background-color:#ffffff
	
	
}
.main{
	
	width:500px;
	margin:50px auto;
	border:3px solid #dc143c;
	border-radius:10px;
	background-color:#fffaf0;
	border-Left: 40px solid #dc143c;
	box-shadow: 2px 2px 10px #000;
	
}
.info{
	width: 100%;
	padding: 8px;
	background-color:#dc143c;
	font-size:20px;
	font-weight: bold;
	text-align: center;
	color:#fff;
	text-shadow: 1px 1px 2px #000;
}
.form-box{
	padding:25px;
}
label{
	color:navy;
	font-size:20px;
}
.inp{
	
	width:100%;
	padding: 10px;
	margin-bottom:10px;
	border:2px solid #dc143c;
	border-radius: 5px;
	margin-top:3px;
	font-weight:bold;
	border-right: 20px solid #dc143c;
	border-left: 20px solid #dc143c;
	color: navy;
	
	
}
.inp:focus{
	outline: none;
	border-right: 20px solid navy;
	border-left: 20px solid navy;
	border:2px solid navy;
}
	.sub-btn{
	width: 100%;
	padding:10px;
	margin-top:5px;
	border: none;
	border-radius:5px;
	background:linear-gradient(#dc143c,#800000);
	color:fff;
	font-size:20px;
	cursor:pointer;
	
}
.sub-btn:focus{
	outline:none;
	
}
.sub-btn:hover{
	background:linear-gradient(#800000,#dc143c);
	transition: all ease-out 0.2s;
	opacity:0.8;
	filter:alpha(opacity=10);
}
@media(max-width: 720px)
{
	.main{
		width:90%;
	}
}
 
 
 
 
  
  
  </style>
  

</head>
<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
}
</script>

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
    <div class="w3-button w3-padding-16 w3-left" onclick="w3_open()"><img src="menu.png" style="height:25% ; width:25%"/></div>
    <div class="w3-right w3-padding-16">WELCOME:  <b><%out.println(name); %></b></div>
    <div class="w3-center w3-padding-16">Happy Cusine</div>
  </div>
</div>
<%if(session.getAttribute("name")!=null){
String id=(String)request.getParameter("id");




try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cusine", "root", "");
	 PreparedStatement pst = con.prepareStatement("Select * from paneer where id=? ");
     pst.setString(1, id);
     
   ResultSet rs = pst.executeQuery();                        
     if(rs.next()) {         

          out.println("<center>");
          
          

			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("<br>");
			
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<br>");
			
			out.println("<td>"+rs.getString(3)+"</td>");
			out.println("<br>");
		    
			out.println("</tr>");
			out.println("<br>");
			
	out.println("</center>");
		
		
		


		
		
		
      %>
      <center>
   <div class="main">
<div class="info">Item to be Entered!!</div>
  <form action="Insert.jsp" method="post" class="form-box">
   <label for="id">ID:</label><br>
   <input type="text" name="id"  class="inp" value="<%out.println(rs.getString(1)); %>"/><br>
   <label for="type">Type:</label><br>
   <input type="text" name="type"  class="inp" value="<%out.println(rs.getString(2)); %>"/><br>
   <label for="money">Money:</label><br>
  <input type="text" name="money"  class="inp" value="<%out.println(rs.getString(3)); %>"/><br>
  <label for="Quality"> Quality</label><br>
     <input type="text" name= "qualt" class="inp"/><br>
     
     
      
     
   
     
     
    
     
     <input type ="submit" value="Add to cart" class="sub-btn"/>
     
   
   </form>
   </div>
   
   </center>  
  
   
     
     
                          
 
     <% }  else
    {
    	 response.sendRedirect("Error.jsp");
     }   
     
    
     
     
     
}
catch(Exception e){       
    out.println(""+e);       
}      
}else{
	response.sendRedirect("Error1.jsp");
}

%>


</body>
</html>