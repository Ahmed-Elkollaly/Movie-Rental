<%-- 
    Document   : addMovie
    Created on : Dec 24, 2016, 5:48:05 PM
    Author     : lenovoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Movie | Movie Rental</title>
        <link rel="stylesheet" href="lib/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="lib/jquery/3.1.1/jquery-3.1.1.min.js"></script>
        <script src="lib/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="lib/bootstrap-select/1.12.1/css/bootstrap-select.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="lib/bootstrap-select/1.12.1/js/bootstrap-select.min.js"></script>
        <style>
      .card {
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        transition: 0.3s;
        width: 50%;

        background-color: white ;


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
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">

                <div class="navbar-header">
                    <a class="navbar-brand" href="#" ><strong style="color:#F5F5F5">Movies</strong> Rental</a>
                </div>
                <ul class="nav navbar-nav navbar-left">
                    <li><a href="#">Dashboard</a></li>
                    <li class="active"><a href="#">Add Movie</a></li>
                    <li ><a href="updateMovie1.jsp">Update Movie</a></li>
                    <li ><a href="acceptPayment.jsp">Accept Payments</a></li>
                    <li ><a href="#">Late Customers</a></li>
                    <li><a href="#">Remove Customer</a></li>
                    <li><a href="addAdmin.jsp">Add Admin</a></li>
                    <li><a href="#">Profile</a></li>
                </ul>
            </div>
        </nav>
        <div class="container-fluid card"  style="margin-top:80px;margin-bottom:80px">

            <div class="content">

                <form action="AddMovie" method="post" class="form-horizontal">
                    <h3 style="text-align:center">Add Movie</h3>
                    <h5>Movie Info :</h5>
                    <hr style="border-color:grey">

                    <div class="form-group">
                        <label class="control-label col-sm-3" for="movName">Movie Name:</label>
                        <div class="col-sm-9"> 
                            <input type="text" class="form-control" name="movieName" placeholder="Enter Movie Name" multiple>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3" for="pwd2">Genre:</label>

                        <div class="col-sm-9" > 
                            <select  class="selectpicker" name="genres"  multiple style="width:100%">
                                <option value="action">Action</option>
                                <option value="adventure">Adventure</option>
                                <option value="animation">Animation</option>
                                <option value="biography">Biography</option>
                                <option value="comedy">Comedy</option>
                                <option value="crime">Crime</option>
                                <option value="documentary">Documentary</option>
                                <option value="drama">Drama</option>
                                <option value="family">Family</option>
                                <option value="fantasy">Fantasy</option>
                                <option value="film-noir">Film-Noir</option>
                                <option value="game-show">Game-Show</option>
                                <option value="history">History</option>
                                <option value="horror">Horror</option>
                                <option value="music">Music</option>
                                <option value="musical">Musical</option>
                                <option value="mystery">Mystery</option>
                                <option value="news">News</option>
                                <option value="reality-tv">Reality-TV</option>
                                <option value="romance">Romance</option>
                                <option value="sci-fi">Sci-Fi</option>
                                <option value="sport">Sport</option>
                                <option value="talk-show">Talk-Show</option>
                                <option value="thriller">Thriller</option>
                                <option value="war">War</option>
                                <option value="western">Western</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="mainActors">Main Actors:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="actor1" placeholder="1st actor">
                        </div>
                        <div class="col-sm-4 col-offset-1">
                            <input type="text" class="form-control" name="actor2" placeholder="2nd actor">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-3 col-sm-4">
                            <input type="text" class="form-control" name="actor3" placeholder="3rd actor">
                        </div>
                        <div class="col-sm-4 col-offset-1">
                            <input type="text" class="form-control" name="actor4" placeholder="4th actor">
                        </div>
                    </div>




                    <div class="form-group">
                        <label class="control-label col-sm-3" for="year">Year:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="year" placeholder="Enter year">
                        </div>
                        <label class="control-label col-sm-3" for="rating">Rating:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="rating" placeholder="rating">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="pwd">Movie Summary:</label>
                        <div class="col-sm-9"> 
                            <textarea class="form-control" name="summary" placeholder="Enter Movie Summary">
                            </textarea> 
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="trailerURl">Trailer URL:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="trailerURl" placeholder="Enter trailer URL">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3" for="rentPrice">Rent Price:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="rentPrice" placeholder="Enter rent price">
                        </div>
                    </div>
                    <div class="form-group"> 
                        <div class="col-sm-offset-10 col-sm-2">
                            <button type="submit" class="btn btn-success">Add Movie</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
