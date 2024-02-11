<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>

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

.container {
/* margin: 50px auto;
 border-left: 10px solid #000;
  border-right: 10px solid #FFF; */
   border: 1px solid #eb4e24;
  padding:40px;
  padding-top:10px;
  background-color:AliceBlue;
  border:blue;
  display: flex;
  flex-direction: column;
  width:28vw;
  margin-top:30px;
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

/* hover functionality for button */
button:hover {
  cursor: pointer;
  background-color: rgb(41, 4, 164);
}
body{
  background-image: url('register.jpeg');
}
</style>
<body> 
         
       <form action="/saveClient" method="post" >
                
                <div class="container">
            <h1>Medical Store Customer Registration </h1>
        
                
               <!-- <label >Participant Id: </label>
                <input type="Number" name="pId" > -->
                <label >Full Name : </label>
                <input type="text" name="name" required>
                  
                 
                 <label >Gender </label>
                  <select name="gender" required>
                   <option value="">select gender</option>
                   <option value="Male">Male</option>
                   <option value="Female">Female</option>
                  </select>
                  
                  
                <label > Age</label>
                <input type="text" name="age" required>
                
                
                <label >Date Of Birth </label>
                <input type="Date" name="dateOfBirth" 
      
       min="01/01/1990" max="01/01/2028" required>
       <label >email </label>
                <input type="text" name="email" required >
              
                <label >Password: </label>
                <input type="text" name="password" required ><br>
                
                <button>submit</button> <br/>
                
                
         </div>
        </form>
        <a href="/"><button>Back</button><a/>
</body>
</html>