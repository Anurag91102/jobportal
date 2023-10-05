<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>User Edit Profile</title>
	<style>
            body{
               /*  background-image: url(/images/login2.jpg); */
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 100%;
                font-style:Arial;
            }
            #form{
              
                min-height:auto;
                padding: 5px 40px 40px 40px;
                border-radius: 20px;

            }
            .regis
            {
                font-size: 50px;
                font-family: Arial;
                font-weight: 300;
                border-bottom-style: ridge;
            }
            .text{
                height: 35px;
            }
            label{
                font-size: 18px;
            }
        </style>
</head>
<body>
 <nav class="navbar navbar-expand-lg navbar-light p-0 pt-2 pb-2" style="background:darkgray">
	    <div class="container-fluid p-0">
	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	                <a class="nav-link active" href="/user dashboard">Home</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link active" href="/logout">Logout</a>
	            </li>
	        </ul>
	    </div>
	</nav>
<div class="container mt-4 mb-4">
        <div class="row">
            <div class="col-md-6 offset-md-3" id="form" style="border: transparent 4px solid; box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.5);">
                <center class="regis"><h2>Edit Profile</h2></center>
                <form action="/updateuser" method="POST">
                	<input type="hidden" name="id" class="form-control text" value="${user.id}">
                    <div class="form-group mt-2">
                        <label>Name</label>
                        <input type="text" name="fname" class="form-control text" placeholder="Enter name" value="${user.fname}" required autocomplete="off">
                    </div>
                    <div class="form-group mt-2">
                        <label>Surname</label>
                        <input type="text" name="lname" class="form-control text" placeholder="Enter surname" value="${user.lname}" required autocomplete="off">
                    </div>
                    <div class="form-group mt-2">
                        <label>Phone Number</label>
                        <input type="text" class="form-control text" name="phone" placeholder="Enter Mobile Number" size="10" value="${user.phone}" required autocomplete="off">
                    </div>
                    <div class="form-group mt-2">
                    <label>Gender</label><br>
            			<label><input type="radio" name="gender" value="m" ${user.gender == 'm' ? 'checked' : ''}> Male</label>
						<label><input type="radio" name="gender" value="f" ${user.gender == 'f' ? 'checked' : ''}> Female</label>
						<label><input type="radio" name="gender" value="o" ${user.gender == 'o' ? 'checked' : ''}> Other</label>
                    </div>
                    <div class="form-group mt-2">
                        <label>Address</label>
                        <textarea class="form-control" rows="3" placeholder="Enter Address" name="address" required autocomplete="off">${user.address}</textarea>
                    </div>
                     <div class="form-group mt-2">
                        <label>City</label>
                        <input type="text" name="city" class="form-control text" placeholder="Enter City" value="${user.city}" required autocomplete="off">
                    </div>
                    <div class="form-group mt-2">
                    	<label>Country</label>
                    	<select name="country" class="form-control" required>
                            	<option value="India" ${user.country == 'india' ? 'selected' : ''}>India</option>
							    <option value="USA" ${user.country == 'usa' ? 'selected' : ''}>United States</option>
							    <option value="Canada" ${user.country == 'canada' ? 'selected' : ''}>Canada</option>
							    <option value="UK" ${user.country == 'uk' ? 'selected' : ''}>United Kingdom</option>
							    <option value="Australia" ${user.country == 'australia' ? 'selected' : ''}>Australia</option>
						</select>
                    </div>
                     <div class="form-group mt-2">
                    	<label>Qualification</label>
                    	<select class="form-control" name="qualification" required>
							    <option value="Bsc-IT" ${user.qualification == 'bscit' ? 'selected' : ''}>BSC-IT</option>
							    <option value="Bsc-CS" ${user.qualification == 'bsccs' ? 'selected' : ''}>BSC-CS</option>
							    <option value="BCA" ${user.qualification == 'bca' ? 'selected' : ''}>BCA</option>
							    <option value="BTech" ${user.qualification == 'btech' ? 'selected' : ''}>BTECH</option>
						</select>
                    </div>
                    <div class="form-group mt-2">
                        <label>Designation</label>
                        <input type="text" name="designation" class="form-control text" placeholder="Enter Desingation" value="${user.designation}" required autocomplete="off">
                    </div>
                    <div class="form-group mt-2">
                        <label>Email ID</label>
                        <input type="text" class="form-control text" placeholder="Enter Email ID" name="email" value="${user.email}" required autocomplete="off"> 
                    </div>
                    <div class="form-group offset-md-4 mt-4 mb-0">
                      <button type="submit" class="btn btn-success">Update</button>
                      <a  class="btn btn-danger mx-3" href="/usereditprofile/${user.email}">Back</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>