/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Admin;

import Model.Connection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lenovoo
 */
@WebServlet(name = "AdminModel", urlPatterns = {"/AdminModel"})
public class AdminModel extends HttpServlet {

    
    public void addAdmin(String email,String password) throws SQLException{
        Connection connection = DBConnection.getActiveConnection();
        if (connection != null) {

            Statement stmt = connection.createStatement();
            // Execute SQL query

            String sql;
           
            sql = "INSERT INTO admin(ADMIN_EMAIL,ADMIN_PASSWORD) VALUES('"
                    + email + "','" + password +"')"
                    + "ON DUPLICATE KEY UPDATE ADMIN_EMAIL = '" + email +"';";

            int affectedRows = stmt.executeUpdate(sql);

            String temp = "aslj";
            if (affectedRows < 1) {
                String s = "hello world1";
            } else {
                String s = "hello world2";
            }

            connection.close();
            stmt.close();
        }
    }
    public static Admin searchAdmin(String email, String pwd) throws SQLException {
        Connection connection = DBConnection.getActiveConnection();
        Admin admin = null;
        if (connection != null) {

            Statement stmt = connection.createStatement();
            // Execute SQL query

            String sql;
            sql = "SELECT * from admin WHERE ADMIN_EMAIL='" + email + "' And ADMIN_PASSWORD = '" + pwd + "';";
            ResultSet rs = null;

            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                //Retrieve by column name
                admin = new Admin();
                admin.setId(Integer.parseInt(rs.getString("ADMIN_ID")));
                admin.setEmail(rs.getString("ADMIN_EMAIL"));
                admin.setPassword(rs.getString("ADMIN_PASSWORD"));
              

            }
            rs.close();

            connection.close();
            stmt.close();

        }
        return admin;
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminModel</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminModel at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
