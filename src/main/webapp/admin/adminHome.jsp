<%@page import="java.util.HashMap"%>
<%@page import="com.net.modal.DAO"%>
<%@page import="java.util.ArrayList"%>
<%
	String adminName=(String)session.getAttribute("adminName");
	if(adminName==null){
		session.setAttribute("msg", "Please Login First");
		response.sendRedirect("index.jsp");
	}else{
		
	
%>

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
<nav class="navbar navbar-expand-lg navbar-dark bg-info "  style="background-color: #f8f9fa;">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="adminHome.jsp">DigitMart</a>
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
                        <i class="bi bi-laptop-fill"></i> Add Products
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

<section class="container">
      	<h4 class="bg-success text-white p-3">Orders:</h4>
      	<hr/>
 			<%
 				DAO db=new DAO();
 				ArrayList<HashMap> orders=db.getOrders();
 				db.closeConnection();
 				for(HashMap order:orders){
 			%>
 					<div class="bg-warning p-2 m-2">
 						<p>
 							ID: <b><%= order.get("id")  %></b>
 							<% String userEmail=(String)order.get("email"); %>
 							Email: <b><%= userEmail  %></b>
 							<% String status=(String)order.get("status"); %>
 							Status: <b><%= status  %></b>
 							Date: <b><%= order.get("order_date")  %></b>
 							<%
 							if(status.equalsIgnoreCase("Pending")){
 							%>
 								<a href="../ChangeOrderStatusadmin?id=<%= order.get("id") %>&email=<%= 
 								userEmail %>&status=Accepted&page=adminHome" class="btn btn-sm btn-success mx-2">Accept</a>
 								<a href="../ChangeOrderStatusadmin?id=<%= order.get("id") %>&email=<%=
 								
 								userEmail %>&status=Rejected&page=adminHome" class="btn btn-sm btn-danger mx-2">Reject</a>
 							<%	
 							}
 							if(status.equalsIgnoreCase("Accepted")){
 	 						%>
 	 							<a href="../ChangeOrderStatusadmin?id=<%= order.get("id") %>&email=<%=
 	 							userEmail %>&status=Delivered&page=adminHome" class="btn btn-sm btn-success mx-2">Delivered</a>
 	 						<%	
 	 						}
 							%>
 						</p>
 						<hr/>
 						<p>
 							Items: <b><%= order.get("items")  %></b>
 							<hr/>
 							Address: <b><%= order.get("address")  %></b>
 							<hr/>
 							Amount: <b><%= order.get("total")  %></b>
 						</p>
 					</div>
 			<%	
 				}
 			%>
    </section>
    
    <label id="top-button"><i class="fa-solid fa-circle-up fa-2x"></i></label>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>
<%
	}
%>