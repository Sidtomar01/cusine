<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="main.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
.w3-bar-block .w3-bar-item {padding:20px}
</style>
</head>
<body>
<%String name=(String)session.getAttribute("name"); %>

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
<div class="w3-top">
  <div class="w3-white w3-xlarge" style="max-width:1200px;margin:auto; backgroundcolor:grey">
    <div class="w3-button w3-padding-16 w3-left" onclick="w3_open()"><img src="menu.png" style="height:25%; width:25%"/></div>
    <div class="w3-right w3-padding-16">WELCOME:  <b><%out.println(name); %></b></div>
    <div class="w3-center w3-padding-16">Happy Cusine</div>
  </div>
</div>
  
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">

  <!-- First Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
  
  
<h2> <div class="w3-center w3-padding-16" style="color:red;">FROM PANEER</div> </h2>
    <div class="w3-quarter">
      <img src="paneer/ap.jpg" alt="Sandwich" style="width:100%">
      <h3 name="aloo paneer" >ALOO PANEER</h3>
   
      
      
      <p value="100">RS 100 </p><a href="Cart.jsp?id=1"><img src="cart.png" style="width:10% ; height:10%"/></a>
    </div>
    <div class="w3-quarter">
      <img src="paneer/butterpaneer.jpg" alt="Steak" style="width:100%">
      <h3 name="butter paneer">BUTTER PANEER MASALA</h3>
      <p value="140">RS 140 </p><a href="Cart.jsp?id=2"><img src="cart.png" style="width:10% ; height:10%"/></a>
    </div>
    <div class="w3-quarter">
      <img src="paneer/coyat.jpg" alt="Cherries" style="width:100%">
      <h3 name=coyat>COYAT</h3>
      <p value="160">RS 160</p><a href="Cart.jsp?id=3"><img src="cart.png" style="width:10% ; height:10%"/></a>
      
    </div>
    <div class="w3-quarter">
      <img src="paneer/matarpaneer.jpg" alt="Pasta and Wine" style="width:100%">
      <h3 name="matar paneer" >MATAR PANEER</h3>
      <p value="120">RS 120</p><a href="Cart.jsp?id=4"><img src="cart.png" style="width:10% ; height:10%"/></a>
    </div>
  </div>

  <!--</center> Second Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center">
    <div class="w3-quarter">
      <img src="paneer/tavapaneer.jpg" alt="Popsicle" style="width:100%">
      <h3 name="tavapaneer">TAWA PANEER</h3>
      <p value="100">RS 110</p><a href="Cart.jsp?id=5"><img src="cart.png" style="width:10% ; height:10%"/></a>
    </div>
    <div class="w3-quarter">
      <img src="paneer/schezwanpaneer.jpg" alt="Salmon" style="width:100%">
      <h3 name="schezwanpanner">SCHEZWAN PANEER</h3>
      <p value="160">RS 160</p><a href="Cart.jsp?id=6"><img src="cart.png" style="width:10% ; height:10%"/></a>
    </div>
    <div class="w3-quarter">
      <img src="paneer/malaipaneer.jpg" alt="Sandwich" style="width:100%">
      <h3 name="malai paneer">MALAI PANEER</h3>
      <p value="100">RS 100</p><a href="Cart.jsp?id=7"><img src="cart.png" style="width:10% ; height:10%"/></a>
    </div>
    <div class="w3-quarter">
      <img src="paneer/paneertikka.jpg" alt="Croissant" style="width:100%">
      <h3 name="paneer tikka">PANEER TIKKA</h3>
      <p value="110">RS 110</p><a href="Cart.jsp?id=8"><img src="cart.png" style="width:10% ; height:10%"/></a>
    </div>
  </div>

  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
      <a href="index.jsp" class="w3-bar-item w3-black w3-button">1</a>
      <a href="dal.jsp" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="sabji.jsp" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="bread.jsp" class="w3-bar-item w3-button w3-hover-black">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
    </div>
  </div>
 
   

<!-- End page content -->
</div>

<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
}
</script>


</body>
</html>