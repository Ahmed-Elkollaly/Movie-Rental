/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Movie;

import Model.Admin.Admin;
import Model.Connection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
@WebServlet(name = "MovieModel", urlPatterns = {"/MovieModel"})
public class MovieModel extends HttpServlet {

    public void addMovie(String name,ArrayList<String> genre,ArrayList<String> actors,
                         String year,String rating,String summary,
                         String trailerLink,String rentPrice) throws SQLException{
        
        Connection connection = DBConnection.getActiveConnection();
        if (connection != null) {

            Statement stmt = connection.createStatement();
            // Execute SQL query

            String sql;
            
            sql = "INSERT INTO movie(NAME,YEAR,RATING,SUMMARY,TRAILER_LINK,RENT_PRICE) VALUES('"
                    + name + "','" + year + "','" + rating + "','" + summary + "','" + trailerLink + "','" + rentPrice +"');";

            int affectedRows = stmt.executeUpdate(sql);
            
            ResultSet rs = null;
            int movie_id=0;
            rs = stmt.executeQuery("SELECT MOVIE_ID FROM movie WHERE NAME = '"+name+"';");
            if (rs.next()) {
                movie_id = rs.getInt(1);
            }
            int genre_id=0,actor_id=0;
            for(int i=0;i<genre.size();++i){
                rs = null;
                genre_id =0;
                sql= "INSERT INTO genre(GENRE_NAME) VALUES('"+genre.get(i)+"')\n"
                        + "ON DUPLICATE KEY UPDATE GENRE_NAME = '"+genre.get(i)+"';";
                affectedRows = stmt.executeUpdate(sql);
                
                rs = stmt.executeQuery("SELECT GENRE_ID FROM genre WHERE GENRE_NAME = '" + genre.get(i) + "';");
                if (rs.next()) {
                    genre_id = rs.getInt(1);
                }
                
                sql = "INSERT INTO genre_movie(GENRE_ID,MOVIE_ID) VALUES("+genre_id+","+movie_id+");";
                affectedRows = stmt.executeUpdate(sql);
            }
            for(int i=0;i<actors.size();++i){
                rs = null;
                actor_id =0;
                sql = "INSERT INTO actor(ACTOR_NAME) VALUES('"+actors.get(i)+"')\n"
                        + "ON DUPLICATE KEY UPDATE ACTOR_NAME = '"+actors.get(i)+"';";
                affectedRows = stmt.executeUpdate(sql);
                
                rs = stmt.executeQuery("SELECT ACTOR_ID FROM actor WHERE ACTOR_NAME = '" + actors.get(i) + "';");
                if (rs.next()) {
                    actor_id = rs.getInt(1);
                }
                
                sql = "INSERT INTO movie_actors(MOVIE_ID,ACTOR_ID) VALUES("+movie_id+","+actor_id+");";
                affectedRows = stmt.executeUpdate(sql);
            }

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
    public Movie searchMovie(String movie_name) throws SQLException{
        Connection connection = DBConnection.getActiveConnection();
        Movie movie = null;
        if (connection != null) {

            Statement stmt = connection.createStatement();
            Statement stmt_2 = connection.createStatement();
            Statement stmt_3 = connection.createStatement();
            Statement stmt_4 = connection.createStatement();
            Statement stmt_5 = connection.createStatement();
            // Execute SQL query

            String sql;
            sql = "SELECT * from movie WHERE NAME='" + movie_name +"';";
            ResultSet result = null;

            result = stmt.executeQuery(sql);

            if (result.next()) {
                movie = new Movie();
                movie.setId(result.getInt("MOVIE_ID"));
                movie.setName(result.getString("NAME"));
                movie.setYear(result.getString("YEAR"));
                movie.setRating(result.getString("RATING"));
                movie.setSummary(result.getString("SUMMARY"));
                movie.setTrailerLink(result.getString("TRAILER_LINK"));
                movie.setRentPrice(result.getString("RENT_PRICE"));
                

            }
            result.close();
            if(movie!=null){
                sql = "SELECT GENRE_ID FROM genre_movie WHERE MOVIE_ID = " + movie.getId();
                ResultSet result2 = stmt_2.executeQuery(sql);
                ArrayList<String> genre = new ArrayList<>();
                while (result2.next()) {
                    sql = "SELECT GENRE_NAME FROM genre WHERE GENRE_ID = "+ result2.getInt("GENRE_ID");
                    ResultSet rs = stmt_3.executeQuery(sql);
                    if(rs.next()){
                        genre.add(rs.getString("GENRE_NAME"));
                    }
                    rs.close();
                }
                movie.setGenres(genre);
                result2.close();
                sql = "SELECT ACTOR_ID FROM movie_actors WHERE MOVIE_ID = " + movie.getId();
                ResultSet result3 = stmt_4.executeQuery(sql);
                ArrayList<String> actors = new ArrayList<>();
                while (result3.next()) {
                    sql = "SELECT ACTOR_NAME FROM actor WHERE ACTOR_ID = " + result3.getInt("ACTOR_ID");
                    ResultSet rs2 = stmt_5.executeQuery(sql);
                    if (rs2.next()) {
                        actors.add(rs2.getString("ACTOR_NAME"));
                    }
                    rs2.close();
                }
                movie.setActors(actors);
                result3.close();
            }
            connection.close();
            stmt.close();

        }
        return movie;
    }
    public void updateMovie(int movie_id,String name, ArrayList<String> genre, ArrayList<String> actors,
            String year, String rating, String summary,
            String trailerLink, String rentPrice) throws SQLException{
        Connection connection = DBConnection.getActiveConnection();
        if (connection != null) {

            Statement stmt = connection.createStatement();
            // Execute SQL query

            String sql;

            sql = "INSERT INTO movie(MOVIE_ID,NAME,YEAR,RATING,SUMMARY,TRAILER_LINK,RENT_PRICE) VALUES("+movie_id+",'"
                    + name + "','" + year + "','" + rating + "','" + summary + "','" + trailerLink + "','" + rentPrice + "') "
                    +" ON DUPLICATE KEY UPDATE NAME = '"+name+"' ,YEAR = '"+year+"' , RATING = '"+rating+
                    "' ,SUMMARY = '"+summary+"' ,TRAILER_LINK = '"+trailerLink+"' ,RENT_PRICE = '"+rentPrice+"'; ";

            int affectedRows = stmt.executeUpdate(sql);

            ResultSet rs = null;
            
            
            int genre_id = 0, actor_id = 0;
            for (int i = 0; i < genre.size(); ++i) {
                rs = null;
                genre_id = 0;
                sql = "INSERT INTO genre(GENRE_NAME) VALUES('" + genre.get(i) + "')\n"
                        + "ON DUPLICATE KEY UPDATE GENRE_NAME = '" + genre.get(i) + "';";
                affectedRows = stmt.executeUpdate(sql);

                rs = stmt.executeQuery("SELECT GENRE_ID FROM genre WHERE GENRE_NAME = '" + genre.get(i) + "';");
                if (rs.next()) {
                    genre_id = rs.getInt(1);
                }

                sql = "INSERT INTO genre_movie(GENRE_ID,MOVIE_ID) VALUES(" + genre_id + "," + movie_id + ") "
                        + "ON DUPLICATE KEY UPDATE GENRE_ID = "+genre_id+" , MOVIE_ID = "+movie_id;
                affectedRows = stmt.executeUpdate(sql);
            }
            for (int i = 0; i < actors.size(); ++i) {
                rs = null;
                actor_id = 0;
                sql = "INSERT INTO actor(ACTOR_NAME) VALUES('" + actors.get(i) + "')\n"
                        + "ON DUPLICATE KEY UPDATE ACTOR_NAME = '" + actors.get(i) + "';";
                affectedRows = stmt.executeUpdate(sql);

                rs = stmt.executeQuery("SELECT ACTOR_ID FROM actor WHERE ACTOR_NAME = '" + actors.get(i) + "';");
                if (rs.next()) {
                    actor_id = rs.getInt(1);
                }

                sql = "INSERT INTO movie_actors(MOVIE_ID,ACTOR_ID) VALUES(" + movie_id + "," + actor_id + ")"
                        + " ON DUPLICATE KEY UPDATE MOVIE_ID = "+movie_id+" , ACTOR_ID = "+actor_id;
                affectedRows = stmt.executeUpdate(sql);
            }

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
    
    public ArrayList<Movie> browseMovies(String genre,String rating,String order_by) throws SQLException{
        
        Connection connection = DBConnection.getActiveConnection();
         ArrayList<Movie> movies = new ArrayList<>();
        if (connection != null) {

            Statement stmt = connection.createStatement();
            Statement stmt_2 = connection.createStatement();
            // Execute SQL query
            String sql="";
            if(genre.equals("all")){
                 sql="select distinct Movie_ID \n"
                    + " from genre_movie\n"
                    + "  where exists(Select MOVIE_ID from movie where MOVIE_ID = Movie_ID and rating > '"+ Double.parseDouble(rating)+"')";
            }else{
                sql = "select distinct Movie_ID \n"
                    + " from genre_movie\n"
                    + " where GENRE_ID = (Select GENRE_ID  from genre where GENRE_NAME = '"+genre+"' ) \n"
                    + "    AND exists(Select MOVIE_ID from movie where MOVIE_ID = Movie_ID and rating > '"+ Double.parseDouble(rating)+"')";
            }
            ResultSet rs = null;
            int movie_id = 0;
           movies = new ArrayList<>();
            Movie movie = null;
            rs = stmt.executeQuery(sql);
            double reqRating = Double.parseDouble(rating);
            while (rs.next()) {
                movie_id = rs.getInt(1);
                sql ="Select * from movie where MOVIE_ID = "+movie_id+";";
                try (ResultSet result = stmt_2.executeQuery(sql)) {
                    if(result.next()){
                        double movRating = Double.parseDouble(result.getString("RATING"));
                        if(movRating>=reqRating){
                            movie = new Movie();
                            movie.setId(result.getInt("MOVIE_ID"));
                            movie.setName(result.getString("NAME"));
                            movie.setYear(result.getString("YEAR"));
                            movie.setRating(result.getString("RATING"));
                            movie.setSummary(result.getString("SUMMARY"));
                            movie.setTrailerLink(result.getString("TRAILER_LINK"));
                            movie.setRentPrice(result.getString("RENT_PRICE"));
                            movies.add(movie);
                        }
                        
                    }
                }
                
            }
            rs.close();
            connection.close();
            stmt.close();
        
        
        }
        return movies;
    }
    public Movie getMovieDetails(int id){
        
        
        return null;
    }
    public ArrayList<Movie> bestSellingMovies() throws SQLException{
        Connection connection = DBConnection.getActiveConnection();
        ArrayList<Movie> movies = new ArrayList<>();
        if (connection != null) {

            Statement stmt = connection.createStatement();
           
            // Execute SQL query
            String sql = "Select * from movie ORDER BY RENT_PRICE ASC LIMIT 8";
            
            ResultSet result = null;
            
            movies = new ArrayList<>();
            Movie movie = null;
            result = stmt.executeQuery(sql);
           
            while (result.next()) {
                
                movie = new Movie();
                movie.setId(result.getInt("MOVIE_ID"));
                movie.setName(result.getString("NAME"));
                movie.setYear(result.getString("YEAR"));
                movie.setRating(result.getString("RATING"));
                movie.setSummary(result.getString("SUMMARY"));
                movie.setTrailerLink(result.getString("TRAILER_LINK"));
                movie.setRentPrice(result.getString("RENT_PRICE"));
                movies.add(movie);
             }
             
            result.close();
            connection.close();
            stmt.close();

        }
        return movies;
        
        
    }
    public ArrayList<Movie> newReleaseMovies() throws SQLException{
         Connection connection = DBConnection.getActiveConnection();
        ArrayList<Movie> movies = new ArrayList<>();
        if (connection != null) {

            Statement stmt = connection.createStatement();
           
            // Execute SQL query
            String sql = "Select * from movie ORDER BY YEAR DESC LIMIT 8;";
            
            ResultSet result = null;
            int movie_id = 0;
            movies = new ArrayList<>();
            Movie movie = null;
            result = stmt.executeQuery(sql);
           
            while (result.next()) {
                
                movie = new Movie();
                movie.setId(result.getInt("MOVIE_ID"));
                movie.setName(result.getString("NAME"));
                movie.setYear(result.getString("YEAR"));
                movie.setRating(result.getString("RATING"));
                movie.setSummary(result.getString("SUMMARY"));
                movie.setTrailerLink(result.getString("TRAILER_LINK"));
                movie.setRentPrice(result.getString("RENT_PRICE"));
                movies.add(movie);
             }
             
            result.close();
            connection.close();
            stmt.close();

        }
        return movies;
    }
    
    public void addToPayments(int shoppingcart_id,ArrayList<MovieShopping> rent) throws SQLException{
        Connection connection = DBConnection.getActiveConnection();
        if (connection != null) {

            Statement stmt = connection.createStatement();
            Statement stmt_2 = connection.createStatement();
            int order_id = 1;
            ResultSet result = stmt_2.executeQuery("select count(*) from rented_movies");
            if (result.next());
            order_id += result.getInt(1);
            // Execute SQL query

            String sql;
            int movie_id = 0;
            String start = "", end = "";
            for (MovieShopping movie : rent) {
                sql = "INSERT INTO rented_movies(MOVIE_ID,ID,START_DATE,END_DATE,ORDER_ID,RENT_PRICE) VALUES("
                        + movie.getMovie_id() + "," + shoppingcart_id + ",'" + movie.getStartDate() + "','" + movie.getEndDate() + "'," + order_id +",'"+movie.getRentPrice()+"')"
                        + "ON DUPLICATE KEY UPDATE MOVIE_ID = " + movie.getMovie_id() + " ,ID = " + shoppingcart_id + " , RENT_PRICE = '"+movie.getRentPrice() +"';";
                int affectedRows = stmt.executeUpdate(sql);
                if (affectedRows < 1) {
                    String s = "hello world1";
                } else {
                    String s = "hello world2";
                }
            }

            sql = "DELETE FROM shopping_movie WHERE SHOPPINGCART_ID = " + shoppingcart_id;
            int affectedRows = stmt.executeUpdate(sql);
            if (affectedRows < 1) {
                String s = "hello world1";
            } else {
                String s = "hello world2";
            }

            connection.close();
            stmt.close();
        }
    }
    public void addToRentMovies(int shoppingcart_id,ArrayList<MovieShopping> rent) throws SQLException{
        Connection connection = DBConnection.getActiveConnection();
        if (connection != null) {

            Statement stmt = connection.createStatement();
            Statement stmt_2 =connection.createStatement();
            int order_id = 1;
            ResultSet result = stmt_2.executeQuery("select count(*) from rented_movies");
            if(result.next());
                order_id += result.getInt(1);
            // Execute SQL query

            String sql;
            int movie_id=0;
            String start = "", end = "";
            for(MovieShopping movie : rent){
                sql = "INSERT INTO rented_movies(MOVIE_ID,ID,START_DATE,END_DATE,ORDER_ID) VALUES("
                        + movie.getMovie_id() + "," + shoppingcart_id + ",'" + movie.getStartDate() + "','" + movie.getEndDate()+"',"+order_id + ")"
                        + "ON DUPLICATE KEY UPDATE MOVIE_ID = " + movie.getMovie_id() + " ,ID = " + shoppingcart_id + ";";
                int affectedRows = stmt.executeUpdate(sql);
                if (affectedRows < 1) {
                    String s = "hello world1";
                } else {
                    String s = "hello world2";
                }
            }
            
            sql = "DELETE FROM shopping_movie WHERE SHOPPINGCART_ID = "+shoppingcart_id;
            int affectedRows = stmt.executeUpdate(sql);
            if (affectedRows < 1) {
                String s = "hello world1";
            } else {
                String s = "hello world2";
            }
                
            

           

            connection.close();
            stmt.close();
        }
    }
    public void addToCart(int movie_id, int shoppingcart_id) throws SQLException, ParseException{
        Connection connection = DBConnection.getActiveConnection();
        if (connection != null) {

            Statement stmt = connection.createStatement();
            // Execute SQL query

            String sql;
            String start="",end="";
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            
            Calendar calobj = Calendar.getInstance();
            start = df.format(calobj.getTime());
            calobj.setTime(df.parse(start));
            calobj.add(Calendar.DATE, 30);  // number of days to add
            end = df.format(calobj.getTime());
            sql = "INSERT INTO shopping_movie(MOVIE_ID,SHOPPINGCART_ID,START_DATE,END_DATE) VALUES("
                    + movie_id + "," + shoppingcart_id + ",'" + start+"','"+end+"') "
                    + "ON DUPLICATE KEY UPDATE MOVIE_ID = "+movie_id+" ,SHOPPINGCART_ID = "+ shoppingcart_id+";";

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
    
    public ArrayList<MovieShopping> getShoppingCart(int shoppingcart_id) throws SQLException{
       
        Connection connection = DBConnection.getActiveConnection();
        ArrayList<MovieShopping> movies = new ArrayList<>();
        if (connection != null) {

            Statement stmt = connection.createStatement();
            Statement stmt_2 = connection.createStatement();
           
            // Execute SQL query
            String sql = "Select * from shopping_movie where SHOPPINGCART_ID = "+shoppingcart_id;
            String sql2 ="";
            ResultSet result = null;
            int movie_id = 0;
           
            MovieShopping movie = null;
            result = stmt.executeQuery(sql);
            
            while (result.next()) {
                movie = new MovieShopping();
                movie_id = result.getInt("MOVIE_ID");
                sql2 = "Select * FROM movie where MOVIE_ID =  "+movie_id;
                ResultSet result_2 = stmt_2.executeQuery(sql2);
                if(result_2.next()){
                    movie.setMovie_name(result_2.getString("NAME"));
                    movie.setRentPrice(result_2.getString("RENT_PRICE"));
                }
                result_2.close();
                movie.setMovie_id(result.getInt("MOVIE_ID"));
                movie.setShoppingcart_id(result.getInt("SHOPPINGCART_ID"));
                movie.setStartDate(result.getString("START_DATE"));
                movie.setEndDate(result.getString("END_DATE"));
                movies.add(movie);
                }

            
            result.close();
            connection.close();
            stmt.close();
        }
        
        return movies;
       
    }
   
    public ArrayList<Order> getLateCustomers(){
        return null;
    }
    public ArrayList<Order> getPayments() throws SQLException{
        Connection connection = DBConnection.getActiveConnection();
        ArrayList<MovieShopping> movies = new ArrayList<>();
        ArrayList<Order> orders =  new ArrayList<Order>();
        if (connection != null) {

            Statement stmt = connection.createStatement();
            Statement stmt_2 = connection.createStatement();

            // Execute SQL query
            String sql = "Select DISTINCT ORDER_ID FROM rented_movies where " + "IS_ACCEPT = 0" ;
            String sql2 = "";
            ResultSet result = null;
            double order_price = 0;
            int movie_id = 0,order_id;

            MovieShopping movie = null;
           
            result = stmt.executeQuery(sql);

            while (result.next()) {
                movie = new MovieShopping();
                
                order_id = result.getInt("ORDER_ID");
                Order  currentOrder = new Order();
                currentOrder.setOrder_id(order_id);
                sql2 = "Select * FROM rented_movies where ORDER_ID =  " + order_id;
                ResultSet result_2 = stmt_2.executeQuery(sql2);
                ArrayList<Integer> moviesIDs = new ArrayList<>();
                while (result_2.next()) {
                    
                    moviesIDs.add(result_2.getInt("MOVIE_ID"));
                    order_price += Double.parseDouble(result_2.getString("RENT_PRICE"));
                }
                currentOrder.setMovies_ids(moviesIDs);
                currentOrder.setTotal(order_price);
                order_price = 0;
                result_2.close();
                orders.add(currentOrder);
            }

            result.close();
            connection.close();
            stmt.close();
        }

        return orders;
    }
    public ArrayList<MovieShopping> getRentedMovies(int id) throws SQLException{
        Connection connection = DBConnection.getActiveConnection();
        ArrayList<MovieShopping> movies = new ArrayList<>();
        if (connection != null) {

            Statement stmt = connection.createStatement();
            Statement stmt_2 = connection.createStatement();

            // Execute SQL query
            String sql = "Select * from rented_movies where ID = " + id+" AND IS_ACCEPT = "+1;
            String sql2 = "";
            ResultSet result = null;
            int movie_id = 0;

            MovieShopping movie = null;
            result = stmt.executeQuery(sql);

            while (result.next()) {
                movie = new MovieShopping();
                movie_id = result.getInt("MOVIE_ID");
                sql2 = "Select * FROM movie where MOVIE_ID =  " + movie_id;
                ResultSet result_2 = stmt_2.executeQuery(sql2);
                if (result_2.next()) {
                    movie.setMovie_name(result_2.getString("NAME"));
                    movie.setRentPrice(result_2.getString("RENT_PRICE"));
                }
                result_2.close();
                movie.setMovie_id(result.getInt("MOVIE_ID"));
                movie.setShoppingcart_id(result.getInt("ID"));
                movie.setStartDate(result.getString("START_DATE"));
                movie.setEndDate(result.getString("END_DATE"));
                movies.add(movie);
            }

            result.close();
            connection.close();
            stmt.close();
        }

        return movies;
    }
    
    public void acceptPayments(int order_id) throws SQLException{
        Connection connection = DBConnection.getActiveConnection();
        if (connection != null) {

            Statement stmt = connection.createStatement();
            // Execute SQL query
            int accept = 1;
            String sql;
            sql = "UPDATE rented_movies SET IS_ACCEPT = "+accept
                    + " WHERE ORDER_ID = "+order_id;

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
    public void rejectPayments(int order_id) throws SQLException{
        Connection connection = DBConnection.getActiveConnection();
        if (connection != null) {

            Statement stmt = connection.createStatement();
            // Execute SQL query

            String sql;
            sql = "DELETE FROM rented_movies WHERE ORDER_ID = "+order_id;

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
