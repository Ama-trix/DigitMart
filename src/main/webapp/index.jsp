<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold" href="#">DigitMart</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto"> 
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Login</a>
                       
                        <li class="nav-item">
                            <button type="button" class="btn btn-primary m-2" data-bs-toggle="modal" data-bs-target="#contactModal">Contact us
							</button>
                        </li>
                        
                    </ul>
                </div>
            </div>
        </nav>
        <%
	String msg=(String)session.getAttribute("msg");
	if(msg!=null){
%>
	<p class="bg-warning p-2 text-center"> <%=msg %></p>
<%
	session.setAttribute("msg", null);
}
%>
        <!-- Search Bar -->
        <div class="container mt-3 mb-3">
            <div class="row">
                <div class="col-12">
                    <form class="search-bar d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search"
                            aria-label="Search">
                        <button class="btn btn-outline-primary" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </div>
        <div id="carouselExampleAutoplaying" class="carousel slide custom-carousel-height" data-bs-ride="carousel" data-bs-interval="2000">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="resources/accessry1.jpg" class="d-block w-100" alt="Complete Setup">
        </div>
        <div class="carousel-item">
            <img src="resources/complete setup.jpg" class="d-block w-100" alt="Desktop">
        </div>
        <div class="carousel-item">
            <img src="resources/accessory2.jpg" class="d-block w-100" alt="Keyboard">
        </div>
        <div class="carousel-item">
            <img src="resources/keyboard.png" class="d-block w-100" alt="MP3 Player">
        </div>
    </div>
    <button class="carousel-control-prev" type="button"
                data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button"
                data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
</div>


    
    
   

    </header>
<section>
        <div class="container border mt-3">
            <h2 class="text-center fw-bold section-header heading-background">Our Products</h2>
            <div class="row text-center">
                <div class="col-lg-3 col-md-6 col-sm-12">
                    <div class="card m-3">
                        <img src="resources/processor1.jpeg" class="card-img-top" alt="Product 1">
                        <div class="card-body">
                            <h5 class="card-title">Product 1</h5>
                            <p class="card-text">An excellent product that meets all your needs and desires.</p>
                            <a href="#" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12">
                    <div class="card m-3">
                        <img src="resources/mp3 player.jpg" class="card-img-top" alt="Product 2">
                        <div class="card-body">
                            <h5 class="card-title">Product 2</h5>
                            <p class="card-text">Experience the best performance with this top-notch product.</p>
                            <a href="#" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12">
                    <div class="card m-3">
                        <img src="resources/boatheadphones.jpg" class="card-img-top" alt="Product 3">
                        <div class="card-body">
                            <h5 class="card-title">Product 3</h5>
                            <p class="card-text">A perfect blend of style and functionality for everyday use.</p>
                            <a href="#" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12">
                    <div class="card m-3">
                        <img src="resources/processor1.jpeg" class="card-img-top" alt="Product 4">
                        <div class="card-body">
                            <h5 class="card-title">Product 4</h5>
                            <p class="card-text">Innovative design coupled with unmatched performance.</p>
                            <a href="#" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-6 border border-primary">
                    <h2 class="text-center fw-bold section-header heading-background">Products</h2>
                    <div class="row row-cols-1 row-cols-md-2 g-4">
                        <div class="col">
                            <div class="card h-100">
                                <img src="resources/earbuds.jpg" class="card-img-top" alt="Laptop 1">
                                <div class="card-body">
                                    <h5 class="card-title">Earbuds</h5>
                                    <p class="card-text">High performance laptop for all your computing needs.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <img src="resources/phone with lead.jpg" class="card-img-top" alt="Laptop 2">
                                <div class="card-body">
                                    <h5 class="card-title">Earbuds</h5>
                                    <p class="card-text">Sleek design with powerful features.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <img src="resources/buds2.jpg" class="card-img-top" alt="Laptop 3">
                                <div class="card-body">
                                    <h5 class="card-title">Earbuds</h5>
                                    <p class="card-text">Unmatched portability with top-notch performance.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <img src="resources/headphones2.jpg" class="card-img-top" alt="Laptop 4">
                                <div class="card-body">
                                    <h5 class="card-title">Earbuds</h5>
                                    <p class="card-text">Your perfect companion for work and play.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 accessory-section ">
                    <h2 class="text-center fw-bold section-header heading-background">Accessories</h2>
                    <div class="row row-cols-1 row-cols-md-2 g-4">
                        <div class="col">
                            <div class="card h-100">
                                <img src="resources/accessry1.jpg" class="card-img-top" alt="Accessory 1">
                                <div class="card-body">
                                    <h5 class="card-title">Accessory 1</h5>
                                    <p class="card-text">Enhance your setup with this premium accessory.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <img src="resources/accessory2.jpg" class="card-img-top" alt="Accessory 2">
                                <div class="card-body">
                                    <h5 class="card-title">Accessory 2</h5>
                                    <p class="card-text">Top-quality accessory for all your needs.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <img src="resources/accessory3.jpg" class="card-img-top" alt="Accessory 3">
                                <div class="card-body">
                                    <h5 class="card-title">Accessory 3</h5>
                                    <p class="card-text">A must-have for every tech enthusiast.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <img src="resources/accessory4.jpg" class="card-img-top" alt="Accessory 4">
                                <div class="card-body">
                                    <h5 class="card-title">Accessory 4</h5>
                                    <p class="card-text">Designed to perfection for superior performance.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="footer.jsp" %>
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