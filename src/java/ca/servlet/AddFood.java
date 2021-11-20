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
 * @author hp
 */
public class AddFood extends HttpServlet {

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
        String fname = request.getParameter("fname");
        String flink = request.getParameter("flink");
        String fprice = request.getParameter("fprice");
        Connection conn = null;

        InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");

        try (PrintWriter out = response.getWriter()) {
            conn = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);

            int r = 0;

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from foodmenu where foodName='" + fname + "'");

            if (rs.next()) {
                System.out.println("Food Item Already Present");
                out.print("<script>alert('Food Item Already Present'); window.location.href='EditItem.jsp';</script>");
            } else {

                PreparedStatement ps = conn.prepareStatement("insert into foodmenu(foodName, price, status, imgLink) values (?,?,?,?)");
                ps.setString(1, fname);
                ps.setString(2, fprice);
                ps.setString(3, "Available");
                ps.setString(4, flink);

                r = ps.executeUpdate();
                if (r > 0) {
                    System.out.println("Food Item added SUCCESSFULLY");
                    out.print("<script>alert('Food Item Added Successfully!!'); window.location.href='EditItem.jsp';</script>");
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
