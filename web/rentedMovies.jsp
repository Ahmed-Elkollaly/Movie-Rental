<%-- 
    Document   : rentedMovies
    Created on : Dec 25, 2016, 11:39:14 PM
    Author     : lenovoo
--%>

<%@page import="Model.Movie.MovieShopping"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rented Movies | Movie Rental</title>
        <link rel="stylesheet" href="lib/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="lib/jquery/3.1.1/jquery-3.1.1.min.js"></script>
        <script src="lib/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
        .card {
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        transition: 0.3s;
        width: 100%;




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
        .btn-outline {
        background-color: transparent;
        color: inherit;
        transition: all .5s;
        }

        .btn-primary.btn-outline {
        color: #428bca;
        }
        .btn-primary.btn-outline:hover,
        .btn-success.btn-outline:hover,
        .btn-info.btn-outline:hover,
        .btn-warning.btn-outline:hover,
        .btn-danger.btn-outline:hover {
        color: #fff;
        }
    </style>
</head>
<body  >
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">

            <div class="navbar-header">
                <a class="navbar-brand" href="loggedHome.jsp" ><strong style="color:#F5F5F5">Movies</strong> Rental</a>
            </div>
            <ul class="nav navbar-nav navbar-left">
                <li><a href="loggedHome.jsp">Home</a></li>
                <li ><a href="loggedBrowse.jsp">Browse</a></li>
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
                <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-heart"></span> Wish List</a></li>
                <li class="dropdown active">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"> Profile</span> 
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="account.jsp">Account</a> </li>
                        <li class="active"><a href="#">Rented Movies</a></li>
                        <li><a href="#">Orders</a></li>
                        <li><a href="home.jsp">Logout</a></li>
                    </ul>
                </li> 
            </ul>
        </div>
    </nav>
    
    <div class="container-fluid " style="margin-top:65px">
        <form action="MoviesRented">
            <div class="input-group-btn">
                <button class="btn btn-default" type="submit">
                    <i class="glyphicon glyphicon-refresh"></i>
                </button> 
            </div>
        </form>
        <div class="card">
            <div class="card-header" >
                <h4 class="title" style="display: inline-block;margin-left:20px">Rented Movies</h4>
            </div>
            <%
                // retrieve your list from the request, with casting 
                ArrayList< MovieShopping> list = (ArrayList<MovieShopping>) request.getAttribute("moviesRented");
                double total = 0;
//// print the information about every category of the list
                 if (list != null) {%>
            <div class="card-content table-responsive">

                <table class="table" style="padding:15px">
                    <thead class="text-primary">
                    <th>Movie Name</th>
                    <th>Rent Price</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th></th>
                    <th></th>
                    </thead>
                    <tbody>
                        <%
                            for (MovieShopping movie : list) {
                                String srcName = "img/" + movie.getMovie_name() + ".jpg";
                                total += Double.parseDouble(movie.getRentPrice());

                        %>
                        <tr>
                            <td><%=movie.getMovie_name()%></td>
                            <td >$<%=movie.getRentPrice()%></td>
                            <td><%=movie.getStartDate()%></td>
                            <td ><%=movie.getEndDate()%></td>
                            <td>
                                
                                <form >
                                    <input type="submit" class="btn btn-primary btn-outline pull-left" value="Return">
                                </form>
                            </td>
                                
                            <td>
                                <form >
                                    <input type="submit" class="btn btn-primary btn-outline pull-left" value="Extend Renting">
                                
                                </form>
                            </td>
                                
                            

                        </tr>
                       <%
                           }
                       %>

                    </tbody>
                </table>
            </div>
            <%
                }
            %>

        </div>

    </div>

    </body>
</html>
