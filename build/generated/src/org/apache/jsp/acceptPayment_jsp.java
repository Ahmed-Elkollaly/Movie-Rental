package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Model.Movie.Order;
import java.util.ArrayList;

public final class acceptPayment_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Accept Payment | Movie Rental</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"lib/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"lib/jquery/3.1.1/jquery-3.1.1.min.js\"></script>\n");
      out.write("        <script src=\"lib/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("  .card {\n");
      out.write("    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);\n");
      out.write("    transition: 0.3s;\n");
      out.write("    width: 75%;\n");
      out.write("    margin-top: 70px;\n");
      out.write("    margin-bottom: 70px;\n");
      out.write("    background-color: white;\n");
      out.write("\n");
      out.write("\n");
      out.write("  }\n");
      out.write("  body{\n");
      out.write("    background-color: #F5F5F5;\n");
      out.write("  }\n");
      out.write("  h5 {\n");
      out.write("    color:black;\n");
      out.write("  }\n");
      out.write("  .card:hover {\n");
      out.write("    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  img {\n");
      out.write("    border-radius: 5px 5px 0 0;\n");
      out.write("    width: 202px;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  .container {\n");
      out.write("    padding: 2px 16px;\n");
      out.write("  }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body  >\n");
      out.write("        <nav class=\"navbar navbar-inverse navbar-fixed-top\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <a class=\"navbar-brand\" href=\"#\" ><strong style=\"color:#F5F5F5\">Movies</strong> Rental</a>\n");
      out.write("                </div>\n");
      out.write("                <ul class=\"nav navbar-nav navbar-left\">\n");
      out.write("                    <li><a href=\"#\">Dashboard</a></li>\n");
      out.write("                    <li ><a href=\"addMovie.jsp\">Add Movie</a></li>\n");
      out.write("                    <li ><a href=\"updateMovie1.jsp\">Update Movie</a></li>\n");
      out.write("                    <li class=\"active\"><a href=\"\">Accept Payments</a></li>\n");
      out.write("                    <li ><a href=\"#\">Late Customers</a></li>\n");
      out.write("                    <li><a href=\"#\">Remove Customer</a></li>\n");
      out.write("                    <li ><a href=\"addAdmin.jsp\">Add Admin</a></li>\n");
      out.write("                    <li><a href=\"#\">Profile</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"container-fluid card\" >\n");
      out.write("            <form action=\"Payments\">\n");
      out.write("                <div class=\"input-group-btn\">\n");
      out.write("                    <button class=\"btn btn-default\" type=\"submit\">\n");
      out.write("                        <i class=\"glyphicon glyphicon-refresh\"></i>\n");
      out.write("                    </button> \n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("            <div class=\"card-header\" >\n");
      out.write("                <h4 class=\"title\" style=\"display: inline-block;margin-left:20px\">Payments Acceptance</h4>\n");
      out.write("            </div>\n");
      out.write("            ");

                // retrieve your list from the request, with casting 
                ArrayList< Order> list = (ArrayList<Order>) request.getAttribute("orders");
                double total = 0;
//// print the information about every category of the list
                  if (list != null) {
      out.write("\n");
      out.write("            <div class=\"card-content table-responsive\">\n");
      out.write("\n");
      out.write("                <table class=\"table\">\n");
      out.write("                    <thead class=\"text-primary\">\n");
      out.write("                    <th>Order Number</th>\n");
      out.write("                    <th>Total Price</th>\n");
      out.write("                    <th></th>\n");
      out.write("\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        ");

                            for (Order order : list) {
                                
                                
                                order.getTotal();

                        
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td>");
      out.print(order.getOrder_id());
      out.write("</td>\n");
      out.write("                            <td >$");
      out.print(order.getTotal());
      out.write("</td>\n");
      out.write("\n");
      out.write("                            <td>\n");
      out.write("                                <form action=\"AcceptPayment\">\n");
      out.write("                                    <input type=\"hidden\" name=\"order_id\" value=\"");
      out.print(order.getOrder_id());
      out.write("\">\n");
      out.write("                                <button type=\"submit\"  class=\"btn btn-success\">Accept Payment</button>\n");
      out.write("                                </form>\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                <form action=\"RejectPayment\">\n");
      out.write("                                    <input type=\"hidden\" name=\"order_id\" value=\"");
      out.print(order.getOrder_id());
      out.write("\">\n");
      out.write("                                <button type=\"submit\"  class=\"btn btn-danger\">Reject</span></button>\n");
      out.write("                                </form>\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");
                            }
                        
      out.write("\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
