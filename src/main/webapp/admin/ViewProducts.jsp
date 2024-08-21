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
    <style>
        body {
            background-color: #f7f9fc;
        }
        .navbar {
            background-color: #4aa3df;
        }
        .navbar-brand {
            font-weight: bold;
            color: #fff;
        }
        .navbar-nav .nav-link {
            color: #f0f0f0;
        }
        .navbar-nav .nav-link:hover {
            color: #cceeff;
        }
        .navbar-nav .nav-link.active {
            background-color: #3b8bbd;
            border-radius: 5px;
        }
        .alert-warning {
            background-color: #fdfd96;
            color: #856404;
        }
        .bg-info {
            background-color: #e0f7fa !important;
            color: #00796b !important;
        }
        .bg-warning {
            background-color: #fff9c4 !important;
        }
        h2 {
            color: #00796b;
            font-weight: bold;
        }
        .product-container {
            background-color: #ffffff;
            border: 1px solid #ececec;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .product-container img {
            border-radius: 5px;
        }
        .product-container p {
            color: #333;
            font-size: 16px;
        }
        .btn-danger {
            background-color: #e57373;
            border: none;
        }
        .btn-danger:hover {
            background-color: #f44336;
        }
    </style>
</head>
<body>

    <!-- Alert message -->
    <%
    String msg = (String) session.getAttribute("msg");
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
    <nav class="navbar navbar-expand-lg navbar-dark shadow-sm">
        <div class="container-fluid">
            <a class="navbar-brand" href="AdminHome.jsp">DigitMart</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" 
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item">
                        <a class="nav-link active m-2" aria-current="page" href="adminHome.jsp">
                            <i class="bi bi-house-door-fill"></i> Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link m-2" href="enquiries.jsp">
                            <i class="bi bi-envelope-fill"></i> Enquiries
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link m-2" href="Products.jsp">
                            <i class="bi bi-laptop-fill"></i> Add Products
                        </a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link m-2" href="ViewProducts.jsp">
                        <i class="bi bi-laptop-fill"></i> View Products
                    </a>
                </li>
                    <li>
                        <span class="nav-link text-light rounded-pill bg-success m-2 px-3 py-1">
                            Welcome: <b><%=adminName%></b>
                        </span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light bg-danger rounded m-2 btn btn-sm" href="../Logout">
                            <i class="bi bi-box-arrow-right"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <section class="container bg-info mt-3 p-3 rounded">
        <h2 class="text-center">View All Products</h2>
        <%
            DAO db = new DAO();
            ArrayList<HashMap<String, Object>> products = (ArrayList<HashMap<String, Object>>) db.getAllProducts();
            db.closeConnection();
            for (HashMap<String, Object> product : products) {
            	session.setAttribute("qty",product.get("qty"));
            	session.setAttribute("price",product.get("price"));
        %>
            <div class="product-container row">
                <div class="col-sm-3">
                    <img src="../GetProductImage?name=<%=product.get("name")%>" height="100px" class="img-fluid" />
                </div>
                <div class="col-sm-9">
                    <p>
                        Name: <b><%= product.get("name") %></b> &nbsp; &nbsp;
                        Price: <b><%= product.get("price") %></b> &nbsp; &nbsp;
                        Company Name: <b><%= product.get("cname") %></b> &nbsp; &nbsp;
                        Category: <b><%= product.get("category") %></b> &nbsp; &nbsp;
                        Info: <b><%= product.get("info") %></b> &nbsp; &nbsp;
                        Quantity: <b><%= product.get("qty") %></b>
                        
                    </p>
                    <a href="../DeleteProduct?name=<%=product.get("name") %>" class="btn btn-sm btn-danger">Delete</a>
            
          </div>
            </div>
        <%
            }
        %>
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
