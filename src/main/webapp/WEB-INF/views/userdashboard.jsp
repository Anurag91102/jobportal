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
	<title>User Dashboard</title>
</head>
<body>
    <nav>
        <div class="navbar navbar-expand-lg" style="background:darkgray">
            <div class="col">
			<!--    <a class="btn btn-danger float-end mx-2" href="/logout">Logout</a> -->
       <!--      <a class="btn btn-danger float-end mx-2" href="/userdashboard">Home</a>     -->
				 <a class="nav-link active  float-end m-1 mx-2" href="/logout" >Logout</a>
	             <a class="nav-link active  float-end m-1 " href="/userdashboard">Home</a>
            </div>
        </div>
    </nav>
    <div class="row mt-2">        
          <div class="col text-center offset-md-4">
                <h4>Welcome, ${user.fname}</h4>
          </div>
          <div class="col text-right">
                <a class="btn btn-outline-secondary float-end mx-2" href="/usereditprofile/${user.email}">View Profile</a>
         </div>
      </div>
     <div class="container mt-4">
        <div class="row">
            <div class="col-md-6 offset-md-3">
            	<form action="/userdashboard/search" >
	                <div class="input-group mb-3">
	                    <input type="text" class="form-control" name="query" placeholder="Search users by firstname,lastname,city,designation,qualification" value="${query}"  required>
	                    <button class="btn btn-primary" type="submit">Search</button>
	                </div>
                </form>
            </div>
        </div>
    </div>
    <div class="container mt-4">
      	<c:if test="${not empty results}">
	        <c:forEach var="user" items="${results}">
	            <div class="card mt-3 border-danger">
	                <div class="card-body">
	                    <div class="user-card">
	                    	<a href="/profile/${user.id}" class="btn btn-primary btn-sm offset-md-10">View Profile</a>
	                        <p><strong>First Name:</strong> ${user.fname}</p>
	                       <%--  <p>Id:${user.id}</p> --%>
	                        <p><strong>Last Name:</strong> <c:out value="${user.lname}" /></p>
	                        <p><strong>Qualification:</strong> <c:out value="${user.qualification}"/></p>
	                        <p><strong>Designation:</strong> ${user.designation}</p>
	                    </div>
	                </div>
	            </div>
	        </c:forEach>
	    </c:if>
	   	<c:if test="${noResults}">
	    	<div class="alert alert-warning" role="alert">
	        	<center><h5 class="mt-2">No Such Record Found.</h5></center>
	    	</div>
		</c:if>
	</div>
	
</body>
</html>