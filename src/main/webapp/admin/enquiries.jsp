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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="bg-light">
    <%
        String msg = (String) session.getAttribute("msg");
        if (msg != null) {
    %>
        <div class="alert alert-warning text-center" role="alert">
            <%= msg %>
        </div>
    <%
        session.setAttribute("msg", null);
        }
    %>

    <!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-info">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="#">DigitMart</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item">
                    <a class="nav-link active text-light m-2" aria-current="page" href="AdminHome.jsp">
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
                        <i class="bi bi-laptop-fill"></i>Add Products
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-light m-2" href="ViewProducts.jsp">
                        <i class="bi bi-laptop-fill"></i> View Products
                    </a>
                </li>
                <li>
                    <span class="nav-link text-light rounded-pill bg-success m-2 px-3 py-1">Welcome: <b><%= adminName %></b></span>
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


    <!-- Enquiries Section -->
    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <h2 class="text-center text-primary mb-4">Enquiries</h2>
                <div class="list-group">
                <%
                    DAO db = new DAO();
                    ArrayList<HashMap<String, Object>> enquiries = (ArrayList<HashMap<String, Object>>) db.getAllEnquiries();
                    for (HashMap<String, Object> enquiry : enquiries) {
                        String status = (String) enquiry.get("status");
                %>
                    <div class="list-group-item list-group-item-action flex-column align-items-start mb-3  p-3 rounded" style="background-color:rgb(	135, 206, 235,0.7)">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">ID: <b><%= enquiry.get("id") %></b></h5>
                            <small>Date: <b><%= enquiry.get("e_date") %></b></small>
                        </div>
                        <p class="mb-1">Name: <b><%= enquiry.get("name") %></b></p>
                        <p class="mb-1">Phone: <b><%= enquiry.get("phone") %></b></p>
                        <p class="mb-1">Message: <b><%= enquiry.get("msg") %></b></p>
                        <p class="mb-1">Status: <b><%= status %></b></p>
                        <%
                            if (status.equalsIgnoreCase("pending")) {
                        %>
                            <a href="../ChangeEnquiryStatus?id=<%= enquiry.get("id") %>" class="btn btn-warning btn-sm mt-2">Done</a>
                        <%
                            }
                        %>
                    </div>
                <%
                    }
                %>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
<%
    }
%>
