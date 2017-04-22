<%-- 
    Document   : addAdmin
    Created on : Dec 26, 2016, 1:23:23 AM
    Author     : lenovoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Admin | Movie Rental</title>
        <link rel="stylesheet" href="lib/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="lib/jquery/3.1.1/jquery-3.1.1.min.js"></script>
        <script src="lib/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
       .card {
         box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
         transition: 0.3s;
         width: 50%;

         background-color: white;


       }
       body{
         background-color: #F5F5F5;
       }
       h5 {
         color:black;
       }
       .card:hover {
         box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
       }

       img {
         border-radius: 5px 5px 0 0;
         width: 202px;
       }

       .container {
         padding: 2px 16px;
       }
        </style>
    </head>
    <body  >
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">

                <div class="navbar-header">
                    <a class="navbar-brand" href="#" ><strong style="color:#F5F5F5">Movies</strong> Rental</a>
                </div>
                <ul class="nav navbar-nav navbar-left">
                    <li><a href="#">Dashboard</a></li>
                    <li ><a href="addMovie.jsp">Add Movie</a></li>
                    <li ><a href="updateMovie1.jsp">Update Movie</a></li>
                    <li ><a href="acceptPayment.jsp">Accept Payments</a></li>
                    <li ><a href="#">Late Customers</a></li>
                    <li><a href="#">Remove Customer</a></li>
                    <li class="active"><a href="addAdmin.jsp">Add Admin</a></li>
                    <li><a href="#">Profile</a></li>
                </ul>
            </div>
        </nav>
        <div class="container-fluid card" style="margin-top:80px">

            <div class="content">

                <form action="AddAdmin" method="post" class="form-horizontal">
                    <h3 style="text-align:center">Add Admin</h3>
                    <h5>Admin Info :</h5>
                    <hr style="border-color:grey">

                  
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="email">Email:</label>
                        <div class="col-sm-9"> 
                            <input type="text" class="form-control" name="email" placeholder="Enter admin email" multiple>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="password">Password:</label>
                        <div class="col-sm-9"> 
                            <input type="password" class="form-control" name="password" placeholder="Enter admin password" multiple>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="password">Confirm Password:</label>
                        <div class="col-sm-9"> 
                            <input type="password" class="form-control" name="password2" placeholder="Confirm admin password" multiple>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <div class="col-sm-offset-10 col-sm-2">
                            <button type="submit" class="btn btn-success">Add Admin</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
