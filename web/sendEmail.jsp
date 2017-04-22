<%-- 
    Document   : sendEmail
    Created on : Dec 27, 2016, 3:08:52 AM
    Author     : lenovoo
--%>

<%@page import="Model.Movie.Order"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="java.util.Properties,javax.ejb.LocalBean.*"%>
<%@ page import="javax.mail.*,javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.Session , javax.mail.Transport" %>


<%
    String result;
    // Recipient's email ID needs to be mentioned.
    String to = "abcd@gmail.com";

    // Sender's email ID needs to be mentioned
    String from = "mcmohd@gmail.com";

    // Assuming you are sending email from localhost
    String host = "localhost";

    // Get system properties object
    Properties properties = new Properties();
    properties.put("mail.smtp.host", "smtp.example.com");
    properties.put("mail.smtp.port", 465);
    properties.put("mail.smtp.ssl.enable", true);
    
    Authenticator authenticator = null;
        if (true) {
            properties.put("mail.smtp.auth", true);
            authenticator = new Authenticator() {
                private PasswordAuthentication pa = new PasswordAuthentication("ahmed.elkollaly94@gmail.com", "Loveyou12");

                @Override
                public PasswordAuthentication getPasswordAuthentication() {
                    return pa;
                }
            };
        }
         Session mailSession = Session.getDefaultInstance(properties);
         
    
    // Get the default Session object.
    

    try {
        // Create a default MimeMessage object.
        MimeMessage message = new MimeMessage(mailSession);
        // Set From: header field of the header.
        message.setFrom(new InternetAddress("ahmed.elkollaly94@gmail.com"));
        // Set To: header field of the header.
        message.addRecipient(Message.RecipientType.TO,
                new InternetAddress("ahmed_elkollaly@hotmail.com"));
        // Set Subject: header field
        message.setSubject("This is the Subject Line!");
        // Now set the actual message
        message.setText("This is actual message");
        // Send message
        Transport.send(message);
        result = "Sent message successfully....";
    } catch (MessagingException mex) {
        mex.printStackTrace();
        result = "Error: unable to send message....";
    }
%>
<html>
    <head>
<!--        <title>Send Email using JSP</title>
    </head>
    <body>
    <center>
        <h1>Send Email using JSP</h1>
    </center>
    <p align="center">
        <%
            out.println("Result: " + result + "\n");
        %>
    </p>-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                    <a class="navbar-brand" href="Home Page.html" ><strong style="color:#F5F5F5">Movies</strong> Rental</a>
                </div>
                <ul class="nav navbar-nav navbar-left">
                    <li><a href="#">Dashboard</a></li>
                    <li ><a href="addMovie.jsp">Add Movie</a></li>
                    <li ><a href="updateMovie1.jsp">Update Movie</a></li>
                    <li ><a href="acceptPayment">Accept Payments</a></li>
                    <li class="active"><a href="#">Late Customers</a></li>
                    <li><a href="#">Remove Customer</a></li>
                    <li ><a href="addAdmin.jsp">Add Admin</a></li>
                    <li><a href="#">Profile</a></li>
                </ul>
            </div>
        </nav>




        <div class="container-fluid card" >
            <form action="LateCustomers">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit">
                        <i class="glyphicon glyphicon-refresh"></i>
                    </button> 
                </div>
            </form>
            <div class="card-header" >
                <h4 class="title" style="display: inline-block;margin-left:20px">Send Email</h4>
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
                                    <button type="submit"  class="btn btn-danger">Send Email</button>
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
