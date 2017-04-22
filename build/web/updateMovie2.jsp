<%-- 
    Document   : updateMovie2
    Created on : Dec 27, 2016, 1:00:12 AM
    Author     : lenovoo
--%>

<%@page import="Model.Movie.Movie"%>
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
        <%// retrieve your list from the request, with casting 
            Movie movie = (Movie) request.getAttribute("movieDetail");
            //
            //// print the information about every category of the list
            if (movie != null) {
              String genre = "";
            for(int i=0;i<movie.getGenres().size();++i){
                genre += movie.getGenres().get(i);
                genre += ",";
            }
             
             
        %>
        <div class="container-fluid card"  style="margin-top:100px;margin-bottom:50px">

            <div class="content">

                <form action = "UpdateMovie" method="post" class="form-horizontal">
                    <h3 style="text-align:center">Update Movie</h3>

                    <h5>Movie Info :</h5>
                    <hr style="border-color:grey">

                    <div class="form-group">
                        <label class="control-label col-sm-3" for="movieName">Movie Name:</label>
                        <div class="col-sm-9"> 
                            <input type="hidden" name="movie_id" value="<%=movie.getId()%>">
                            <input type="text" class="form-control" name="movieName" value="<%=movie.getName()%>" multiple>
                        </div>
                    </div>
                       
                        
                        
                        
                        
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="pwd2">Genre:</label>

                        <div class="col-sm-9" > 
                            <input type="text" class="form-control" name="genre" value="<%=genre%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="mainActors">Main Actors:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="actor1" value="<%= movie.getActors().get(0)%>">
                        </div>
                        <div class="col-sm-4 col-offset-1">
                            <input type="text" class="form-control" name="actor2" value="<%= movie.getActors().get(1)%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-3 col-sm-4">
                            <input type="text" class="form-control" name="actor3" value="<%= movie.getActors().get(2)%>">
                        </div>
                        <div class="col-sm-4 col-offset-1">
                            <input type="text" class="form-control" name="actor4" value="<%= movie.getActors().get(3)%>">
                        </div>
                    </div>




                    <div class="form-group">
                        <label class="control-label col-sm-3" for="year">Year:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="year" value="<%=movie.getYear()%>">
                        </div>
                        <label class="control-label col-sm-3" for="rating">Rating:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="rating" value="<%=movie.getRating()%>">
                        </div>
                    </div>
                        
                        
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="pwd">Movie Summary:</label>
                        <div class="col-sm-9"> 
                            <textarea class="form-control" name="summary" ><%=movie.getSummary()%>
                            </textarea> 
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="trailerURl">Trailer URL:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="trailerURl" value="<%=movie.getTrailerLink()%>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3" for="rentPrice">Rent Price:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="rentPrice" value="<%=movie.getRentPrice()%>">
                        </div>
                    </div>
                            
                    <div class="form-group"> 
                        <div class="col-sm-offset-9 col-sm-3">
                            <button type="submit" class="btn btn-success">Update Movie</button>
                        </div>
                    </div>
                        
                </form>
                          
            </div>
        </div>
                            <%
                                }
                            %>

    </body>
</html>
