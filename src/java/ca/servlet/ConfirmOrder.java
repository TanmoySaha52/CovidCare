/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.servlet;

import ca.bean.User;
import ca.utilities.ConnectionProviderToDB;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
public class ConfirmOrder extends HttpServlet {

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
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
       int userId = Integer.parseInt(request.getParameter("userId"));
           String type = request.getParameter("type");
           String address = request.getParameter("address");
           String totalPrice = request.getParameter("totalPrice");
           int cp = Integer.parseInt(request.getParameter("cp"));
           String status = "Order Placed";
           System.out.println(userId);
            System.out.println(cp);
             System.out.println(totalPrice);
            Connection conn = null;

        InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");
        try (PrintWriter out = response.getWriter()) {
           conn = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);
           PreparedStatement ps = conn.prepareStatement("INSERT into covid_assistant.order(userId, orderType, totalPrice, status, address, orderDate) values (?,?,?,?,?,CURDATE())");
            ps.setInt(1, userId);
            ps.setString(2, type);
            ps.setString(3, totalPrice);
            ps.setString(4, status);
            ps.setString(5, address );
            int r = 0;
            r = ps.executeUpdate();
System.out.println(userId);
            
                    if (r > 0) {
                        System.out.println("Order Placed");
                         PreparedStatement ps1 = conn.prepareStatement("Update covid_assistant.user SET creditPoints=? WHERE userId=?");
                         ps1.setInt(1, cp);
                         ps1.setInt(2, userId);
                         int r1 = 0;
                         r1 = ps1.executeUpdate();
                         System.out.println(userId);
            
                         if(r1 > 0){
                             User user = (User) request.getSession().getAttribute("user");
                             cp = cp + 25;
                             user.setCreditPoints(cp);
                        request.setAttribute("userId", userId);
                        System.out.println(userId);
           
                        RequestDispatcher rd = request.getRequestDispatcher("MyOrders.jsp");
                        rd.forward(request, response);
                         }
                    } else {
                        System.out.println("Order Failed");
                    }
        }catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConfirmOrder.class.getName()).log(Level.SEVERE, null, ex);
            }
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
