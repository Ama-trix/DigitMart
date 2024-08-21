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
        body {
            background-color: #f4f4f9;
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        

        .container {
            margin-top: 30px;
        }

        .bg-success {
            background-color: #28a745 !important;
            border-radius: 5px;
            padding: 10px;
        }

        .bg-warning {
            background-color: #ffc107 !important;
            border-radius: 5px;
            padding: 15px;
        }

        .product-container {
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .modal-header {
            background-color: #343a40;
            color: white;
        }

        .modal-footer  {
            background-color: #007bff;
            border: none;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-light {
            background-color: #f8f9fa;
            border-color: #e0e0e0;
            color: #333;
        }

        .btn-light:hover {
            background-color: #e0e0e0;
        }

        .modal-body {
            background-color: #f4f4f9;
        }

        label#call {
            font-weight: bold;
            color: #007bff;
            margin-right: 20px;
        }

        #top-button {
            position: fixed;
            bottom: 30px;
            right: 30px;
            cursor: pointer;
            display: none;
        }

        #top-button i {
            color: #007bff;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="index.html">DigitMart</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="UserHome.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="UserOrder.jsp">Order</a></li>
                    <li class="nav-item"><a class="nav-link" href="BuildPC.jsp">Build My PC</a></li>
                    <li class="nav-item">
                        <button type="button" class="btn btn-light m-2 nav-btn" data-bs-toggle="modal" data-bs-target="#contactModal">Contact us</button>
                    </li>
                </ul>
                <label id="call" class="border rounded form-floating">
                    Welcome: <b><%= name %></b>  
                    <%
                    DAO db = new DAO();
                    int count = db.countCart(email);
                    %>
                    <a class="btn btn-sm btn-light border" href="Cart.jsp">Cart [<%= count %>] </a>
                    <a class="btn btn-sm btn-danger" href="Logout">Logout</a>
                </label>
            </div>
        </div>
    </nav>

    <section class="container">
      	<h4 class="bg-success text-white p-3">Orders:</h4>
      	<hr/>
 			<%
 				ArrayList<HashMap> orders=db.getOrdersByEmail(email);
 				db.closeConnection();
 				for(HashMap order:orders){
 			%>
 					<div class="product-container">
 						<p>
 							ID: <b><%= order.get("id")  %></b><br>
 							<% String status=(String)order.get("status"); %>
 							Status: <b><%= status  %></b><br>
 							Date: <b><%= order.get("order_date")  %></b><br>
 							<%
 							if(status.equalsIgnoreCase("Pending") || status.equalsIgnoreCase("Accepted")){
 							%>
 							<a href="ChangeOrderStatus?id=<%= order.get("id") %>&email=<%= email %>&status=Canceled&page=UserOrder" class="btn btn-sm btn-danger mx-2">Cancel</a>
 							<%	
 							}
 							%>
 						</p>
 						<hr/>
 						<p>
 							Items: <b><%= order.get("items")  %></b><br>
 							<hr/>
 							Address: <b><%= order.get("address")  %></b><br>
 							<hr/>
 							Amount: <b><%= order.get("total")  %></b>
 						</p>
 					</div>
 			<%	
 				}
 			%>
    </section>
    
    <label id="top-button"><i class="fa-solid fa-circle-up fa-2x"></i></label>
    
    <div class="modal fade" id="contactModal" tabindex="-1" aria-labelledby="contactModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="AddEnquiry">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="contactModalLabel">Contact Us</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
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
