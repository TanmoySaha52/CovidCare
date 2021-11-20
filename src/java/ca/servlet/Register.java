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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
public class Register extends HttpServlet {

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
        Connection conn = null;
        InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");
        try (PrintWriter out = response.getWriter()) {
            User newUser = new User();

            newUser.setUserName(request.getParameter("name"));
            newUser.setPhoneNo(request.getParameter("phone"));
            newUser.setAddress(request.getParameter("address"));
            newUser.setPassword(request.getParameter("password"));

            
            conn = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from user where phoneNo='" + newUser.getPhoneNo() + "'");

            if (rs.next()) {
                System.out.println("Email Address Already Present");
                out.print("<script>alert('Phone number Already Present'); window.location.href='HomeLogin.jsp';</script>");
            } else {

                PreparedStatement ps = conn.prepareStatement("insert into user(userName, phoneNo, address, password, creditPoints) values (?,?,?,?,?)");
                ps.setString(1, newUser.getUserName());
                ps.setString(2, newUser.getPhoneNo());
                ps.setString(3, newUser.getAddress());
                ps.setString(4, newUser.getPassword());
                ps.setInt(5, 100);

                int r = ps.executeUpdate();

                if (r > 0) {
                    System.out.println("New user created SUCCESSFULLY");

                   out.print("<script>alert('Registration Successful'); window.location.href='HomeLogin.jsp';</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("HomeLogin.jsp");
                    rd.include(request, response);
                } else {
                    System.out.println("New user creation FAILED");
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                System.out.println(ex);
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
