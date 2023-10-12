<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">	
	<title>Admin Dashboard</title>
	
</head>
<body>
	<nav>
        <div class="navbar navbar-expand-lg" style="background:darkgray">
            <div class="col m-2">
	<!--             <a class="btn btn-outline-danger float-end mx-2" href="/logout">Logout</a>
            <a class="btn btn-outline-danger float-end mx-2" href="/admin_dashboard">Home</a> -->   
               <a class="nav-link active float-end " href="/logout" >Logout</a>
             <a class="nav-link active float-end mx-3" href="/admin_dashboard">Home</a>     
            </div>
        </div>
    </nav>
    <div class="row mt-2">
          <div class="col text-center">
                <h4>Welcome, Admin</h4>
          </div>
     </div>	     
     <div class="container mt-4">
        <div class="row">
            <div class="col-md-6 offset-md-3">
            	<form action="/admin_dashboard/adminsearch">
	                <div class="input-group mb-3">
	                    <input type="text" class="form-control" name="query" placeholder="Search users by firstname,lastname,city,designation,qualification" value="${query}" required autocomplete="off">
	                    <button class="btn btn-primary" type="submit">Search</button>
	                </div>
                </form>
            </div>
        </div>
    </div>
    <div class="container mt-4">
      	<c:if test="${not empty results}">
	        <c:forEach var="user" items="${results}">
	            <div class="card mt-3 border-secondary">
	                <div class="card-body">
	                    <div class="user-card">
	                    	<a href="/adminprofile/${user.id}" class="btn btn-primary  offset-md-10"><i class="fas fa-eye"></i></a>
	                    	<a href="/admin_userupdate/${user.id}" class="btn btn-success"><i class="fas fa-edit"></i></a>
	                    	<a href="/deleteUser/${user.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this user?');"> <i class="fas fa-trash-alt"></i></a>
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
	    	<div class="alert alert-danger" role="alert">
	        	<center><h5 class="mt-2">No Such Record Found.</h5></center>
	    	</div>
		</c:if>
	</div>
</body>
</html>