<%-- 
    Document   : browse
    Created on : Dec 24, 2016, 10:59:32 PM
    Author     : lenovoo
--%>

<%@page import="Model.Movie.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Browse | Movie Rental</title>
        <link rel="stylesheet" href="lib/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="lib/jquery/3.1.1/jquery-3.1.1.min.js"></script>
        <script src="lib/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
      .card {
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        transition: 0.3s;
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
                    <a class="navbar-brand" href="home.jsp" ><strong style="color:#F5F5F5">Movies</strong> Rental</a>
                </div>
                <ul class="nav navbar-nav navbar-left">
                    <li ><a href="home.jsp">Home</a></li>
                    <li class="active"><a href="browse.jsp">Browse</a></li>
                </ul>

                <ul class="nav navbar-nav navbar-right ">
                    <form action="Search" class="navbar-form navbar-left">
                        <div class="input-group">
                            <input type="text" name="movie_name" class="form-control" placeholder="Search">
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit">
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                    <li ><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-heart"></span> Wish List</a></li>
                    <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                    <li><a data-toggle="modal" href="#Login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                </ul>
            </div>

        </nav>

        <div class="optionsSelector row" style="margin:60px;">
            <h3 style="text-align:center;margin-bottom:20px">Browse Movies</h3>
            <form action="BrowseMovies" method="post">
            <div class="col-sm-3">
                
                <p>Genre: </p>
                <select name="genre" style="width:100%">
                    <option value="all" selected="selected">All</option>
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

            <div class="col-sm-3">
                <p>Rating: </p>
                <select name="rating" style="width:100%">
                    <option value="0" selected="selected">All</option>
                    <option value="9">9+</option>
                    <option value="8">8+</option>
                    <option value="7">7+</option>
                    <option value="6">6+</option>
                    <option value="5">5+</option>
                    <option value="4">4+</option>
                    <option value="3">3+</option>
                    <option value="2">2+</option>
                    <option value="1">1+</option>
                </select>
            </div>
            <div class="col-sm-3">
                <p>Order By: </p>
                <select name="order_by" style="width:100%">
                    <option value="latest" selected="selected">Latest</option>
                    <option value="best selling">Best Selling</option>
                    <option value="year">Year</option>
                    <option value="rating">Rating</option>
                    <option value="alphabetical">Alphabetical</option>
                </select>
            </div>
                <div class="col-sm-3">
                    <br>
                    <input type="submit" value="Search" class="btn btn-success">
                        
                </div>
            </form>




        </div>

        <div id="Login" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" style="text-align:center">Login</h4>
                    </div>
                    <div class="modal-body row">
                        <form action="Login" method="post">

                            <div class="form-group" >
                                <label class="control-label col-sm-3" style="text-align:right;margin-bottom:20px" for="email">Email : </label>
                                <div class="col-sm-9" style="margin-bottom:20px">
                                    <input type="email" class="form-control" name="email" placeholder="Enter email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" style="text-align:right;margin-bottom:20px" for="pwd">Password : </label>
                                <div class="col-sm-9" style="margin-bottom:20px"> 
                                    <input type="password" class="form-control" name="pwd" placeholder="Enter password">
                                </div>
                            </div>
                            <div class="form-group">
                                <a class="col-sm-offset-7 col-sm-3" href="#" style="margin-bottom:20px">Forget password?</a>
                                <div class="col-sm-2" style="margin-bottom:20px">
                                    <input type="submit" class="btn btn-primary" value="Login">
                                </div>

                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
        <% 
            Movie movie_result = (Movie) request.getAttribute("movie");
            if(movie_result!=null){
                String srcName = "img/"+movie_result.getName()+".jpg"; 
        %>
        <div class="card " style="width:210px;margin: 60px">

                    <img class="img-responsive" src= "<%=srcName%>" alt="Avatar" style="width:100%;height:315px;" >
                    <div class="container" style="width: 100%;">
                        <h5 style="height: 25px"><b><%=movie_result.getName()%>  <%=movie_result.getYear()%>  </b></h5>
                            <p>
                                <a href="#" style=" width: 100%;height:30px" class="btn btn-success"><span class="glyphicon glyphicon-info-sign"></span> View Details</a>
                            </p>

                            <p style="margin-top:5px;text-align:center" >
                                <a href="#" style="height:30px" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Cart</a> <a href="#" style="height:30px" class="btn btn-primary" ><span class="glyphicon glyphicon-plus"></span> Wish List</a>
                            </p>

                    </div>
                </div>
        <%
            }
        %>
        <%
// retrieve your list from the request, with casting 
            
            ArrayList<Movie> list = (ArrayList<Movie>) request.getAttribute("moviesResult");
//
//// print the information about every category of the list
           if(list != null){%>
           <div class="row" style="margin:40px;margin-left:30px;margin-right:30px">
               <%
            for (Movie movie : list) { 
        String srcName = "img/"+movie.getName()+".jpg"; 
        
        %>
            
        
        
            <div class="col-sm-3" style="margin-bottom:20px">

                <div class="card " style="width:210px;margin-bottom: 20px">

                    <img class="img-responsive" src= "<%=srcName%>" alt="Avatar" style="width:100%;height:315px;" >
                    <div class="container" style="width: 100%;">
                        <h5 style="height: 25px"><b><%=movie.getName()%>  <%=movie.getYear()%>  </b></h5>
                            <p>
                                <a href="#" style=" width: 100%;height:30px" class="btn btn-success"><span class="glyphicon glyphicon-info-sign"></span> View Details</a>
                            </p>

                            <p style="margin-top:5px;text-align:center" >
                                <a href="#" style="height:30px" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Cart</a> <a href="#" style="height:30px" class="btn btn-primary" ><span class="glyphicon glyphicon-plus"></span> Wish List</a>
                            </p>

                    </div>
                </div>

            </div> 
        
                            <%
                                }
                            %>
                            </div>
                            <%
                                }
                            %>
    </body>
</html>
