<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }
        .form-outline input {
            border-radius: 5px;
            padding: 10px;
        }
        .form-outline label {
            margin-left: 5px;
        }
        .btn-primary {
            background-color: #4e73df;
            border-color: #4e73df;
        }
        .btn-primary:hover {
            background-color: #2e59d9;
            border-color: #2653c7;
        }
        .text-center a {
            color: #4e73df;
        }
        .text-center a:hover {
            color: #2e59d9;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="form-container">
            <h2 class="text-center mb-4">User Registration</h2>
            <form action="UserSignUp">
                
                <div class="form-outline mb-3">
                    <label class="form-label" for="form2Example1">Name</label>
                    <input type="text" name="name" class="form-control" />
                </div>
                <div class="form-outline mb-3">
                    <label class="form-label" for="form2Example2">Password</label>
                    <input type="password" required  name="pass" class="form-control" />
                </div>
                <div class="form-outline mb-3">
                    <label class="form-label" for="form2Example1">Email</label>
                    <input type="email" required  name="email" class="form-control" />
                </div>
                <div class="form-outline mb-3">
                    <label class="form-label" for="form2Example1">Phone</label>
                    <input type="tel" required name="phone" class="form-control" />
                </div>
                <div class="form-outline mb-3">
                    <label class="form-label" for="form2Example1">Address</label>
                    <input type="text" name="address" class="form-control" />
                </div>
                <div class="row mb-4">
                    <div class="col d-flex justify-content-center">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
                            <label class="form-check-label" for="form2Example31"> Remember me </label>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-block mb-4">Sign Up</button>
                <div class="text-center">
                    <p>Already a user? <a href="login.jsp">Sign In</a></p>
                </div>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
