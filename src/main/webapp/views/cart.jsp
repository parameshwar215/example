<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       <%@ page import ="com.medical.medical.model.Cart" %>
      
   <%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<style>
.search{
margin-top:20px;
margin-bottom:20px
}
.search-container{
text-align:center
}
.search{
width:800px
}
td,tr{
text-align:center;
}
td{
padding:40px;
}
.route{
text-decoration:none;

}
h4{
margin-left:750px}

</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>all-products</title>
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
   <%if(session.getAttribute("adminEmail")!=null) %> <a class="navbar-brand text-white "  href="/home">Medical Administration</a>
      <%if(session.getAttribute("custEmail")!=null) %> <a class="navbar-brand text-white "  href="/home">Customer Home</a>
   
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      <li class="nav-item">
          <button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/home">Home</a></button>
        </li>
        <li class="nav-item">
          <%if(session.getAttribute("adminEmail")!=null) %><button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/addProduct">Add Product</a></button>
        </li>
         <li class="nav-item">
          <%if(session.getAttribute("adminEmail")!=null) %><button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/manageProducts">Manage  Products</a></button>
        </li>
        <li class="nav-item">
          <%if(session.getAttribute("custEmail")!=null) %><button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/ordersList">Ordered Products</a></button>
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
List<Cart> orders=(List<Cart>)request.getAttribute("list");
int total=(int)request.getAttribute("total");

%> 

<div class="search-container">
    
         <form action="/searchProduct1" type="get">
          <input class="search" type="text" name="value" placeHolder="Type medicine name"/>
          <button>Search</button>
         </form>
 

</div>
<h1>Cart Items</h1>
<div>
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th>Product Id</th>
                <th>Product Name</th>
                <th>Price/One-Product<th>
                <th>Ordered Quantity</th>
                <th>Total Amount Paid</th>
                 
                <th>Action</th>
                
            </tr>
        </thead>
         <%for(Cart order:orders) {
            %>
            <tr>
            <td><%=order.getProduct().getId()%></td>
            <td><%=order.getProduct().getProductName()%></td>
            <td><%=order.getProduct().getPrice()%><td>
            <td><%=order.getQuantity()%></td>
            <td>RS. <%=order.getTotalAmount()%>/-</td>
            
          
             <td>
                 <button class="btn" style="background-color:red;" ><a class="route" style="color:white"  href="/removeProductFromCart/<%=order.getOrderId()%>">Remove</a></button>
             </td>        
            </tr>
           <%}%>
         
    </table>
    
    <h4>Total Amount To Pay Rs. <%=total %>/-</h4>  <td>
                 <button class="btn" style="background-color:GREEN;" ><a class="route" style="color:white"  href="/conformOrder">Conform Order</a></button>
             </td> 
</div>

</body>
</html>