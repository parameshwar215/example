<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       <%@ page import ="com.medical.medical.model.Product" %>
      
   <%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<style>
.search{
margin-top:20px;
margin-bottom:20px
}
.quantity{
width:150px
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
        <li class="nav-item">
          <%if(session.getAttribute("custEmail")!=null) %><button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/cart">Cart</a></button>
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
    
         <form action="/searchProduct1" type="get">
          <input class="search" type="text" name="value" placeHolder="Type medicine name"/>
          <button>Search</button>
         </form>
 

</div>
<div>
    <table class="table table-bordered border-info">
        <thead>
            <tr>
                <th>R/C</th>
                <th>C1</th>
                <th>C2</th>
                <th>C3</th>
                <th>C4</th>
                <th>C5</th>
                <th>C6</th>
            </tr>
        </thead>
        <tbody>
         
            <%
                var maxRows = 20; // Adjust the maximum number of rows as needed
                var maxCols = 6; // Adjust the maximum number of columns as needed
                for (var row = 1; row <= maxRows; row++) {
                	
            %>
                 
            <tr>
            <td>R<%=row%></td>
                <%
                    for (var col = 1; col <= maxCols; col++) {%>
                     
                      <%   Product  foundProduct = null;
                        for (Product p : products) {
                            if (p.getRackNo() == row && p.getShellNo() == col) {
                                foundProduct = p;
                                break;
                            }
                        }
                %>       
                        <td>
                            <% if (foundProduct != null) { %>
                                <!-- Display product information based on your requirement -->
                                    <%= foundProduct.getProductName() %><br>
                                                                <%="       (Stock: "+foundProduct.getStock()+")" %><br>
                            <%if(session.getAttribute("adminEmail")!=null){ %>
                              <%= "Rack: " + foundProduct.getRackNo() + ", Shell: " + foundProduct.getShellNo() %>
                              <% }%>
                              <%if(session.getAttribute("custEmail")!=null){ %>
                              <form action="/addToCart/<%=foundProduct.getId()%>" method="get">
                                <input class="quantity" type="number" name="quantity" min=1 max="<%=foundProduct.getStock()%>"  placeHolder="quantity" required></input>
                                <button>Add to Cart</button>
                              </form>
                              <% }%>
                            <% } %>
                        </td>
                <%
                    }
                %>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>