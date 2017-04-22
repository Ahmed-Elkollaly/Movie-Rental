<%-- 
    Document   : movieDetails
    Created on : Dec 26, 2016, 3:10:35 PM
    Author     : lenovoo
--%>

<%@page import="Model.Movie.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Details Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="lib/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="lib/jquery/3.1.1/jquery-3.1.1.min.js"></script>
        <script src="lib/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
        .card {
          box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
          transition: 0.3s;
          width: 100%;
          height: 100%;
    


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
                    <li><a href="browse.jsp">Browse</a></li>
                </ul>

                <ul class="nav navbar-nav navbar-right ">
                    <form class="navbar-form navbar-left">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search">
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

        <%// retrieve your list from the request, with casting 
            Movie movie = (Movie) request.getAttribute("movieDetail");
            //
            //// print the information about every category of the list
            if (movie != null) {
                String srcName = "img/" + movie.getName() + ".jpg";
        %>
        <div class="media" style="padding:80px">
            <div class="media-left media-top">
                <img src="<%=srcName%>" class="media-object" style="width:200px">
                <div class="btn-group" style="width:100%;margin-top:20px">
                    <button type="button" style="width:50%" class="btn btn-success"><span class="glyphicon glyphicon-shopping-cart"></span></button>
                    <button type="button" style="width:50%" class="btn btn-warning"><span class="glyphicon glyphicon-heart"></span></button>

                </div>
            </div>
            <div class="media-body row">

                <h3 class="media-heading col-sm-offset-1 col-sm-11"><%=movie.getName()%></h3>
                <div class="col-sm-7">
                    <h4 class="col-sm-3 " style="text-align:right"><b>Year</b>   </h4>
                    <h4 class="col-sm-9"><%=movie.getYear()%></h4>

                    <h4 class="col-sm-3 " style="text-align:right"><b>Genre</b>   </h4>

                    <h4 class="col-sm-9">
                        <%
                            int size = movie.getGenres().size();
                            for (int j = 0; j < size - 1; ++j) {
                                out.print(movie.getGenres().get(j) + "/");
                            }
                            out.print(movie.getGenres().get(size - 1));
                        %>
                    </h4>

                    <h4 class="col-sm-3 " style="text-align:right"><b>Rating</b>   </h4>
                    <h4 class="col-sm-9"><%=movie.getRating()%></h4>

                    <h4 class="col-sm-3 " style="text-align:right"><b>Rent Price</b>   </h4>
                    <h4 class="col-sm-9">$<%=movie.getRentPrice()%></h4>
                </div>
                <div class="col-sm-5">

                    <h4 ><b>Actors</b>  </h4>
                    <%
                        for (int j = 0; j < movie.getActors().size(); ++j) {
                            out.println("<h4>" + movie.getActors().get(j) + "</h4>");

                        }
                    %>


                </div>


            </div>
            <div class="row" style="margin-top:30px">
                <div class="col-sm-7">


                    <div class="embed-responsive embed-responsive-16by9">
                        <!-- src="https://www.youtube.com/embed/mAdpJw-MM-M" -->
                        <iframe class="embed-responsive-item" allowfullscreen="allowfullscreen" src="<%=movie.getTrailerLink()%>"></iframe>
                    </div>
                </div>
                <div class="col-sm-5">
                    <h4><b>Summary</b></h4>
                    <p><%=movie.getSummary()%></p>
                </div>

            </div>
        </div>
        <%
            }
        %>




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
        

    </body>
</html>
