<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.net.modal.DAO"%>
<%
String adminName = (String) session.getAttribute("adminName");
if (adminName == null) {
    session.setAttribute("msg", "Please Login First");
    response.sendRedirect("index.jsp");
} else {
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="bg-light">

    <!-- Alert message -->
    <%
    String msg = (String)session.getAttribute("msg");
    if (msg != null) {
    %>
        <div class="alert alert-warning text-center" role="alert">
            <%=msg%>
        </div>
    <%
        session.setAttribute("msg", null);
    }
    %>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-info shadow-sm">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="AdminHome.jsp">DigitMart</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" 
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item">
                        <a class="nav-link active text-light m-2" aria-current="page" href="adminHome.jsp">
                            <i class="bi bi-house-door-fill"></i> Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light m-2" href="enquiries.jsp">
                            <i class="bi bi-envelope-fill"></i> Enquiries
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light m-2" href="Products.jsp">
                            <i class="bi bi-laptop-fill"></i> Add Products
                        </a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link text-light m-2" href="ViewProducts.jsp">
                        <i class="bi bi-laptop-fill"></i> View Products
                    </a>
                </li>
                    <li>
                        <span class="nav-link text-light rounded-pill bg-success m-2 px-3 py-1">
                            Welcome: <b><%=adminName%></b>
                        </span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light bg-danger rounded m-2 btn btn-sm btn-danger" href="../Logout">
                            <i class="bi bi-box-arrow-right"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <section class="container bg-white border rounded p-4 mt-4 shadow-sm">
        <div class="row">
            <div class="col-md-6 bg-success text-white p-4 rounded">
                <h5>Add Category</h5>
                <form action="../AddCategory" method="post">
                    <div class="row">
                        <div class="col-sm-8 mt-2">
                            <input class="form-control" type="text" name="name" maxlength="44" 
                                   placeholder="Category Name" required />
                        </div>
                        <div class="col-sm-4 mt-2">
                            <button class="btn btn-light w-100">Add</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-6  text-white p-4 rounded " style="background-color: #FF7F7F">
                <h5>Delete Category</h5>
                <form action="../DeleteCategory" method="post">
                    <div class="row">
                        <div class="col-sm-8 mt-2">
                            <select class="form-select" name="name">
                                <%
                                DAO db = new DAO();
                                ArrayList<String> categories = (ArrayList<String>) db.getAllCategory();
                                db.closeConnection();
                                for (String category : categories) {
                                %>
                                    <option><%=category%></option>
                                <%
                                }
                                %>
                            </select>
                        </div>
                        <div class="col-sm-4 mt-2">
                            <button class="btn btn-light w-100">Delete</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
	<section class="container text-white mt-3 p-3" style="background-color:rgb(	135, 206, 235,0.5)">
		<h2 class="text-center">Add New Product</h2>
		<form action="../AddProduct" method="post" enctype="multipart/form-data">
			<input class="form-control m-2" type="text" name="name" maxlength="45"
				placeholder="Product Name" required /> 
			<input class="form-control m-2"
				type="number" name="price" min="0" placeholder="Product Price"
				required /> 
			<input class="form-control m-2" type="text" name="cname"
				maxlength="45" placeholder="Company Name" required /> 
			<select name="category" class="form-control m-2">
				<%
				for (String category : categories) {
				%>
				<option><%=category%></option>
				<%
				}
				%>
			</select>
			<label>Select Product Image:</label>
			<input class="form-control m-2" type="file" accept=".jpeg,.jpg,.png" name="image"
				 /> 
			<textarea class="form-control m-2" rows="3" name="info" placeholder="Product Info"  required></textarea>
			<input class="form-control m-2"
				type="number" name="qty" min="1" placeholder="Product Quantity"
				required /> 
			<button class="btn btn-dark m-2" type="submit">Submit</button>
		</form>
		</section>
	
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
            crossorigin="anonymous"></script>
</body>
</html>
<%
}
%>
