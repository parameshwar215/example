<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%--  <%@ page import ="com.ngo.entity.ProductDetails" %> --%>
   
    

<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<head>
<meta charset="ISO-8859-1">
<title>add-product</title>

</head>
<style>

body {
  font-family: Arial, Helvetica, sans-serif;
}

form {
 
  display: flex;
  flex-direction: column;
  align-items: center;
}
/*  img{
 background-repeat:no-repeat;
 height:700px;
 width:100%;
  
 } */
 body{
  background-image: url('donate.jpeg');
  background-repeat:no-repeat;
   height:700px;
   width:100%;
   background-size:100%
   
  
}

.container {

/* margin: 50px auto;
 border-left: 10px solid #000;
  border-right: 10px solid #FFF; */
  margin-top:60px;
   border: 1px solid #eb4e24;
  padding:40px;
  padding-top:10px;
  background-color:white;
  border:black;
  display: flex;
  flex-direction: column;
  width: 500px;
  background-repeat:no-repeat;
}

h1, p {
  text-align: center;
}


input,select {
  margin: 0.25em 0em 1em 0em;
  outline: none;
  padding: 0.5em;
  border: none;
  background-color: rgb(225, 225, 225);
  border-radius: 0.25em;
  color: black;
}
button {
  padding: 0.75em;
  border: none;
  outline: none;
  background-color: rgb(68, 18, 232);
  color: white;
  border-radius: 0.25em;
}
 a:active {
  color: blue;
}

/* hover functionality for button */
button:hover {

  cursor: pointer;
  background-color: rgb(41, 4, 164);
}
</style>
<body> 
<script src="https://code.jquery.com/jquery.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<body class="body">
<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");

	if (session.getAttribute("aemail") == null) {
		response.sendRedirect("/sessionexpired");

	}
	//String name=(String)
	%>
		

	<nav class="navbar navbar-expand-lg navbar-light bg-secondary">
  <div class="container-fluid">
    <a class="navbar-brand text-white "  href="/home">Medical Administration</a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      <li class="nav-item">
          <button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/home">Home</a></button>
        </li>
        <li class="nav-item">
          <button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/addProduct">Add Product</a></button>
        </li>
         <li class="nav-item">
          <button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/manageProducts">Manage Products</a></button>
        </li>
         
<!-- 
        <li class="nav-item">
          <button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/about">About NGO</a></button>
        </li> -->
    <li class="nav-item">
          <%if(session.getAttribute("adminEmail")!=null) %><button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/report">Product  Sales Report</a></button>
        </li>
          <li class="nav-item">
          <button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/adminLogout">Logout</a></button>
        </li>
      </ul>
    <span class="nav-item text-white mx-3"><h3 >Welcome! <%=(String)session.getAttribute("aname")%></h3></span>
    </div>
  </div>
 
</nav>

<button><a href="/viewProducts" >View Products</a></button>
<button><a href="/ordersList" >Ordered Products</a></button>
<button><a href="/cart" >Cart</a></button>
<button><a href="/adminLogout" >Logout</a></button>




         
       
</body>
</html>