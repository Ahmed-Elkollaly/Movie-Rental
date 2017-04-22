<%-- 
    Document   : updateMovie1
    Created on : Dec 27, 2016, 1:00:00 AM
    Author     : lenovoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Movie | Movie Rental</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
                    <li class="active" ><a href="#">Update Movie</a></li>
                    <li ><a href="acceptPayment.jsp">Accept Payments</a></li>
                    <li ><a href="#">Late Customers</a></li>
                    <li><a href="#">Remove Customer</a></li>
                    <li ><a href="addAdmin.jsp">Add Admin</a></li>
                    <li><a href="#">Profile</a></li>
                </ul>
            </div>
        </nav>
        <div class="container-fluid card"  style="margin-top:140px;">

            <div class="content">

                <form action = "SearchMovie" method="post" class="form-horizontal">
                    <h3 style="text-align:center">Update Movie</h3>



                    <div class="form-group">
                        <label class="control-label col-sm-3" for="movieName">Movie Name :</label>
                        <div class="col-sm-9"> 
                            <input type="text" class="form-control" name="movieName" placeholder="Enter movie Name" multiple>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <div class="col-sm-offset-9 col-sm-3">
                            <button type="submit" class="btn btn-success">View Movie Details</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
