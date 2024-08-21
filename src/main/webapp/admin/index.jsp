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
<%
	String msg=(String)session.getAttribute("msg");
	if(msg!=null){
%>
	<p class="bg-warning p-2 text-center"> <%=msg %></p>
<%
	session.setAttribute("msg", null);
}
%>
<div class="container  d-flex justify-content-center align-items-center bg-muted border-primary mt-5">
<form action="../AdminLogin" method="post">
   <h2 class="bg-primary text-center text-white mt-2 p-2 border rounded">Admin Login</h2>
   
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Enter Id</label>
    <input type="text" class="form-control" name="id" aria-describedby="emailHelp">
    
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password"  class="form-control w-0" name="pass">
  </div>
  <button type="submit" class="btn btn-primary m-3">Submit</button>

</form>
 
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>