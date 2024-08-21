<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><link rel="stylesheet" href="css/style.css">

</head>
<body>
<%@include file="nav.jsp" %>

<div class="container justify-content-center align-items-center bg-muted border border-primary w-50 h-50 mt-5" style="min-height: 70vh;">
	<h2 class="text-center pt-3 ">Login</h2>
    <form class="w-45  m-5" action="UserSignIn">

        <div data-mdb-input-init class="form-outline mb-4">
            <input type="email"  name="email" class="form-control" />
            <label class="form-label">Email address</label>
        </div>
    
    
        <div data-mdb-input-init class="form-outline mb-4">
            <input type="password"  name="pass" class="form-control" />
            <label class="form-label">Password</label>
        </div>
    	<button type="submit"  class="btn btn-primary btn-block mb-4">Sign
            in</button>
    
    
        <div class="text-center">
            <p>Not a member? <a href="Register.jsp">Register</a></p>
           
        </div>
    </form>
  </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>