/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.User;

import Model.Admin.Admin;
import Model.Admin.AdminModel;
import Model.Connection.DBConnection;
import Model.User.User;
import Model.User.UserModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lenovoo
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
    
 
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
            throws ServletException, IOException, SQLException {
        String email,pwd,temp_1,temp_2;
        email = request.getParameter("email");
        pwd = request.getParameter("pwd");
        User user = UserModel.searchUser(email, pwd);
        Admin admin = AdminModel.searchAdmin(email, pwd);
        if(user != null){
            if (user.getPwd().equals(pwd) && user.getEmail().equals(email)) {
                temp_1 = user.getEmail();
                request.setAttribute("email", temp_1);
                temp_2 = user.getPwd();
                request.setAttribute("pwd", temp_2);
                HttpSession session = request.getSession(true);
                session.setAttribute("id", Integer.toString(user.getId()));
                session.setAttribute("fName", user.getFname());
                session.setAttribute("lName", user.getLname());
                session.setAttribute("mobNum", user.getMob_num());
                session.setAttribute("email", user.getEmail());
                session.setAttribute("pwd", user.getPwd());
                session.setAttribute("address", user.getAddress());
                session.setAttribute("city", user.getCity());
                session.setAttribute("zipcode", user.getZipcode());
                session.setMaxInactiveInterval(180);
                request.getServletContext().setAttribute("My_Session", session);
                request.getRequestDispatcher("/Home").forward(request, response);
            }
        
        }else if(admin!=null){
            if (admin.getPassword().equals(pwd) && admin.getEmail().equals(email)) {
                request.setAttribute("admin_email", admin.getEmail());
                request.setAttribute("admin_password", admin.getPassword());
                HttpSession session = request.getSession(true);
                session.setAttribute("admin_id",admin.getId());
                session.setAttribute("admin_email",admin.getEmail() );
                session.setAttribute("admin_password", admin.getPassword());
                session.setMaxInactiveInterval(180);
                request.getServletContext().setAttribute("Admin_Session", session);
                request.getRequestDispatcher("addMovie.jsp").forward(request, response);
            }
        }else{
                response.sendRedirect("/Home");
            

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
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
