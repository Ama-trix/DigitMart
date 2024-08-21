<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.net.modal.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");
    if (name == null) {
        session.setAttribute("msg", "Please Login First!");
        response.sendRedirect("index.jsp");
    } else {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DigitMart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <style>
       
        
        .modal-header {
            background-color: #343a40;
            color: white;
        }
        .modal-footer .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
	<% 
		String msg=(String)session.getAttribute("msg");
	 	if(msg!=null){
	%>
			<p class="bg-warning p-2 text-center"> <%= msg %> </p>
	<%	
			session.setAttribute("msg", null);
	 	}
	%>
	
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="index.jsp">DigitMart</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="UserHome.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="UserOrders.jsp">Order</a></li>
                     <li class="nav-item"><a class="nav-link" href="BuildPC.jsp">Build My PC</a></li>
                    <li class="nav-item">
                        <button type="button" class="btn btn-light m-2 nav-btn" data-bs-toggle="modal" data-bs-target="#contactModal">Contact us</button>
                    </li>
                </ul>
                <label id="call" class="border rounded">
                    Welcome: <b><%= name %></b>  
                    <%
                    DAO db = new DAO();
                    int count = db.countCart(email);
                    %>
                    <a class="btn btn-sm btn-light" href="Cart.jsp">Cart [<%= count %>] </a>
                    <a class="btn btn-sm btn-danger" href="Logout">Logout</a>
                </label>
            </div>
        </div>
    </nav>

    <section class="container">
    	<h4 class="bg-success text white p-3">
    		Select Your Address:
    		<button class="btn btn-sm btn-primary"class="btn btn-light m-2 nav-btn" data-bs-toggle="modal" data-bs-target="#addressModal">Add New Address</button>
    	</h4>
    	<form action="OrderPlaced" method="post">
    		<%
    			ArrayList<String> addresses =db.getAddressByEmail(email);
    			for(String address:addresses){
    		%>
    			<input class="p-2 m-2" type="radio" name="address" value="<%=address%>" required /> <%=address%>
    			<br>
    		<%
    			}
    			db.closeConnection();
    		%>
    		<p class="bg-success text-white p-3 text-center">
      			Total Amount: <b><%= session.getAttribute("total") %></b> 
            		<button class="btn btn-warning">Place Order</button>
            </p>
    		
    	</form>
    </section>
    
	<div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header bg-light">
            <h5 class="modal-title text-dark" id="exampleModalLabel" >New Address</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <form action="AddAddress" method="post">
                  <textarea class="form-control" rows="3" name="address" placeholder="Your Address" required></textarea>
                  <br/>
                  <button class="btn btn-primary" >Submit</button>
              </form>
          </div>
        </div>
      </div>
    </div>
  
  
    <div class="modal fade" id="contactModal" tabindex="-1" aria-labelledby="contactModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="AddEnquiry" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="contactModalLabel">Contact Us</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" style="background-color: #f8f9fa;">
                        <div class="form-outline mb-4">
                            <input type="text" placeholder="Enter Your Name" name="name" class="form-control" />
                        </div>
                        <div class="form-outline mb-4">
                            <input type="tel" placeholder="Enter Your Phone No" pattern="[0-9]+" name="phone" class="form-control" />
                        </div>
                        <div class="form-outline mb-4">
                            <input type="text" placeholder="Enter Your Message" name="msg" class="form-control" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
<%
    }
%>
