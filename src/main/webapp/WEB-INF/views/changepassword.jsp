<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>Change password</title>
</head>
<body style="background-color: #f4f4f4;">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center bg-primary text-white">
                        <h4>Password Reset</h4>
                    </div>
                    <div class="card-body">
                        <form  id="passwordForm" onsubmit="return validatePassword();" action="/updatepassword" method="post">
                            <div class="mb-3">
                                <label>Password</label>
                        		<input type="password" class="form-control text" placeholder="Enter Password" name="password" id="password" required pattern=".{6,}" autocomplete="off">  
                   			 </div>
                            <div class="mb-3">
                                <label>Confirm Password</label><br>
		                        <input type="password" class="form-control text" placeholder="Confirm Password" name="confirmpassword" id="confirmpassword" required pattern=".{6,}" autocomplete="off">
		                    </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-success">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
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