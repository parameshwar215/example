<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Stream" %>
    
       <%@ page import ="com.medical.medical.model.ProductSales" %>
       <%@ page import ="com.medical.medical.model.Product" %>
       <%@ page import="java.util.stream.Stream" %>
       <%@ page import=" java.util.stream.Collectors" %>
       <%@ page import="java.util.List" %>
<%@ page import="com.medical.medical.model.ProductSales" %>
<%@ page import="com.medical.medical.model.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
       
      
      
   <%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<style>
h4{
text-align:center;
}
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
 body {
            font-family: Arial, sans-serif;
        }

h4 {
            text-align: center;
        }

 .search-container {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .search {
            width: 800px;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .monthly-table {
            margin-bottom: 40px;
           
        }
        .monthly-table table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ddd;
        }

        .monthly-table th, .monthly-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .monthly-table th {
            background-color: #f2f2f2;
        }
           
</style>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">

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
    List<ProductSales> products = (List<ProductSales>) request.getAttribute("salesList");
    List<Product> allProducts = (List<Product>) request.getAttribute("prList");
    int year=(int)request.getAttribute("year");
    Map<Integer, List<ProductSales>> productsForMonth = new HashMap<>();
    
    for (int i = 1; i <= 12; i++) {
        List<ProductSales> productsInMonth = new ArrayList<>();
        for (ProductSales ps : products) {
            if (ps.getMonth() == i) {
                productsInMonth.add(ps);
            }
        }
        productsForMonth.put(i, productsInMonth);
    }
%>
<div class="search-container">
    
         <form action="/yearlyReport" type="get">
          <input class="search" type="Number" name="year" placeHolder="Type the year"/>
          <button>Search</button>
         </form>
 

</div>

<h4>All Products Sales Report for : <%=year%></h4>
<div class="monthly-table">
    <table class="table table-striped table-hover">
        <thead>
            <tr>
            <th>Sl.No</th>
            
                <th>Product Name</th>
                <th>January</th>
                <th>February</th>
                <th>March</th>
                <th>April</th>
                <th>May</th>
                <th>June</th>
                <th>July</th>
                <th>August</th>
                <th>September</th>
                <th>October</th>
                <th>November</th>
                <th>December</th>
                 <th>Monthly Average</th>
            </tr>
        </thead>
        <tbody>
        <tr>
      <%var slNo=1; %>
      
    <% 
      // Collections.sort(products, Comparator.comparingFloat(ProductSales::getAvg).reversed());

        int maxCols = 12; // Assuming 12 months
        
        for (ProductSales product : products) {
        	 for (Product p : allProducts) {
                 if ( p.getId() == product.getProductId()){%>
                 <td><%=slNo %></td>
                 	<td><%=p.getProductName() %></td>
                 	
                 	
                <% slNo++;}
                 }
    %>
      
            <%-- <td><%= all.getProductName()%></td> --%>
            <% 
                ProductSales ps = null;
                for (int col = 1; col <= maxCols; col++) {
                    boolean found = false;
                  //  Collections.sort(products, Comparator.comparingInt(ProductSales::getQuantity).reversed());

                  
                 
         
                    for (Product p : allProducts) {
                    	
                        if (product.getMonth() == col && p.getId() == product.getProductId()){
                            found = true;
                           // ps=p;
            %>
                            <td><%= product.getQuantity() %></td>
            <%
                            break;
                        }
                    }%>
                    
                  <% if (!found) {
            %>
                        <td>0</td> <!-- Display empty cell if no data for the month -->
            <%
                    }%>
                  
               <%} %>
               <td><%=product.getAvg() %></td>

                
              
        </tr>
    <%
        }
    %>
</tbody>

    </table >
</div>


<div calss="monthly-table">
    <%
    for (var i = 1; i <= 12; i++) {
    	   switch(i) {
           case 1:
   %>
               <h4>January</h4>
   <%
               break;
           case 2:
   %>
               <h4>February</h4>
   <%
               break;
           case 3:
   %>
               <h4>March</h4>
   <%
               break;
           case 4:
   %>
               <h4>April</h4>
   <%
               break;
           case 5:
   %>
               <h4>May</h4>
   <%
               break;
           case 6:
   %>
               <h4>June</h4>
   <%
               break;
           case 7:
   %>
               <h4>July</h4>
   <%
               break;
           case 8:
   %>
               <h4>August</h4>
   <%
               break;
           case 9:
   %>
               <h4>September</h4>
   <%
               break;
           case 10:
   %>
               <h4>October</h4>
   <%
               break;
           case 11:
   %>
               <h4>November</h4>
   <%
               break;
           case 12:
   %>
               <h4>December</h4>
   <%
               break;
           default:
   %>
               <h4>Invalid Month</h4>
   <%
       }
    %>
    <table class="table table-bordered border-info">
        <thead>
            <!-- Add table header if needed -->
        </thead>
        <tbody>
            <%
            List<ProductSales> productsInMonth = new ArrayList<>();
            for (ProductSales p : products) {
                if (p.getMonth() == i) {
                    productsInMonth.add(p);
                }
            }

            Collections.sort(productsInMonth, Comparator.comparingInt(ProductSales::getQuantity).reversed());

            var max_Cols = 5;
            var rows = (int) Math.ceil((double) productsInMonth.size() / max_Cols);
             if(productsInMonth.size()>0){
            for (var row = 0; row < rows; row++) {
            %>
            <tr>
                <%
                for (var col = 0; col < max_Cols; col++) {
                    var index = row * max_Cols + col;
                    if (index < productsInMonth.size()) {
                        var productSales = productsInMonth.get(index);
                        // Assuming Product is associated with ProductSales
                        var product = allProducts.stream()
                                .filter(p -> p.getId() == productSales.getProductId())
                                .findFirst()
                                .orElse(null);
                        if (product != null) {
                %>
                <td><%= product.getProductName() %></td>
                <%
                        }
                    }
                }
                %>
            </tr>
            <%
            }}else{%>
            	<tr>
            	<td>No Items were sold in this month</td>
            	</tr>
           <% }
            %>
        </tbody>
    </table>
    <hr/>
    <%
    }
    %>
</div>


</body>
</html>
