<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<title>Login Page</title>
</head>
<body style="background-image: url('images/login2.jpg');">
	  <nav class="navbar navbar-expand-lg navbar-light" style="background:darkgray">
	    <div class="container-fluid">
	        <!-- Logo -->
				<img src="/images/247logo.jpeg" style="border-radius:60%" alt="Your Logo" width="40" height="40">
	  
	        <!-- Navigation Links -->
	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	                <a class="nav-link " href="/index">Home</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link " href="/register">Register</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link active"  href="/login">Login</a>
	            </li>
	        </ul>
	    </div>
	</nav>
    <div class="container">
      <div class="row justify-content-center mt-5">
        <div class=" col-sm-4">
          <form action="/useraccess" method="POST">
	            <div class="card bg-white text-black mt-5">
	              <div class="card-body p-3 text-center">
	              	<c:if test="${param.error!=null}">
				        <div class="alert alert-danger pt-2 pb-0">
				            <p>Please Enter Valid Credentials</p>
				        </div>
				    </c:if> 
	                <div class="mb-5">
					<!-- 	<a href="/adminlogin" class="row m-1" style="text-decoration:none; ">Admin Login</a> -->
	                    <h3 class="mb-2">Please Login Here</h3>
	                    <div class="mb-4 mt-4">
	                      <input type="email"  placeholder="Enter Email ID" name="username" class="form-control form-control" autocomplete="off" required>
	                    </div>
	
	                    <div class="mb-4">
	                       <input type="password" name="password" placeholder="Enter Password" class="form-control form-control" required>
	                    </div>
	                    <button class="btn btn-success w-100 " type="submit" name="submit">Login</button>
	                </div>
	                <div>
	                  	<h5>Don't have an account? <a href="register" style="text-decoration:none">Sign Up</a></h5>
	                  	<p class="mb-0">Forgot Password?<a href="/forgotpassword" style="text-decoration:none"> Click Here</a></p>
	                </div>
	              </div>
	            </div>
          </form>     
        </div>
      </div>
    </div> 
<script>
    var successMessage = "${successMessage}";
	var registerMessage = "${registerMessage}";
	var changePassword = "${changePassword}";
	
    if (successMessage) {
        Swal.fire({
            icon: 'success',
            title: successMessage,
            showConfirmButton: false,
            timer: 1000
        });
    }
    if (registerMessage) {
        Swal.fire({
            icon: 'success',
            title: registerMessage,
            showConfirmButton: false,
            timer: 1000
        });
    }
    if (changePassword) {
        Swal.fire({
            icon: 'success',
            title: changePassword,
            showConfirmButton: false,
            timer: 1000
        });
    }
</script>


</body>
</html>