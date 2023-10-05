<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- <link rel="stylesheet" href="/css/style.css">	 -->
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 	<title>Registration Page</title>
	<script type="text/javascript" src="/js/bootstrap.js"></script>	
</head>
<body>
	  <nav class="navbar navbar-expand-lg navbar-light" style="background:darkgray">
	    <div class="container-fluid">
	        <!-- Logo -->
				<img src="/images/247logo.jpeg" style="border-radius:60%" alt="Your Logo" width="40" height="40">
	  
	        <!-- Navigation Links -->
	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	                <a class="nav-link" href="/index">Home</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link active" href="/register">Register</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="/login">Login</a>
	            </li>
	        </ul>
	    </div>
	</nav>
	 <c:if test="${not empty requestScope.message}">
        <div class="alert alert-danger">
            ${requestScope.message}
        </div>
    </c:if>
	<div class="container mb-4">
        <div class="row mt-4">
            <div class="col-md-6 offset-md-3" id="form" style="border: transparent 4px solid; box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.5); border-radius:25px">
                <center class="regis"><h1>Registration Form</h1></center>
                <form id="passwordForm" onsubmit="return validatePassword();" action="/userregister" method="POST">
                    <div class="form-group mt-2">
                        <label>First Name</label>
                        <input type="text" name="fname" class="form-control text" placeholder="Enter name" required pattern="[A-Za-z]{2,20}" >
                    </div>
                    <div class="form-group mt-2">
                        <label>Last Name</label>
                        <input type="text" name="lname" class="form-control text" placeholder="Enter surname" required pattern="[A-Za-z]{3,20}" >
                    </div>
                    <div class="form-group mt-2">
                        <label>Phone Number</label>
                        <input type="tel" class="form-control text" name="phone" placeholder="Enter Mobile Number" maxlength="10" required pattern="[0-9]{10}" >
                    </div>
					    <div class="form-group mt-2">
					    <label>Gender</label><br>
					    <input type="radio" id="male" name="gender" value="m" required>
					    <label for="male">Male</label>
					    
					   	<input type="radio" id="female" name="gender" value="f" required>
					    <label for="female">Female</label>
			
					    <input type="radio" id="others" name="gender" value="o" required>
					    <label for="others">Others</label>
					    
					</div>
					
                    <div class="form-group mt-2">
                        <label>Address</label>
                        <textarea class="form-control" rows="3" placeholder="Enter Address" name="address" required pattern="[A-Za-z0-9]{3,90}" ></textarea>
                    </div>
                    <div class="form-group mt-2">
                        <label>City</label>
                        <input type="text" name="city" class="form-control text" placeholder="Enter city" required pattern="[A-Za-z]{3,20}">
                    </div>
                    <div class="form-group mt-2">
                        <label>Country</label>
                          <select id="country" class="form-control" name="country"  required>
                            	<option disabled selected> Select Country </option>
                            	<option value="India">India</option>
							    <option value="USA">United States</option>
							    <option value="Canada">Canada</option>
							    <option value="UK">United Kingdom</option>
							    <option value="Australia">Australia</option>

						</select>
                    </div>
					 <div class="form-group mt-2">
                        <label>Qualification</label>
                          <select id="qualification" class="form-control" name="qualification"  required>
                            	<option disabled selected> Select Qualification</option>
							    <option value="Bsc-IT">BSC-IT</option>
							    <option value="Bsc-CS">BSC-CS</option>
							    <option value="BCA">BCA</option>
							    <option value="BTech">BTECH</option>
						</select>
                    </div>
                
                    <div class="form-group mt-2">
                        <label>Email ID</label>
                        <input type="email" class="form-control text" placeholder="Enter Email ID" name="email" required > 
                    </div>
                    <div class="form-group mt-2">
                        <label>Designation</label>
                        <input type="text" name="designation" class="form-control text" placeholder="Enter Designation" required pattern="[A-Za-z ]{3,20}" >
                    </div>
                    <div class="form-group mt-2">
                        <label>Password</label>
                        <input type="password" class="form-control text" placeholder="Enter Password" name="password" id="password" required pattern=".{6,}" autocomplete="off">  
                    </div>
               		<div class="form-group mt-2">
                        <label>Confirm Password</label><br>
                        <input type="password" class="form-control text" placeholder="Confirm Password" name="confirmpassword" id="confirmpassword" required pattern=".{6,}" autocomplete="off">
                    </div>
                    <div class="form-group offset-md-5 mt-3">
                      <button type="submit" class="btn btn-danger" name="submit">Register</button>
                  <!--     <a class="btn btn-primary mx-3" href="/index">Back</a> -->
                    </div>
                </form>
            </div>
        </div>
    </div>
     <script>
	    function validatePassword() 
	    {
	        var password = document.getElementById("password").value;
	        var confirmpassword = document.getElementById("confirmpassword").value;
	        
	        if (password === confirmpassword) 
	        {
	            return true; 
	        } 
	        else 
	        {
	            alert("Passwords do not match. Please try again.");
	            return false; 
	        }
	    }
	</script>
</body>
</html>