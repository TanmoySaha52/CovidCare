/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.servlet;

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

/**
 *
 * @author USER
 */
public class AddMedicalSupplies extends HttpServlet {

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
        String mname = request.getParameter("mname");
        String mlink = request.getParameter("mlink");
        String mprice = request.getParameter("mprice");
         String mdate = request.getParameter("mdate");
        Connection conn = null;

        InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");
        try (PrintWriter out = response.getWriter()) {
         
             conn = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);

            int r = 0;

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from medicalsupplies where medName='" + mname + "'");

            if (rs.next()) {
                System.out.println("Medical Item Already Present");
                out.print("<script>alert('Medical Item Already Present'); window.location.href='EditItem.jsp';</script>");
            } else {

                PreparedStatement ps = conn.prepareStatement("insert into medicalsupplies(medName, price, status, imgLink, expirationDate) values (?,?,?,?,?)");
                ps.setString(1, mname);
                ps.setString(2, mprice);
                ps.setString(3, "Available");
                ps.setString(4, mlink);
                 ps.setString(5, mdate);

                r = ps.executeUpdate();
                if (r > 0) {
                    System.out.println("Medical Item added SUCCESSFULLY");
                    out.print("<script>alert('Medical Item Added Successfully!!'); window.location.href='EditItem.jsp';</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("EditItem.jsp");
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
