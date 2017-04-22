package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Model.Movie.Movie;

public final class movieDetails_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Movie Details Page</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"lib/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"lib/jquery/3.1.1/jquery-3.1.1.min.js\"></script>\n");
      out.write("        <script src=\"lib/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("        .card {\n");
      out.write("          box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);\n");
      out.write("          transition: 0.3s;\n");
      out.write("          width: 100%;\n");
      out.write("          height: 100%;\n");
      out.write("    \n");
      out.write("\n");
      out.write("\n");
      out.write("        }\n");
      out.write("        body{\n");
      out.write("          background-color: #F5F5F5;\n");
      out.write("        }\n");
      out.write("        h5 {\n");
      out.write("          color:black;\n");
      out.write("        }\n");
      out.write("        .card:hover {\n");
      out.write("          box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        img {\n");
      out.write("          border-radius: 5px 5px 0 0;\n");
      out.write("          width: 202px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .container {\n");
      out.write("          padding: 2px 16px;\n");
      out.write("        }\n");
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
      out.write("                    <li><a href=\"Browse Page.html\">Browse</a></li>\n");
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
      out.write("        ");
// retrieve your list from the request, with casting 
            Movie movie = (Movie) request.getAttribute("movieDetail");
            //
            //// print the information about every category of the list
            if (movie != null) {
                String srcName = "img/" + movie.getName() + ".jpg";
        
      out.write("\n");
      out.write("        <div class=\"media\" style=\"padding:80px\">\n");
      out.write("            <div class=\"media-left media-top\">\n");
      out.write("                <img src=\"");
      out.print(srcName);
      out.write("\" class=\"media-object\" style=\"width:200px\">\n");
      out.write("                <div class=\"btn-group\" style=\"width:100%;margin-top:20px\">\n");
      out.write("                    <button type=\"button\" style=\"width:50%\" class=\"btn btn-success\"><span class=\"glyphicon glyphicon-shopping-cart\"></span></button>\n");
      out.write("                    <button type=\"button\" style=\"width:50%\" class=\"btn btn-warning\"><span class=\"glyphicon glyphicon-heart\"></span></button>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"media-body row\">\n");
      out.write("\n");
      out.write("                <h3 class=\"media-heading col-sm-offset-1 col-sm-11\">");
      out.print(movie.getName());
      out.write("</h3>\n");
      out.write("                <div class=\"col-sm-7\">\n");
      out.write("                    <h4 class=\"col-sm-3 \" style=\"text-align:right\"><b>Year</b>   </h4>\n");
      out.write("                    <h4 class=\"col-sm-9\">");
      out.print(movie.getYear());
      out.write("</h4>\n");
      out.write("\n");
      out.write("                    <h4 class=\"col-sm-3 \" style=\"text-align:right\"><b>Genre</b>   </h4>\n");
      out.write("\n");
      out.write("                    <h4 class=\"col-sm-9\">\n");
      out.write("                        ");

                            int size = movie.getGenres().size();
                            for (int j = 0; j < size - 1; ++j) {
                                out.print(movie.getGenres().get(j) + "/");
                            }
                            out.print(movie.getGenres().get(size - 1));
                        
      out.write("\n");
      out.write("                    </h4>\n");
      out.write("\n");
      out.write("                    <h4 class=\"col-sm-3 \" style=\"text-align:right\"><b>Rating</b>   </h4>\n");
      out.write("                    <h4 class=\"col-sm-9\">");
      out.print(movie.getRating());
      out.write("</h4>\n");
      out.write("\n");
      out.write("                    <h4 class=\"col-sm-3 \" style=\"text-align:right\"><b>Rent Price</b>   </h4>\n");
      out.write("                    <h4 class=\"col-sm-9\">$");
      out.print(movie.getRentPrice());
      out.write("</h4>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-5\">\n");
      out.write("\n");
      out.write("                    <h4 ><b>Actors</b>  </h4>\n");
      out.write("                    ");

                        for (int j = 0; j < movie.getActors().size(); ++j) {
                            out.println("<h4>" + movie.getActors().get(j) + "</h4>");

                        }
                    
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\" style=\"margin-top:30px\">\n");
      out.write("                <div class=\"col-sm-7\">\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <div class=\"embed-responsive embed-responsive-16by9\">\n");
      out.write("                        <!-- src=\"https://www.youtube.com/embed/mAdpJw-MM-M\" -->\n");
      out.write("                        <iframe class=\"embed-responsive-item\" allowfullscreen=\"allowfullscreen\" src=\"");
      out.print(movie.getTrailerLink());
      out.write("\"></iframe>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-5\">\n");
      out.write("                    <h4><b>Summary</b></h4>\n");
      out.write("                    <p>");
      out.print(movie.getSummary());
      out.write("</p>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");

            }
        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
      out.write("        \n");
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
