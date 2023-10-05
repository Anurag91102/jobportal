<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%@page isELIgnored="false"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<title>User View Profile</title>
	<style>
        .card {
            border: 1px solid #3498db; /* Blue border color */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #EEEEEE; /* Light gray background color */
        }

        .card-title {
            color: #3498db; 
            text-align: center;
            font-size: 24px;
        }

        .user-info p {
            margin-bottom: 10px;
            font-size: 16px;
        }

        .user-info strong {
            color: blue; 
        }
		
		.user-info p {
        margin-bottom: 10px;
   	 	}

	    .user-info i {
	        width: 20px; 
	        display: inline-block;
	        text-align: center;
	        margin-right: 10px; 
    	}
    </style>
</head>
<body>
	<nav>
        <div class="navbar navbar-expand-lg" style="background:darkgray">
            <div class="col">
            <a class="nav-link active  float-end m-1 mx-2" href="/logout" >Logout</a>
	        <a class="nav-link active  float-end m-1 " href="/admin_dashboard">Home</a> 
            </div>
        </div>
    </nav>
	<div class="container mt-4">
	    <div class="card">
	        <div class="card-body">
	            <div class="row align-items-center">
	                <div class="col">
	                     <a href="/admin_dashboard" style="text-decoration:none">Back</a>
	                </div>
	                <div class="col text-center">
	                    <h5 class="card-title">User Profile</h5>
	                </div>
	                <div class="col">
	                </div>      
	            </div>
	            <hr>
                <div class="user-info">
                    	<p class="mb-3"><i class="fas fa-user"></i> <strong>Name: </strong>${users.fname} ${users.lname}</p>
					    <p class="mb-3"><i class="fas fa-venus-mars"></i> <strong>Gender: </strong>${users.gender }</p>
					    <p class="mb-3"><i class="fas fa-graduation-cap"></i> <strong>Qualification: </strong>${users.qualification}</p>
					    <p class="mb-3"><i class="fas fa-map-marker-alt"></i> <strong>City: </strong>${users.city}</p>
					    <p class="mb-3"><i class="fas fa-globe"></i> <strong>Country: </strong>${users.country}</p>
					    <p class="mb-3"><i class="fas fa-phone"></i> <strong>Phone Number: </strong>${users.phone}</p>
					    <p class="mb-3"><i class="fas fa-home"></i> <strong>Address: </strong>${users.address}</p>
					    <p class="mb-3"><i class="fas fa-briefcase"></i> <strong>Designation: </strong> ${users.designation}</p>
					    <p><i class="fas fa-envelope"></i> <strong>Email ID: </strong>${users.email }</p>
				</div>
            </div>
        </div>
    </div>
</body>
</html>