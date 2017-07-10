<%-- 
    Document   : loggedShoppingCart
    Created on : Dec 25, 2016, 7:00:47 PM
    Author     : lenovoo
--%>

<%@page import="Model.Movie.MovieShopping"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cart | Movie Rental</title>
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
    </style>
</head>

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
            <li class="active"><a href="#" ><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-heart"></span> Wish List</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"> Profile</span> 
                    <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="account.jsp">Account</a> </li>
                    <li><a href="rentedMovies.jsp">Rented Movies</a></li>
                    <li><a href="#">Orders</a></li>
                    <li><a href="home.jsp">Logout</a></li>
                </ul>
            </li> 
        </ul>
    </div>
</nav>


<%
    session = request.getSession(true);

    String id, fname, lname, mobNum, email, pwd, address, city, zipcode;
    id = (String) session.getAttribute("id");
    fname = (String) session.getAttribute("fName");
    lname = (String) session.getAttribute("lName");
    mobNum = (String) session.getAttribute("mobNum");
    email = (String) session.getAttribute("email");
    pwd = (String) session.getAttribute("pwd");
    address = (String) session.getAttribute("address");
    city = (String) session.getAttribute("city");
    zipcode = (String) session.getAttribute("zipcode");


%>
<div class="container-fluid " style="margin-top:65px">
    <form action="ShoppingCart">
        <div class="input-group-btn">
            <button class="btn btn-default" type="submit">
                <i class="glyphicon glyphicon-refresh"></i>
            </button> 
        </div>
    </form>
    <div class="card">
        <div class="card-header" >
            <h4 class="title" style="display: inline-block;margin-left:20px">Shopping Cart</h4>
        </div>



        <%
            // retrieve your list from the request, with casting 
            ArrayList< MovieShopping> list = (ArrayList<MovieShopping>) request.getAttribute("moviesCart");
            double total = 0;
//// print the information about every category of the list
            if (list != null) {%>
        <table class="table">
            <thead class="text-primary">
            <th>Movie Name</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Rent Price</th>
            </thead>

            <tbody>
                <%
                    for (MovieShopping movie : list) {
                        String srcName = "img/" + movie.getMovie_name() + ".jpg";
                        total += Double.parseDouble(movie.getRentPrice());

                %>

                <tr>
                    <td><%=movie.getMovie_name()%></td>
                    <td><%=movie.getStartDate()%></td>
                    <td><%=movie.getEndDate()%></td>
                    <td class="text-primary">$<%=movie.getRentPrice()%></td>
                </tr>

                <%
                    }
                %> 
            
   
            <hr>
            <tr>
                <th class="text-primary">Total Price </th>
                <td></td>
                <td></td>
                <td class="text-primary"><b>$<%=total%></b></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td><a href="#Bill" data-toggle="modal" class="btn btn-success">Checkout</a></td>
            </tr>
            </tbody>
        </table>

        <%
            }
        %>  


    </div>
</div>


        <div id="Bill" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" style="text-align:center">Login</h4>
                    </div>
                    <div class="modal-body row">
                        <form action="AddToPayments" method="post">

                            <div class="form-group" >
                                <label class="control-label col-sm-3" style="text-align:right;margin-bottom:20px" for="email">First Name : </label>
                                <div class="col-sm-3" style="margin-bottom:20px">
                                    <p><%=fname%></p>
                                </div>
                                <label class="control-label col-sm-3" style="text-align:right;margin-bottom:20px" for="email">Last Name : </label>
                                <div class="col-sm-3" style="margin-bottom:20px">
                                    <p><%=lname%></p>
                                </div>
                            </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-3" style="text-align:right;margin-bottom:20px" for="pwd">Mobile Number : </label>
                                        <div class="col-sm-9" style="margin-bottom:20px"> 
                                            <p><%=mobNum%></p>
                                        </div>
                                    </div>
                                        <hr style="border-color:grey">
                            <div class="form-group">
                                <label class="control-label col-sm-3" style="text-align:right;margin-bottom:20px" for="pwd">Address : </label>
                                <div class="col-sm-9" style="margin-bottom:20px"> 
                                    <p><%=address%></p>
                                </div>
                            </div>
                                <hr style="border-color:black">
                                    <div class="form-group">
                                        <label class="control-label col-sm-3" style="text-align:right;margin-bottom:20px" for="pwd">Total Charges : </label>
                                        <div class="col-sm-9" style="margin-bottom:20px"> 
                                            <p>$<%=total%></p>
                                        </div>
                                    </div>
                            <div class="form-group row">
     
                                <input type="submit" class="btn btn-primary  col-sm-offset-8 col-sm-2 col-sm-offset-2 pull-right" style ="margin-right:20px"value="Accept ">
                                

                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
</body>
</html>




