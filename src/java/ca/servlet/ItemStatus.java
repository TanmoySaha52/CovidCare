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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
public class ItemStatus extends HttpServlet {

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
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        String category = request.getParameter("category");
        Connection con = null;

        InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");
//            System.out.println(inputFile);

        try (PrintWriter out = response.getWriter()) {
            con = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);
            if (category.equals("food")) {
                PreparedStatement ps = con.prepareStatement("SELECT status FROM covid_assistant.foodmenu WHERE foodId=?");
                ps.setInt(1, itemId);
                ResultSet rs = ps.executeQuery();
                PreparedStatement psf1 = null;
                //System.out.println(category);
                if (rs.next()) {
                    String status = rs.getString("status");
                    if (status.equals("Available")) {
                        System.out.println(category);
                        psf1 = con.prepareStatement("UPDATE covid_assistant.foodmenu SET status=? WHERE foodId=?");
                        psf1.setString(1, "Not Available");
                        psf1.setInt(2, itemId);
                    } else {
                        psf1 = con.prepareStatement("UPDATE covid_assistant.foodmenu SET status=? WHERE foodId=?");
                        psf1.setString(1, "Available");
                        psf1.setInt(2, itemId);
                    }
                    int r1 = 0;
                    r1 = psf1.executeUpdate();
                    if (r1 > 0) {
                        System.out.println("Status updated SUCCESSFULLY");
                        out.print("<script>alert('Status Updated!!'); window.location.href='RemoveItem.jsp';</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("RemoveItem.jsp");
                        rd.include(request, response);

                    }
                }
            }
            else{
            PreparedStatement ps = con.prepareStatement("SELECT status FROM covid_assistant.medicalsupplies WHERE medId=?");
                ps.setInt(1, itemId);
                ResultSet rs = ps.executeQuery();
                PreparedStatement psf1 = null;
                //System.out.println(category);
                if (rs.next()) {
                    String status = rs.getString("status");
                    if (status.equals("Available")) {
                        System.out.println(category);
                        psf1 = con.prepareStatement("UPDATE covid_assistant.medicalsupplies SET status=? WHERE medId=?");
                        psf1.setString(1, "Not Available");
                        psf1.setInt(2, itemId);
                    } else {
                        psf1 = con.prepareStatement("UPDATE covid_assistant.medicalsupplies SET status=? WHERE medId=?");
                        psf1.setString(1, "Available");
                        psf1.setInt(2, itemId);
                    }
                    int r1 = 0;
                    r1 = psf1.executeUpdate();
                    if (r1 > 0) {
                        System.out.println("Status updated SUCCESSFULLY");
                        out.print("<script>alert('Status Updated!!'); window.location.href='RemoveItem.jsp';</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("RemoveItem.jsp");
                        rd.include(request, response);

                    }
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                con.close();
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
