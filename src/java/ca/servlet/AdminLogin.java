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
public class AdminLogin extends HttpServlet {

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
        String adminId = request.getParameter("adminId");
        String password = request.getParameter("password");
        try (PrintWriter out = response.getWriter()) {
                        InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");
            System.out.println(inputFile);

            Connection con = null;
            try {
                con = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);
                //con = ConnectionProviderToDB.getConnectionObject().getConnection("D:\\Documents\\NetBeansProjects\\EAMS\\config\\db_params.properties");
                PreparedStatement ps = con.prepareStatement("select * from admin where adminId=? and password=?");
                ps.setString(1, adminId);
                ps.setString(2, password);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    System.out.println("Login Successful...........");
                    RequestDispatcher rd = request.getRequestDispatcher("AdminHome.jsp");
                    HttpSession session = request.getSession();
              
                    session.setAttribute("adminId", adminId);
                    session.setAttribute("adminName", rs.getString("adminName"));
                    rd.forward(request, response);

                } else {
                    //failed validation
                    System.out.println("Login Not Successful...........");
                    out.print("<script>alert('Invalid Input'); window.location.href='AdminLogin.jsp';</script>");
                    request.setAttribute("error", "Invalid Username or Password");
                    RequestDispatcher rd = request.getRequestDispatcher("AdminLogin.jsp");
                    rd.include(request, response);
                }

            } catch (Exception e) {
                System.out.println(e);
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
