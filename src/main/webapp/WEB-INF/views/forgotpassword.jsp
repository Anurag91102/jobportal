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
	<title>Forgot Password</title>
</head>
	<body>
	<div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="text-center alert alert-success mb-4">
                    <h4>Forgot Password? Dont Worry</h4>
                    <p>Please enter your registered email id below. Once you entered, click 
                    on submit button then you will receive your password on your registered email id. </p>
                </div>
                <c:if test="${not empty requestScope.msg}">
			        <div class="alert alert-danger">
			            ${requestScope.msg}
			        </div>
			    </c:if>
                <form action="/forgothandle" method="post">
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" class="form-control" name="email" placeholder="Enter your email" required autocomplete="off">
                    </div>
                     <div class="text-center mt-3"> 
                    <button type="submit" class="btn btn-primary btn-block">Submit</button>
                    <a href="/login" class="btn btn-danger">Back</a>
                	</div>
                </form>
            </div>
        </div>
    </div>
	</body>
</html>