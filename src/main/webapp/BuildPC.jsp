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
        
        .container-bg {
            background-color: #f8f9fa;
        }
        .product-container {
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 15px;
        }
        .modal-header {
            background-color: #343a40;
            color: white;
        }
        .modal-footer  {
            background-color: #007bff;
            border: none;
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
                    Welcome: <b class=""><%= name %></b>  
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

    <section class="container bg-info mt-3 text-white p-2">
    		<h5 class="text-center">Build My PC</h5>
		<form action="AddPcToCart" method="post" >
        		<label>Select Mother Board:</label>
        		<select name="motherboard" class="form-control">
				<%
				ArrayList<String> list = (ArrayList<String>)db.getProductByCategory("Motherboard");
				for (String motherboard : list) {
				%>
				<option><%=motherboard%></option>
				<%
				}
				%>
			</select>
        		<label>Select Processor:</label>
        		<select name="processor" class="form-control">
				<%
				list = (ArrayList<String>) db.getProductByCategory("Processor");
				for (String processor : list) {
				%>
				<option><%=processor%></option>
				<%
				}
				%>
			</select>
			<label>Select RAM:</label>
        		<select name="ram" class="form-control">
				<%
				list = (ArrayList<String>) db.getProductByCategory("RAM");
				for (String ram : list) {
				%>
				<option><%=ram%></option>
				<%
				}
				%>
			</select>
			<label>Select Hard Disk:</label>
        		<select name="harddisk" class="form-control">
				<%
				list = (ArrayList<String>) db.getProductByCategory("HardDisk");
				for (String harddisk : list) {
				%>
				<option><%=harddisk%></option>
				<%
				}
				%>
			</select>
			<label>Select keyboard:</label>
        		<select name="keyboard" class="form-control">
				<%
				list = (ArrayList<String>) db.getProductByCategory("keyboard");
				for (String keyboard : list) {
				%>
				<option><%=keyboard%></option>
				<%
				}
				%>
			</select>
			<label>Select Mouse:</label>
        		<select name="mouse" class="form-control">
				<%
				list = (ArrayList<String>) db.getProductByCategory("mouse");
				for (String mouse : list) {
				%>
				<option><%=mouse%></option>
				<%
				}
				%>
			</select>
			<label>Select Web Cam:</label>
        		<select name="webcam" class="form-control">
				<%
				list = (ArrayList<String>) db.getProductByCategory("webcam");
				for (String webcam : list) {
				%>
				<option><%=webcam%></option>
				<%
				}
				%>
			</select>
			<label>Select UPS:</label>
        		<select name="ups" class="form-control">
				<%
				list = (ArrayList<String>) db.getProductByCategory("ups");
				for (String ups : list) {
				%>
				<option><%=ups%></option>
				<%
				}
				%>
			</select>
			<label>Select Cabinate:</label>
        		<select name="cabinate" class="form-control">
				<%
				list = (ArrayList<String>) db.getProductByCategory("Cabinate");
				for (String Cabinate : list) {
				%>
				<option><%=Cabinate%></option>
				<%
				}
				%>
			</select>
			<br/>
        		<button class="btn btn-dark my-2" type="submit">Build</button>
          	</form>
            </section>
    

     <label id="top-button"><i class="fa-solid fa-circle-up fa-2x"></i></label>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>
<%
    }
%>
