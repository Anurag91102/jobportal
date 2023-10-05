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
	<title>Verify OTP</title>
 <style>
        /* Add a border to the body wrapper */
        .body-wrapper {
            border: 1px solid black;
            padding: 20px;
            border-radius: 10px;
        }
 </style>
</head>
<body>
	 <div class="container col-md-3 mt-5 body-wrapper">
	 	<div class="alert alert-success" role="alert">
			 OTP Send Successfully..
		</div>
        <div class="text-center">
        <form action="/verifyotp" method="post">
            <div class="mb-3">
                <input type="text" name="otp" required class="form-control" placeholder="Enter OTP">
            </div>
            <button class="btn btn-success" type="submit">Verify</button>
        </form>
        </div>
    </div>	
</body>
</html>