<%-- 
    Document   : register
    Created on : Dec 23, 2016, 7:18:57 PM
    Author     : lenovoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register | Movie Rental</title>
   
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
<body>
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
          <li class="active"><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
          <li><a data-toggle="modal" href="#Login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
      </div>

    </nav>
  <div class="container-fluid card" style="margin-top:65px">
    
    <div class="content">

      <form action ="UserServices" mehtod= "post" class="form-horizontal">
        <h3 style="text-align:center">Sign up</h3>
        <h5>Personal Info :</h5>
        <hr style="border-color:grey">
        <div class="form-group">
          <label class="control-label col-sm-3" for="fname">First Name:</label>
          <div class="col-sm-3">
            <input type="text" class="form-control" name="fname" placeholder="Enter first name">
          </div>
          <label class="control-label col-sm-3" for="lname">Last Name:</label>
          <div class="col-sm-3">
            <input type="text" class="form-control" name="lname" placeholder="Enter last name">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3" for="mobNum">Mobile Number:</label>
          <div class="col-sm-9"> 
            <input type="text" class="form-control" name="mobNum" placeholder="Enter mobile number">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3" for="email">Email:</label>
          <div class="col-sm-9">
            <input type="email" class="form-control" name="email" placeholder="Enter email">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3" for="pwd">Password:</label>
          <div class="col-sm-9"> 
            <input type="password" class="form-control" name="pwd" placeholder="Enter password">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3" for="pwd2">Confirm Password:</label>
          <div class="col-sm-9"> 
            <input type="password" class="form-control" name="pwd2" placeholder="Confirm password">
          </div>
        </div>
        
         <h5>Billing Info :</h5>
        <hr style="border-color:grey">

        <div class="form-group">
          <label class="control-label col-sm-3" for="address">Address:</label>
          <div class="col-sm-9">
            <input type="text" class="form-control" name="address" placeholder="Enter address">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3" for="city">City:</label>
          <div class="col-sm-9"> 
            <input type="text" class="form-control" name="city" placeholder="Enter city">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3" for="zipcode">Zip Code:</label>
          <div class="col-sm-9"> 
            <input type="text" class="form-control" name="zipcode" placeholder="Enter Zip Code">
          </div>
        </div>

        <div class="form-group"> 
          <div class="col-sm-offset-10 col-sm-2">
            <button type="submit" class="btn btn-success">Register</button>
          </div>
        </div>
      </form>
    </div>
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
          <form action="Login">
            
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
