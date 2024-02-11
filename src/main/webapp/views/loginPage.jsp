<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin login</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

</head>
<style>
.text{
color:white;
}
.redio1{
color:white;
margin-left:20px
}
body
{
    margin: 0;
    padding: 0;
    background-color:#6abadeba;
    font-family: 'Arial';
}
.mb-3{
        width: 500px;
        overflow: hidden;
        margin: auto;
        margin: 20 0 0 450px;
        padding: 80px;
        background: #23463f;
        border-radius: 15px ;

}
h1{
text-align: center;
    color: white;
    padding: 20px;
   
    }
    label{
    color: #08ffd1;
    font-size: 17px;
}
#email{
    width: 300px;
    height: 30px;
    border: none;
    border-radius: 3px;
    padding-left: 8px;
     height:30px;
}
#password{
    width: 300px;
    height: 30px;
    border: none;
    border-radius: 3px;
    padding-left: 8px;

}
#log{
    width: 300px;
    height: 30px;
    border: none;
    border-radius: 17px;
    padding-left: 7px;
    color: blue;
    margin-bottom:50px


}
input{
margin-bottom:50px;
}
span{
    color: white;
    font-size: 17px;
}
#xx{
color:white;}
.form-check-label{
margin-right:20px}

</style>
<body>



	<h1>Login Page</h1>

	
	
	<form class="row g-1 align-items-center" action="/adminLogin" method="post" onsubmit="return check()">
  <div class="mb-3">
    <div class="form-check">
  <input class="form-check-input" value="Admin" type="radio" name="role" id="flexRadioDefault1">
  <label class="form-check-label"  for="flexRadioDefault1">
    Retailer 
  </label>


  <input class="form-check-input" value="Customer" type="radio" name="role" id="flexRadioDefault2" checked>
  <label class="form-check-label" for="flexRadioDefault2">
    Customer
  </label>
</div>
    <label for="exampleInputEmail1" class="form-label">E-mail :</label>
    <input type="email" id="email" name="email" placeHolder="email" aria-describedby="emailHelp" required>
    <!-- <div id="xx">We'll never share your email with anyone else.</div> -->
 <br/>
  
    <label for="exampleInputPassword1" class="form-label">Password :</label>
    <input type="password"  name="password"  placeHolder="password" id="password" required><br><br><br>
  
  
  <button type="submit"  id="log">Submit</button>
  <br/> <br/> <br/>
   <p class="text">Don't have account? <a href="/register">Register</a></p>
   </div>
</form>
<script>
        function check() {
        	return true;
        }
        var error="<%=request.getAttribute("error")%>";
        if(error && error!=="null" && error.trim()!=""){
      
        	alert(error);
        }       
    </script>


</body>
</html>