<%-- 
    Document   : account
    Created on : Dec 24, 2016, 3:29:41 AM
    Author     : lenovoo
--%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account | Movie Rental</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="lib/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="lib/jquery/3.1.1/jquery-3.1.1.min.js"></script>
        <script src="lib/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
  .card {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    width: 50%;

    


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
                    <li><a href="loggedShoppingCart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-heart"></span> Wish List</a></li>
                    <li class="dropdown active">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"> Profile</span> 
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li class="active"><a href="#">Account</a> </li>
                            <li ><a href="#">Rented Movies</a></li>
                            <li><a href="#">Orders</a></li>
                            <li><a href="home.jsp">Logout</a></li>
                        </ul>
                    </li> 
                </ul>
            </div>
        </nav>
        <%
            session = request.getSession(true);
            
            String id,fname,lname,mobNum,email,pwd,address,city,zipcode;
            id = (String)session.getAttribute("id");
            fname = (String)session.getAttribute("fName");
            lname = (String)session.getAttribute("lName");
            mobNum = (String)session.getAttribute("mobNum");
            email = (String)session.getAttribute("email");
            pwd = (String)session.getAttribute("pwd");
            address = (String)session.getAttribute("address");
            city = (String)session.getAttribute("city");
            zipcode = (String)session.getAttribute("zipcode");
            
            
        %>
        
        <div class="container-fluid card" style="margin-top:65px">

            <div class="content">

                <form action="UserDetails" method="post" class="form-horizontal">
                    <h5>Personal Info :</h5>
                    <hr style="border-color:grey">
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="fname">First Name:</label>
                        <label class="control-label col-sm-3" style="text-align:left"><%=fname%></label>
                        <label class="control-label col-sm-3" for="lname">Last Name:</label>
                        <label class="control-label col-sm-3" style="text-align:left"><%=lname%></label>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="mobNum">Mobile Number:</label>
                        <div class="col-sm-9"> 
                            <input type="text" class="form-control" name="mobNum" value="<%=mobNum%>" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="email">Email:</label>
                        <label class="control-label col-sm-9" style="text-align:left"><%=email%></label>

                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="pwd">Password:</label>
                        <div class="col-sm-9"> 
                            <input type="password" class="form-control" name="pwd" value="<%=pwd%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="pwd2">Confirm Password:</label>
                        <div class="col-sm-9"> 
                            <input type="password" class="form-control" name="pwd2" value="<%=pwd%>">
                        </div>
                    </div>

                    <h5>Billing Info :</h5>
                    <hr style="border-color:grey">

                    <div class="form-group">
                        <label class="control-label col-sm-3" for="address">Address:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="address" value="<%=address%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="city">City:</label>
                        <div class="col-sm-9"> 
                            <input type="text" class="form-control" name="city" value="<%=city%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="zipcode">Zip Code:</label>
                        <div class="col-sm-9"> 
                            <input type="text" class="form-control" name="zipcode" value="<%=zipcode%>">
                        </div>
                    </div>

                    <div class="form-group"> 
                        <div class="col-sm-offset-9 col-sm-3">
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>



    </body>
</html>

