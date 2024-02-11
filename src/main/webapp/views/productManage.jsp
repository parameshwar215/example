<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       <%@ page import ="com.medical.medical.model.Product" %>
      
   <%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<style>
.search{
margin-top:20px;
margin-bottom:20px;
width:800px
}
.search-container{
text-align:center
}
.btn {
 /*  background-color: DodgerBlue; */
  border: none;
  color: white;
  padding: 12px 16px;
  font-size: 16px;
  cursor: pointer;
  border-radius: 100px;
  text-color:white;
}

.route{
text-decoration:none;

}
td,tr{
text-align:center;
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<head>


<meta charset="UTF-8">
<title>product-manage</title>
</head>

<body>
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
          <button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/manageProducts">Manage  Products</a></button>
        </li>
         <li class="nav-item">
          <%if(session.getAttribute("adminEmail")!=null) %><button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/report">Product  Sales Report</a></button>
        </li>
         
<!-- 
        <li class="nav-item">
          <button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/about">About NGO</a></button>
        </li> -->
   
          <li class="nav-item">
          <button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/adminLogout">Logout</a></button>
        </li>
      </ul>
    <span class="nav-item text-white mx-3"><h3 >Welcome! <%=(String)session.getAttribute("aname")%></h3></span>
    </div>
  </div>
 
</nav>

	<%
/* String name=(String)request.getAttribute("name");
long phNo=(long)request.getAttribute("phNo"); */
List<Product> products=(List<Product>)request.getAttribute("list");
%>  
<div class="search-container">
    
         <form action="/searchProduct" type="get">
          <input class="search" type="text" name="value" placeHolder="Type medicine name"/>
          <button>Search</button>
         </form>
 

</div>
     
     <div>
     <table class="table table-striped table-hover">
       <thead>
          <tr>
           <th>Product id</th>
           <th>Product Name</th>
           <th>Category </th>
            <th>Stock</th>
            <th>Expire Date</th>
            <th>Price per 1-no</th>
            <th>Rack No</th>
             <th>Shell No</th>
             <th>Delete Action</th>
             <th>Update Action</th>
            
          </tr>
         </thead>
         <tbody>
         <%for(Product p:products) {
            %>
            <tr>
            <td><%=p.getId()%></td>
            <td><%=p.getProductName()%></td>
            <td><%=p.getCategory()%></td>
            <td><%=p.getStock()%></td>
             <td><%=p.getExpireDate()%></td>
            <td><%=p.getPrice()%></td>
            <td><%=p.getRackNo()%></td>
             <td><%=p.getShellNo()%></td>
             <td>
                 <button class="btn" style="background-color:red;" ><a class="route" style="color:white"  href="/deleteProduct/<%=p.getId()%>">Remove Product</a></button>
             </td>
             <td>
                 <button class="btn" style="background-color:green;"><a class="route" style="color:white" href="/getProduct/<%=p.getId()%>">Update Product</a></button>
             </td>
             
            
                       
            </tr>
           <%}%>
         
         </tbody>
          
     </table>
     </div>
</body>
</html>