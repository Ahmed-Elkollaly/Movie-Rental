/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.User;

import Model.Connection.DBConnection;
import java.io.IOException;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lenovoo
 */
@WebServlet(name = "UserModel", urlPatterns = {"/UserModel"})
public class UserModel extends HttpServlet {
    
    public void addUser(String fname,String lname,String mobNum,
                        String email,String pwd,String address,
                        String city,String zipCode) throws SQLException{
        
        
        Connection connection = DBConnection.getActiveConnection();
        if(connection != null){
            
        Statement  stmt = connection.createStatement();
            // Execute SQL query

            String sql;
            sql = "INSERT INTO user(FNAME,LNAME,MOB_NUM,EMAIL,PASSWORD,ADDRESS,CITY,ZIPCODE) VALUES('"
                    + fname + "','" + lname + "','" + mobNum + "','" + email +"','"+pwd+"','"+address+"','"+city+"','"+zipCode + "');";
          
            
            int affectedRows = stmt.executeUpdate(sql);
            String temp = "aslj";
            if(affectedRows < 1){
                String s = "hello world1";
            }else{
                String s = "hello world2";
            }
            
            connection.close();
            stmt.close();
        }
        
    }
    
     
   public static void updateUserDetails(String str_id,String fname,String lname,String mobNum,
                                        String email,String pwd,String address,String city,String zipcode) throws SQLException{
       Connection connection = DBConnection.getActiveConnection();
       
       if (connection != null) {

           Statement stmt = connection.createStatement();
           
           
           // Execute SQL query
           //INSERT INTO user(id,FNAME,LName,MOB_NUM,EMAIL,PASSWORD,ADDRESS,CITY,ZIPCODE)VALUES(13,'w','a','0123','sala7@live.com','text','da','alex','707') ON DUPLICATE KEY UPDATE
           //MOB_NUM ='0123' ,ADDRESS = 'da',CITY='alex' ,ZIPCODE='707';
           String sql;
           int id = Integer.parseInt(str_id);
           sql = "INSERT INTO user(id,FNAME,LName,MOB_NUM,EMAIL,PASSWORD,ADDRESS,CITY,ZIPCODE) VALUES("+id+",'"+
                   fname+"','"+lname+"','"+mobNum +"','"+email+ "','" + pwd + "','" + address + "','" + city + "','" + zipcode + "') "
                   + "ON DUPLICATE KEY UPDATE MOB_NUM = '"+mobNum+"',PASSWORD = '"+pwd+"', ADDRESS = '"+address+"',CITY = '"+city+"',ZIPCODE = '"+zipcode+"';";

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
    
    public static User searchUser(String email, String pwd) throws SQLException {
        Connection connection = DBConnection.getActiveConnection();
        User user = null;
        if (connection != null) {

            Statement stmt = connection.createStatement();
            // Execute SQL query

            String sql;
            sql = "SELECT * from user WHERE email='" + email + "' And password = '" + pwd + "';";
            ResultSet rs = null;

            rs = stmt.executeQuery(sql);
            
               
            if (rs.next()) {
                //Retrieve by column name
                user = new User();
                user.setId(Integer.parseInt(rs.getString("id")));
                user.setFname(rs.getString("fname"));
                user.setLname(rs.getString("lname"));
                user.setMob_num(rs.getString("mob_num"));
                user.setEmail(rs.getString("email"));
                user.setPwd(rs.getString("password"));
                user.setAddress(rs.getString("address"));
                user.setCity(rs.getString("city"));
                user.setZipcode(rs.getString("zipcode"));

            }
            rs.close();
            
            
            connection.close();
            stmt.close();

        }
        return user;
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
