package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Model.Movie.Movie;
import java.util.ArrayList;

public final class browse_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Browse | Movie Rental</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"lib/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"lib/jquery/3.1.1/jquery-3.1.1.min.js\"></script>\n");
      out.write("        <script src=\"lib/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("      .card {\n");
      out.write("        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);\n");
      out.write("        transition: 0.3s;\n");
      out.write("        background-color: white;\n");
      out.write("    \n");
      out.write("\n");
      out.write("\n");
      out.write("      }\n");
      out.write("      body{\n");
      out.write("        background-color: #F5F5F5;\n");
      out.write("      }\n");
      out.write("      h5 {\n");
      out.write("        color:black;\n");
      out.write("      }\n");
      out.write("      .card:hover {\n");
      out.write("        box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);\n");
      out.write("      }\n");
      out.write("\n");
      out.write("      img {\n");
      out.write("        border-radius: 5px 5px 0 0;\n");
      out.write("        width: 202px;\n");
      out.write("      }\n");
      out.write("\n");
      out.write("      .container {\n");
      out.write("        padding: 2px 16px;\n");
      out.write("      }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body  >\n");
      out.write("        <nav class=\"navbar navbar-inverse navbar-fixed-top\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <a class=\"navbar-brand\" href=\"Home Page.html\" ><strong style=\"color:#F5F5F5\">Movies</strong> Rental</a>\n");
      out.write("                </div>\n");
      out.write("                <ul class=\"nav navbar-nav navbar-left\">\n");
      out.write("                    <li ><a href=\"Home Page.html\">Home</a></li>\n");
      out.write("                    <li class=\"active\"><a href=\"Browse Page.html\">Browse</a></li>\n");
      out.write("                </ul>\n");
      out.write("\n");
      out.write("                <ul class=\"nav navbar-nav navbar-right \">\n");
      out.write("                    <form class=\"navbar-form navbar-left\">\n");
      out.write("                        <div class=\"input-group\">\n");
      out.write("                            <input type=\"text\" class=\"form-control\" placeholder=\"Search\">\n");
      out.write("                            <div class=\"input-group-btn\">\n");
      out.write("                                <button class=\"btn btn-default\" type=\"submit\">\n");
      out.write("                                    <i class=\"glyphicon glyphicon-search\"></i>\n");
      out.write("                                </button>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                    <li ><a href=\"shoppingcart.html\"><span class=\"glyphicon glyphicon-shopping-cart\"></span> Shopping Cart</a></li>\n");
      out.write("                    <li><a href=\"#\"><span class=\"glyphicon glyphicon-heart\"></span> Wish List</a></li>\n");
      out.write("                    <li><a href=\"Signup Page.html\"><span class=\"glyphicon glyphicon-user\"></span> Sign Up</a></li>\n");
      out.write("                    <li><a data-toggle=\"modal\" href=\"#Login\"><span class=\"glyphicon glyphicon-log-in\"></span> Login</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <div class=\"optionsSelector row\" style=\"margin:60px;\">\n");
      out.write("            <h3 style=\"text-align:center;margin-bottom:20px\">Browse Movies</h3>\n");
      out.write("            <form action=\"BrowseMovies\" method=\"post\">\n");
      out.write("            <div class=\"col-sm-3\">\n");
      out.write("                \n");
      out.write("                <p>Genre: </p>\n");
      out.write("                <select name=\"genre\" style=\"width:100%\">\n");
      out.write("                    <option value=\"all\" selected=\"selected\">All</option>\n");
      out.write("                    <option value=\"action\">Action</option>\n");
      out.write("                    <option value=\"adventure\">Adventure</option>\n");
      out.write("                    <option value=\"animation\">Animation</option>\n");
      out.write("                    <option value=\"biography\">Biography</option>\n");
      out.write("                    <option value=\"comedy\">Comedy</option>\n");
      out.write("                    <option value=\"crime\">Crime</option>\n");
      out.write("                    <option value=\"documentary\">Documentary</option>\n");
      out.write("                    <option value=\"drama\">Drama</option>\n");
      out.write("                    <option value=\"family\">Family</option>\n");
      out.write("                    <option value=\"fantasy\">Fantasy</option>\n");
      out.write("                    <option value=\"film-noir\">Film-Noir</option>\n");
      out.write("                    <option value=\"game-show\">Game-Show</option>\n");
      out.write("                    <option value=\"history\">History</option>\n");
      out.write("                    <option value=\"horror\">Horror</option>\n");
      out.write("                    <option value=\"music\">Music</option>\n");
      out.write("                    <option value=\"musical\">Musical</option>\n");
      out.write("                    <option value=\"mystery\">Mystery</option>\n");
      out.write("                    <option value=\"news\">News</option>\n");
      out.write("                    <option value=\"reality-tv\">Reality-TV</option>\n");
      out.write("                    <option value=\"romance\">Romance</option>\n");
      out.write("                    <option value=\"sci-fi\">Sci-Fi</option>\n");
      out.write("                    <option value=\"sport\">Sport</option>\n");
      out.write("                    <option value=\"talk-show\">Talk-Show</option>\n");
      out.write("                    <option value=\"thriller\">Thriller</option>\n");
      out.write("                    <option value=\"war\">War</option>\n");
      out.write("                    <option value=\"western\">Western</option>\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"col-sm-3\">\n");
      out.write("                <p>Rating: </p>\n");
      out.write("                <select name=\"rating\" style=\"width:100%\">\n");
      out.write("                    <option value=\"0\" selected=\"selected\">All</option>\n");
      out.write("                    <option value=\"9\">9+</option>\n");
      out.write("                    <option value=\"8\">8+</option>\n");
      out.write("                    <option value=\"7\">7+</option>\n");
      out.write("                    <option value=\"6\">6+</option>\n");
      out.write("                    <option value=\"5\">5+</option>\n");
      out.write("                    <option value=\"4\">4+</option>\n");
      out.write("                    <option value=\"3\">3+</option>\n");
      out.write("                    <option value=\"2\">2+</option>\n");
      out.write("                    <option value=\"1\">1+</option>\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-sm-3\">\n");
      out.write("                <p>Order By: </p>\n");
      out.write("                <select name=\"order_by\" style=\"width:100%\">\n");
      out.write("                    <option value=\"latest\" selected=\"selected\">Latest</option>\n");
      out.write("                    <option value=\"best selling\">Best Selling</option>\n");
      out.write("                    <option value=\"year\">Year</option>\n");
      out.write("                    <option value=\"rating\">Rating</option>\n");
      out.write("                    <option value=\"alphabetical\">Alphabetical</option>\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("                <div class=\"col-sm-3\">\n");
      out.write("                    <br>\n");
      out.write("                    <input type=\"submit\" value=\"Search\" class=\"btn btn-success\">\n");
      out.write("                        \n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div id=\"Login\" class=\"modal fade\" role=\"dialog\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("\n");
      out.write("                <!-- Modal content-->\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                        <h4 class=\"modal-title\" style=\"text-align:center\">Login</h4>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-body row\">\n");
      out.write("                        <form action=\"Login\" method=\"post\">\n");
      out.write("\n");
      out.write("                            <div class=\"form-group\" >\n");
      out.write("                                <label class=\"control-label col-sm-3\" style=\"text-align:right;margin-bottom:20px\" for=\"email\">Email : </label>\n");
      out.write("                                <div class=\"col-sm-9\" style=\"margin-bottom:20px\">\n");
      out.write("                                    <input type=\"email\" class=\"form-control\" name=\"email\" placeholder=\"Enter email\">\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"control-label col-sm-3\" style=\"text-align:right;margin-bottom:20px\" for=\"pwd\">Password : </label>\n");
      out.write("                                <div class=\"col-sm-9\" style=\"margin-bottom:20px\"> \n");
      out.write("                                    <input type=\"password\" class=\"form-control\" name=\"pwd\" placeholder=\"Enter password\">\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <a class=\"col-sm-offset-7 col-sm-3\" href=\"#\" style=\"margin-bottom:20px\">Forget password?</a>\n");
      out.write("                                <div class=\"col-sm-2\" style=\"margin-bottom:20px\">\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-primary\" value=\"Login\">\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("       \n");
      out.write("        ");

// retrieve your list from the request, with casting 
            
            ArrayList<Movie> list = (ArrayList<Movie>) request.getAttribute("moviesResult");
//
//// print the information about every category of the list
           if(list != null){
      out.write("\n");
      out.write("           <div class=\"row\" style=\"margin:40px;margin-left:30px;margin-right:30px\">\n");
      out.write("               ");

            for (Movie movie : list) { 
        String srcName = "img/"+movie.getName()+".jpg"; 
        
        
      out.write("\n");
      out.write("            \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"col-sm-3\" style=\"margin-bottom:20px\">\n");
      out.write("\n");
      out.write("                <div class=\"card \" style=\"width:210px;margin-bottom: 20px\">\n");
      out.write("\n");
      out.write("                    <img class=\"img-responsive\" src= \"");
      out.print(srcName);
      out.write("\" alt=\"Avatar\" style=\"width:100%;height:315px;\" >\n");
      out.write("                    <div class=\"container\" style=\"width: 100%;\">\n");
      out.write("                        <h5 style=\"height: 25px\"><b>");
      out.print(movie.getName());
      out.write(' ');
      out.write(' ');
      out.print(movie.getYear());
      out.write("  </b></h5>\n");
      out.write("                            <p>\n");
      out.write("                                <a href=\"#\" style=\" width: 100%;height:30px\" class=\"btn btn-success\"><span class=\"glyphicon glyphicon-info-sign\"></span> View Details</a>\n");
      out.write("                            </p>\n");
      out.write("\n");
      out.write("                            <p style=\"margin-top:5px;text-align:center\" >\n");
      out.write("                                <a href=\"#\" style=\"height:30px\" class=\"btn btn-primary\"><span class=\"glyphicon glyphicon-plus\"></span> Cart</a> <a href=\"#\" style=\"height:30px\" class=\"btn btn-primary\" ><span class=\"glyphicon glyphicon-plus\"></span> Wish List</a>\n");
      out.write("                            </p>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div> \n");
      out.write("        \n");
      out.write("                            ");

                                }
                            
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            ");

                                }
                            
      out.write("\n");
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
