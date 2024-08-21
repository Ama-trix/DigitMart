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
                    <li class="nav-item"><a class="nav-link" href="UserOrder.jsp">Order</a></li>
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

    <section class="container container-bg p-4 mt-3 rounded">
        <h5 class="text-dark">Search Product</h5>
        <form action="UserHome.jsp" method="post">
            <div class="row">
                <div class="col-sm mt-2">
                    <input class="form-control" type="search" name="p_name" maxlength="20" placeholder="Product Name" required />
                </div>
                <div class="col-sm mt-2">
                    <button class="btn btn-primary">Search</button>
                </div>
            </div>
        </form>
    </section>

    <%
        String p_name = request.getParameter("p_name");
        if (p_name == null) 
        	p_name="";
    %>
    <section class="container container-bg mt-4 p-4 rounded">
        <h2 class="text-center text-dark mb-4">View All Products</h2>
        <%
            ArrayList<HashMap<String, Object>> products = (ArrayList<HashMap<String, Object>>) db.getProductsLikeName(p_name);
            db.closeConnection();
            for (HashMap<String, Object> product : products) {
        %>
        <div class="product-container row">
            <div class="col-sm-3">
                <img src="GetProductImage?name=<%= product.get("name") %>" height="100px" class="img-fluid rounded" />
            </div>
            <div class="col-sm-9">
                <p class="text-dark">
                    <b>Name:</b> <%= product.get("name") %> &nbsp; &nbsp;
                    <b>Price:</b> <%= product.get("price") %> &nbsp; &nbsp;
                    <b>Company Name:</b> <%= product.get("cname") %> &nbsp; &nbsp;
                    <b>Category:</b> <%= product.get("category") %> &nbsp; &nbsp;
                    <b>Info:</b> <%= product.get("info") %> &nbsp; &nbsp;
                    <b>Quantity:</b> <%= product.get("qty") %>
                </p>
                <form action="AddToCart">
                    <input type="hidden" name="p_name" value="<%= p_name %>" />
                    <input type="hidden" name="name" value="<%= product.get("name") %>" />
                    <button class="btn btn-sm btn-success">Add To Cart</button>
                </form>
            </div>
        </div>
        <%
            }
        %>
    </section>
  
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
