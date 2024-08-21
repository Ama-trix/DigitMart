<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><link rel="stylesheet" href="css/style.css">
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
                            <a class="nav-link" href="#">Electronics</a>
                        </li>
                        <li class="nav-item">
                            <button type="button" class="btn btn-primary m-2 nav-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">Contact us
							</button>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="call" href="tel:9900000000"><i class="fa-solid fa-mobile-screen-button"></i></a>
                        </li>
                        
                    </ul>
                </div>
            </div>
        </nav>
       
    </header>
    <div class="modal fade" id="contactModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
  <form action="AddEnquiry">
    <div class="modal-content">
    
      <div class="modal-header bg-success">
        <h1 class="modal-title fs-5" id="contactModalLabel">Contact Us</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
	      <div data-mdb-input-init class="form-outline mb-4">
	            <input type="text" placeholder="Enter Your Name"  name="name" class="form-control" />
	            
	        </div>
         <div data-mdb-input-init class="form-outline mb-4">
            <input type="tel" placeholder="Enter Your Phone No"  pattern="[0-9]+" name="phone" class="form-control" />
            
        </div>
    
    
        <div data-mdb-input-init class="form-outline mb-4">
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



</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>