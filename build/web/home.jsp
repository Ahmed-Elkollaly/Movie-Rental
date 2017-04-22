<%-- 
    Document   : home
    Created on : Dec 23, 2016, 6:53:01 PM
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
        <title>Home | Movie Rental</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="lib/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="lib/jquery/3.1.1/jquery-3.1.1.min.js"></script>
        <script src="lib/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            .card {
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
                transition: 0.3s;
                background: white;




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
            #info {
                position: relative;

                top: -100px;
                width:210px;
                height:315px;

            }
        </style>
    </head>
    <body  > 
        <script type="text/javascript">
                
            function myEnterFunction(){

                document.getElementById("info").style.display = "inline";
                document.getElementById("img").style.opacity = "0.6";
            }
            function myOutFunction(){
                document.getElementById("info").style.display = "none";
                document.getElementById("img").style.opacity = "1";
            }
      
        
          

      
            </script>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">

                <div class="navbar-header">
                    <a class="navbar-brand" href="#" ><strong style="color:#F5F5F5">Movies</strong> Rental</a>
                </div>
                <ul class="nav navbar-nav navbar-left">
                    <li class="active"><a href="#">Home</a></li>
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

        <div class="webIntro" style="margin-top: 100px;" >
            <%
                String email = request.getParameter("email");
                String pwd = request.getParameter("pwd");
//                out.print("<h3>Email : " + email + "</h3>");
//                out.print("<h3>Password :" + pwd + "</h3> ");

            %>


            <form action="Home">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit">
                        <i class="glyphicon glyphicon-refresh"></i>
                    </button> 
                </div>
            </form>
            <h1 style="text-align: center" >Rent the latest movies with the <strong>cheapest</strong> price !</h1>
            <h3 style="text-align: center;margin-top: 50px;" >Welcome to <strong>movie rental</strong></h4>
        </div>


        <%// retrieve your list from the request, with casting 
            ArrayList<Movie> list = (ArrayList<Movie>) request.getAttribute("bestSelling");
            //
            //// print the information about every category of the list
            if (list != null) {%>
        <div class="bestSellers container-fluid" style="margin:40px;">
            <div class="header">
                <h3  >Best Sellers</h4>
                    <hr style="border-color:grey" >
                    <br>
                    </div>
                    <div class="row" style="margin-left:30px;margin-right:30px" >
                        <%
                            for (Movie movie : list) {
                                String srcName = "img/" + movie.getName() + ".jpg";

                        %>
                        <div class="col-sm-3 " style="margin-bottom:20px">
                            <div class="card " style="width:210px">
                                <div>
                                    <!-- onmouseenter="myEnterFunction()"-->
                                    <div id ="img"  onmouseout="myOutFunction()">
                                        <img class="img-responsive"  src="<%=srcName%>" alt="Avatar" style="width:100%;height:315px;" >
                                    </div>
                                <div id ="info" style ="width:100%;display:none"><p style="width:100%">Hello</p> </div>
                                </div>
                                <div class="container" style="width: 100%;">
                                    <h5 style="height: 25px"><b><%=movie.getName()%>  <%=movie.getYear()%></b></h5>
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
                    </div> <!--end div.row-->



        </div><!--end div.bestSeller-->
        <%
            }
        %>
        <!--div newRelease -->
        <%// retrieve your list from the request, with casting 
            ArrayList<Movie> list_2 = (ArrayList<Movie>) request.getAttribute("newRelease");
            //
            //// print the information about every category of the list
            if (list_2 != null) {%>
        <div class="newRelease container-fluid" style="margin:40px;">
            <div class="header">
                <h3  >New Release</h3>
                    <hr style="border-color:grey" >
                    <br>
                    </div>
                    <div class="row" style="margin-left:30px;margin-right:30px" >
                        <%
                            for (Movie movie : list_2) {
                                String srcName = "img/" + movie.getName() + ".jpg";

                        %>
                        <div class="col-sm-3 " style="margin-bottom:20px">
                            <div class="card " style="width:210px">

                                <img class="img-responsive" src="<%=srcName%>" alt="Avatar" style="width:100%;height:315px;" >
                                <div class="container" style="width: 100%;">
                                    <h5 style="height: 25px"><b><%=movie.getName()%>  <%=movie.getYear()%></b></h5>
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
                    </div> <!--end div.row-->



            </div><!--end div.bestSeller-->
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