<%@page import="com.net.modal.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String name=(String)session.getAttribute("name");
	String email=(String)session.getAttribute("email");
	if(name==null){
		session.setAttribute("msg", "Please Login First!");
		response.sendRedirect("index.jsp");
	}else{
%>
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
	
	<section class="container">
		<h4 class="bg-success text-white p-3">Cart Items:</h4>
		<%
			int total=0;
			String[] items=db.getAllCartItemsByEmail(email);
			if(items==null){
		%>
			<p>Cart is Empty</p>
		<%
			}else{
				for(String item:items){
		%>
					<div class="bg-light p-2 m-2">
					<p>
						<img src="GetProductImage?name=<%=item  %>" height="50px" />
						Name: <b><%= item  %></b>
						<%
							int price=db.getItemPrice(item);
							total+=price;
						%>
						Price: <b><%= price  %></b>
						<a href="RemoveFromCart?name=<%= item  %>" class="btn btn-sm btn-danger mx-2">Remove</a>
					</p>
				</div>
		<% 
					
				}
			}
			db.closeConnection();
		%>
		<p class="bg-success text-white p-3 text-center">
      	Total Amount: <b><%= total %></b> &nbsp;&nbsp;&nbsp;
      	<% session.setAttribute("total", total); %>
      	<a class="btn btn-sm btn-warning" href="PlaceOrder.jsp">Place Order</a>
      	</p>
	</section>
   
   
</body>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  
</html>
<%
}
%>