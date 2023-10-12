<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsp/jstl/core"%>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="/css/bootstrap.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
	
		<title>Index Page</title>
	</head>
	<body>
		
	   <nav class="navbar navbar-expand-lg navbar-light" style="background:darkgray">
		    <div class="container-fluid">
		        <!-- Logo -->
					<img src="/images/247logo.jpeg" style="border-radius:60%" alt="Company logo" width="40" height="40">
		  			
		        <!-- Navigation Links -->
		        <ul class="navbar-nav ml-auto">
		            <li class="nav-item">
		                <a class="nav-link active" href="/index">Home</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link active" href="/register">Register</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link active" href="/login">Login</a>
		            </li>
		        </ul>
		    </div>
		</nav>
		<center><i><h2 class="mt-2" >24/7 Job Portal</h2></i></center>
	    <!-- About Section -->
	    <section id="about" class="py-5">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-9">
	                    <h2>About Us</h2>
	                    <p style="text-align:justify">Welcome to 24/7 Job Portal, your gateway to career opportunities and
	                     talent acquisition. We are dedicated to connecting job seekers with their dream careers and
	                     helping employers find the perfect match for their organizations. 
	                     At 24/7 Job Portal, we understand that finding the right job or the ideal candidate
	                     can be a daunting task. That's why we've built a platform 
	                     that simplifies and streamlines the entire process. Whether you're a job seeker seeking new 
	                     horizons or an employer searching for exceptional talent, we've got you covered.</p>
	                </div>
	                <div class="col-lg-3">
	                    <img src="images/company.jpg" class="img-fluid border border-primary float-end" alt="About Us Image">
	                </div>
	            </div>
	        </div>
	    </section>
	
	    <!-- Partners Section -->
	    <section id="partners" class="py-5 bg-light">
	        <div class="container">
	            <h2 >Our Partners</h2><br>
	            <div class="row">
	                <div class="col-md-4">
	                    <img src="/images/partner1.png" alt="Partner 1" height="100px" width="350px" 
	                    style=" box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5); object-fit:contain;">
	                </div>
	                <div class="col-md-4">
	                    <img src="/images/partner2.png"  alt="Partner 2" height="100px" width="350px" 
	                   style=" box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5); object-fit:contain;">
	                </div>
	                <div class="col-md-4">
	                    <img src="/images/partner3.jpg"  alt="Partner 3" height="100px" width="350px" 
	                   style=" box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5); object-fit:contain;">
	                </div>
	            </div>
	        </div>
	    </section>
	    <!-- Testimonials Section -->
		<section id="testimonials" class="py-5"><br>
		    <div class="container " >
		        <h2>Testimonials</h2><br>
		        <div class="row" >
		            <div class="col-md-6" >
		                <div class="card" style=" box-shadow: 0px 0px 1px rgba(0, 0, 0, 0.5); ">
		                    <div class="card-body" style="height: 120px;">
		                        <p class="card-text">Very nice website for freshers to get job opportunities</p>
		                        <div class="text-center">
		                            <i class="fa fa-star"></i>
		                            <i class="fa fa-star"></i>
		                            <i class="fa fa-star"></i>
		                            <i class="fa fa-star"></i>
		                            <i class="fa fa-star-o"></i>
		                        </div>
		                    </div>
		                    <div class="card-footer">
		                        <p class="card-text author">- Vishal Pal</p>
		                    </div>
		                </div>
		            </div>
		            <div class=" col-md-6" >
		                <div class="card" style=" box-shadow: 0px 0px 1px rgba(0, 0, 0, 0.5); ">
		                    <div class="card-body" style="height: 120px;">
		                        <p class="card-text">One of the best platforms for applying for a job and getting an instant response</p>
		                        <div class="text-center">
		                            <i class="fa fa-star"></i>
		                            <i class="fa fa-star"></i>
		                            <i class="fa fa-star"></i>
		                            <i class="fa fa-star"></i>
		                            <i class="fa fa-star-half-o"></i>
		                        </div>
		                    </div>
		                    <div class="card-footer">
		                        <p class="card-text author">- Sonali Jhadhav</p>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</section>
		 <!-- Footer -->
		  <footer class="bg-dark text-light text-center py-3">
		    <div class="container">
		      <p>
		        &copy; 2023 24/7 Job Portal. All Rights Reserved.
		        <br>
		         	<i class="fab fa-facebook-f mr-2"></i> <!-- Add mr-2 class for right margin -->
			        <i class="fab fa-twitter mr-2"></i> <!-- Add mr-2 class for right margin -->
			        <i class="fab fa-instagram mr-2"></i> <!-- Add mr-2 class for right margin -->
      		      </p>
		    </div>
		  </footer>
	</body>
	</html>