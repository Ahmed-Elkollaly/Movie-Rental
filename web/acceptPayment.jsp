<%-- 
    Document   : acceptPayment
    Created on : Dec 26, 2016, 9:40:14 PM
    Author     : lenovoo
--%>

<%@page import="Model.Movie.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accept Payment | Movie Rental</title>
        <link rel="stylesheet" href="lib/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="lib/jquery/3.1.1/jquery-3.1.1.min.js"></script>
        <script src="lib/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
  .card {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    width: 75%;
    margin-top: 70px;
    margin-bottom: 70px;
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
                    <li ><a href="updateMovie1.jsp">Update Movie</a></li>
                    <li class="active"><a href="">Accept Payments</a></li>
                    <li ><a href="#">Late Customers</a></li>
                    <li><a href="#">Remove Customer</a></li>
                    <li ><a href="addAdmin.jsp">Add Admin</a></li>
                    <li><a href="#">Profile</a></li>
                </ul>
            </div>
        </nav>




        <div class="container-fluid card" >
            <form action="Payments">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit">
                        <i class="glyphicon glyphicon-refresh"></i>
                    </button> 
                </div>
            </form>
            <div class="card-header" >
                <h4 class="title" style="display: inline-block;margin-left:20px">Payments Acceptance</h4>
            </div>
            <%
                // retrieve your list from the request, with casting 
                ArrayList< Order> list = (ArrayList<Order>) request.getAttribute("orders");
                double total = 0;
//// print the information about every category of the list
                  if (list != null) {%>
            <div class="card-content table-responsive">

                <table class="table">
                    <thead class="text-primary">
                    <th>Order Number</th>
                    <th>Total Price</th>
                    <th></th>

                    </thead>
                    <tbody>
                        <%
                            for (Order order : list) {
                                
                                
                                order.getTotal();

                        %>
                        <tr>
                            <td><%=order.getOrder_id()%></td>
                            <td >$<%=order.getTotal()%></td>

                            <td>
                                <form action="AcceptPayment">
                                    <input type="hidden" name="order_id" value="<%=order.getOrder_id()%>">
                                <button type="submit"  class="btn btn-success">Accept Payment</button>
                                </form>
                            </td>
                            <td>
                                <form action="RejectPayment">
                                    <input type="hidden" name="order_id" value="<%=order.getOrder_id()%>">
                                <button type="submit"  class="btn btn-danger">Reject</span></button>
                                </form>
                            </td>
                        </tr>
                        <%                            }
                        %>
                    </tbody>
                </table>
            </div>
                        <%
                            }
                        %>


        </div>
    </body>
</html>
